/*
 *********************************************************************

 $Id$


 Copyright (c) 2007-2014 Whitestein Technologies AG,
 Riedstrasse 13, CH-6330 Cham, Switzerland.
 All rights reserved.

 This software is confidential and proprietary information of
 Whitestein Technologies AG.
 You shall not disclose this confidential information and shall use
 it only in accordance with the terms of the license agreement you
 entered into with Whitestein Technologies AG.
 The use of this file in source or binary form requires a written
 license from Whitestein Technologies AG.
 *********************************************************************
 */
package com.selzlein.lojavirtual.vaadin.core;

import java.util.List;

import javax.ejb.EJB;

import com.vaadin.navigator.Navigator;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewDisplay;
import com.vaadin.server.FontAwesome;
import com.vaadin.ui.Button;
import com.vaadin.ui.Component;
import com.vaadin.ui.CssLayout;
import com.vaadin.ui.CustomLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.UI;
import com.selzlein.lojavirtual.vaadin.page.DocumentsView;
import com.selzlein.lojavirtual.vaadin.page.RunModelView;
import com.selzlein.lojavirtual.vaadin.page.TodoListView;
import com.whitestein.lsps.common.ErrorException;
import com.whitestein.lsps.engine.EngineRights;
import com.whitestein.lsps.engine.dto.ModuleCriteria;
import com.whitestein.lsps.engine.dto.ModuleList;
import com.whitestein.lsps.engine.ejb.ModelManagementServiceLocal;
import com.whitestein.lsps.human.HumanRights;
import com.whitestein.lsps.human.dto.DocumentInfo;
import com.whitestein.lsps.human.dto.TodoListCriteria;
import com.whitestein.lsps.human.ejb.GenericDocumentServiceLocal;
import com.whitestein.lsps.human.ejb.TodoServiceLocal;
import com.whitestein.lsps.vaadin.util.UserInfo;

/**
 * The main layout of the application. Uses {@link CustomLayout} so that the
 * layout is easily customizable and themeable. Implements {@link ViewDisplay}
 * so that it can be used directly with {@link Navigator}.
 * 
 * @author mhi
 */
public class AppLayout extends HorizontalLayout implements ViewDisplay {

	private static final long serialVersionUID = 1L;

	private CssLayout contentArea = new CssLayout();
	private CssLayout menuArea = new CssLayout();

	private NavigationMenu menu = new NavigationMenu();

	private LspsUI ui = (LspsUI) UI.getCurrent();
	private UserInfo user = ui.getUser();

	private Integer todoBadge = new Integer(0), documentBadge = new Integer(0), runModelBadge = new Integer(0);
	private Button todoMenuItem, documentMenuItem, runModelMenuItem;

	@EJB
	private TodoServiceLocal todoService;

	@EJB
	private GenericDocumentServiceLocal documentService;

	@EJB
	private ModelManagementServiceLocal modelManagementService;

	/**
	 * Caches a list of documents the user has access to.
	 */
	private transient List<DocumentInfo> cachedDocuments;

	/**
	 * Constructor. Creates main application layout.
	 */
	public AppLayout() {
		setSizeFull();

		menuArea.setPrimaryStyleName("valo-menu");
		menuArea.setId("navigation");

		contentArea.setPrimaryStyleName("valo-content");
		contentArea.addStyleName("v-scrollable");
		contentArea.setSizeFull();

		addComponents(menuArea, contentArea);
		setExpandRatio(contentArea, 1);
	}

	@Override
	public void attach() {
		menuArea.addComponent(menu);
		calculateBadges();
		buildMenu();
	}

	private void calculateBadges() {
		todoBadge = (int) todoService.getTodoList(new TodoListCriteria()).getTotal();
		try {
			documentBadge = documentService.getAllDocuments().size();
		} catch (ErrorException e) {
			throw new RuntimeException(e);
		}
		ModuleCriteria criteria = new ModuleCriteria();
		criteria.setIncludeImports(false);
		criteria.setIncludeExecutableOnly(true);
		criteria.setIncludeLatestOnly(true);
		ModuleList findModules = modelManagementService.findModules(criteria);
		runModelBadge = (int) findModules.getTotal();
	}

	private void buildMenu() {
		if (user.hasRight(HumanRights.READ_ALL_TODO) || user.hasRight(HumanRights.READ_OWN_TODO)) {
			todoMenuItem = menu.addViewMenuItem(TodoListView.TITLE, TodoListView.ID, FontAwesome.LIST, todoBadge);
		}
		if (user.hasRight(HumanRights.ACCESS_DOCUMENTS)) {
			documentMenuItem = menu.addViewMenuItem(DocumentsView.TITLE, DocumentsView.ID, FontAwesome.FILE_TEXT_O, documentBadge);

		}
		if (user.hasRight(EngineRights.READ_MODEL) && user.hasRight(EngineRights.CREATE_MODEL_INSTANCE)) {
			runModelMenuItem = menu.addViewMenuItem(RunModelView.TITLE, RunModelView.ID, FontAwesome.CARET_SQUARE_O_RIGHT, runModelBadge);
		}

		// Examples:
		// 1. add link to a custom document but only if the user has rights to access it.
		//		if (hasRightToOpenDocument("ExampleModule::exampleDoc")) {
		//			menu.addDocumentItem("example", "ExampleModule::exampleDoc", null, FontAwesome.ADN, null);
		//		}

		// 2. run model instance
		//		menu.addRunModelItem("example2", "ExampleModule", null, FontAwesome.ADJUST, null);

		// 3. menu separator
		//		menu.addMenuSeparator("example", 123);
	}

	private boolean hasRightToOpenDocument(String documentId) {
		if (cachedDocuments == null) {
			try {
				cachedDocuments = documentService.getAllDocuments();
			} catch (ErrorException e) {
				throw new RuntimeException(e);
			}
		}
		for (DocumentInfo document : cachedDocuments) {
			if (documentId.equals(document.getId())) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Refresh menu badges
	 */
	public void refreshBadges() {
		calculateBadges();
		menu.refreshBadge(todoMenuItem, todoBadge);
		menu.refreshBadge(documentMenuItem, documentBadge);
		menu.refreshBadge(runModelMenuItem, runModelBadge);
	}

	@Override
	public void showView(View view) {
		contentArea.removeAllComponents();
		contentArea.addComponent((Component) view);
	}

	/**
	 * Called when view changes.
	 * 
	 * @param viewId
	 */
	public void viewChanged(String viewId) {
		menu.setActiveMenuItem(viewId);
		refreshBadges();
	}
}
