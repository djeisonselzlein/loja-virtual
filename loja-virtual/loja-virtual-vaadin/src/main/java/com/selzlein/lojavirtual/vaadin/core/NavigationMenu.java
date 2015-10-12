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

import java.util.HashMap;
import java.util.Map;

import com.vaadin.server.FontAwesome;
import com.vaadin.server.ThemeResource;
import com.vaadin.shared.ui.label.ContentMode;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.CssLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.MenuBar;
import com.vaadin.ui.MenuBar.Command;
import com.vaadin.ui.MenuBar.MenuItem;
import com.vaadin.ui.UI;
import com.vaadin.ui.themes.ValoTheme;
import com.selzlein.lojavirtual.vaadin.page.DocumentView;
import com.selzlein.lojavirtual.vaadin.page.SettingsView;
import com.selzlein.lojavirtual.vaadin.util.ModelRunner;
import com.whitestein.lsps.vaadin.util.UserInfo;

/**
 * Menu bar that supports localization and makes adding application views and
 * LSPS documents easier.
 */
public class NavigationMenu extends CssLayout {

	private static final long serialVersionUID = 1L;

	private static final String MENU_MOBILE = "l-menu-mobile";
	private static final String MENU_TABLET = "l-menu-tablet";

	private LspsUI ui = (LspsUI) UI.getCurrent();
	private UserInfo user = ui.getUser();

	private CssLayout mainMenu = new CssLayout();
	private Button activeItem = null;

	private Map<String, Button> menuItems = new HashMap<String, Button>();

	private MenuItem mobileMenuStyleItem, tabletMenuStyleItem, desktopMenuStyleItem;

	/**
	 * Constructor. Builds navigation menu structure.
	 */
	public NavigationMenu() {
		this.setPrimaryStyleName("valo-menu-part");

		buildTopMenu();
		buildUserMenu();
		buildMainMenu();
		applyMenuStyles();
	}

	private void buildTopMenu() {
		final HorizontalLayout top = new HorizontalLayout();
		top.setWidth("100%");
		top.setDefaultComponentAlignment(Alignment.MIDDLE_LEFT);
		top.addStyleName("valo-menu-title");
		final Label title = new Label("<h3>LSPS <strong>ProcessApplication</strong></h3>", ContentMode.HTML);
		title.setSizeUndefined();
		top.addComponent(title);
		top.setExpandRatio(title, 1);
		this.addComponent(top);

		final NavigationMenu menuWrapp = this;
		final Button showMenu = new Button("Menu", new ClickListener() {

			private static final long serialVersionUID = 1L;

			@Override
			public void buttonClick(final ClickEvent event) {
				if (menuWrapp.getStyleName().contains("valo-menu-visible")) {
					menuWrapp.removeStyleName("valo-menu-visible");
				} else {
					menuWrapp.addStyleName("valo-menu-visible");
				}
			}
		});
		showMenu.addStyleName(ValoTheme.BUTTON_PRIMARY);
		showMenu.addStyleName(ValoTheme.BUTTON_SMALL);
		showMenu.addStyleName("valo-menu-toggle");
		showMenu.setIcon(FontAwesome.LIST);
		this.addComponent(showMenu);
	}

	private void buildUserMenu() {
		Command logoutCmd = new Command() {

			private static final long serialVersionUID = 1L;

			@Override
			public void menuSelected(MenuItem selectedItem) {
				ui.logout();
			}
		};
		Command settingsCmd = new Command() {

			private static final long serialVersionUID = 1L;

			@Override
			public void menuSelected(MenuItem selectedItem) {
				ui.navigateTo(SettingsView.ID);
			}
		};
		Command mobileMenu = new Command() {

			private static final long serialVersionUID = 1L;

			@Override
			public void menuSelected(MenuItem selectedItem) {
				removeMenuStyles();
				ui.addStyleName(MENU_MOBILE);
				user.setSetting("l-menu", MENU_MOBILE);
				mobileMenuStyleItem.setStyleName("l-hidden");
			}
		};
		Command tabletMenu = new Command() {

			private static final long serialVersionUID = 1L;

			@Override
			public void menuSelected(MenuItem selectedItem) {
				removeMenuStyles();
				ui.addStyleName(MENU_TABLET);
				user.setSetting("l-menu", MENU_TABLET);
				tabletMenuStyleItem.setStyleName("l-hidden");
			}
		};
		Command desktopMenu = new Command() {

			private static final long serialVersionUID = 1L;

			@Override
			public void menuSelected(MenuItem selectedItem) {
				removeMenuStyles();
				user.setSetting("l-menu", "");
				desktopMenuStyleItem.setStyleName("l-hidden");
			}
		};
		final MenuBar userMenu = new MenuBar();
		userMenu.addStyleName("user-menu");
		final MenuItem userMenuItem = userMenu.addItem(user.getPerson().getFullName(),
				new ThemeResource("../lsps-valo-base/img/profile-pic-300px.jpg"),
				null);
		mobileMenuStyleItem = userMenuItem.addItem("Mobile Menu", mobileMenu);
		tabletMenuStyleItem = userMenuItem.addItem("Tablet Menu", tabletMenu);
		desktopMenuStyleItem = userMenuItem.addItem("Desktop Menu", desktopMenu);
		userMenuItem.addSeparator();
		MenuItem currentItem = userMenuItem.addItem(ui.getMessage(SettingsView.TITLE), settingsCmd);
		currentItem.setStyleName("l-menu-settings");
		currentItem = userMenuItem.addItem(ui.getMessage("nav.logout", ""), logoutCmd);
		currentItem.setStyleName("l-menu-logout");
		this.addComponent(userMenu);
	}

	private void buildMainMenu() {
		mainMenu.setPrimaryStyleName("valo-menuitems");
		this.addComponent(mainMenu);
	}

	private void applyMenuStyles() {
		String menuStyleSetting = user.getSettingString("l-menu", "");
		ui.addStyleName(menuStyleSetting);
		if (menuStyleSetting.equals("")) {
			desktopMenuStyleItem.setStyleName("l-hidden");
		}
		if (menuStyleSetting.equals(MENU_TABLET)) {
			tabletMenuStyleItem.setStyleName("l-hidden");
		}
		if (menuStyleSetting.equals(MENU_MOBILE)) {
			mobileMenuStyleItem.setStyleName("l-hidden");
		}
	}

	/**
	 * Adds menu separator item.
	 * Possible to add number badge for this item for showing active to-dos for example.
	 * 
	 * @param titleKey
	 * @param badgeValue number that will appear in upper right corner of menu item
	 */
	public void addMenuSeparator(String titleKey, Integer badgeValue) {
		Label label = new Label(ui.getMessage(titleKey), ContentMode.HTML);
		if (badgeValue != null) {
			label.setValue(label.getValue()
					+ "<span class=\"valo-menu-badge\">" + badgeValue
					+ "</span>");
		}
		label.setPrimaryStyleName("valo-menu-subtitle");
		label.addStyleName("h4");
		label.setSizeUndefined();
		mainMenu.addComponent(label);
	}

	private Button addMenuItem(String titleKey, FontAwesome icon, String viewId, ClickListener action, Integer badgeValue) {
		Button b = new Button(ui.getMessage(titleKey), action);
		if (badgeValue != null) {
			b.setCaption(b.getCaption()
					+ "<span class=\"valo-menu-badge\">" + badgeValue + "</span>");
		}
		b.setIcon(icon);
		b.setPrimaryStyleName("valo-menu-item");
		b.setHtmlContentAllowed(true);
		mainMenu.addComponent(b);
		if (viewId != null) {
			menuItems.put(viewId, b);
		}
		return b;
	}

	/**
	 * Adds menu item for opening views based on viewId.
	 * Possible to add number badge for this item for showing active to-dos for example.
	 * 
	 * @param titleKey
	 * @param viewId
	 * @param icon
	 * @param badgeValue number that will appear in upper right corner of menu item
	 * @return menuItem
	 */
	public Button addViewMenuItem(String titleKey, final String viewId, FontAwesome icon, Integer badgeValue) {
		return addMenuItem(titleKey, icon, viewId, new ClickListener() {

			private static final long serialVersionUID = 1L;

			@Override
			public void buttonClick(ClickEvent event) {
				getUI().getNavigator().navigateTo(viewId);
			}
		}, badgeValue);
	}

	/**
	 * Adds menu item for opening documents with parameters based on documentId.
	 * Possible to add number badge for this item for showing active to-dos for example.
	 * 
	 * @param titleKey
	 * @param documentId
	 * @param parameters
	 * @param icon
	 * @param badgeValue number that will appear in upper right corner of menu item
	 */
	public void addDocumentItem(String titleKey, String documentId, Map<String, String> parameters, FontAwesome icon, Integer badgeValue) {
		final String viewId = DocumentView.getViewId(documentId, parameters);
		addViewMenuItem(titleKey, viewId, icon, badgeValue);
	}

	/**
	 * Adds menu item for running of model based on model name and version.
	 * Possible to add number badge for this item for showing active to-dos for example.
	 * 
	 * @param titleKey
	 * @param modelName
	 * @param modelVersion
	 * @param icon
	 * @param badgeValue 
	 */
	public void addRunModelItem(String titleKey, final String modelName, final String modelVersion, FontAwesome icon, Integer badgeValue) {
		addMenuItem(titleKey, icon, null, new ClickListener() {

			private static final long serialVersionUID = 1L;

			@Override
			public void buttonClick(ClickEvent event) {
				ModelRunner runner = new ModelRunner();
				runner.runModelByName(modelName, modelVersion, ui);
			}
		}, badgeValue);
	}

	/**
	 * Sets active menu item based on current viewId
	 * 
	 * @param viewId
	 */
	public void setActiveMenuItem(String viewId) {
		Button button = menuItems.get(viewId);
		if (button == null) {
			return;
		}
		if (activeItem != null) {
			activeItem.removeStyleName("selected");
		}
		button.addStyleName("selected");
		activeItem = button;
	}

	/**
	 * Sets new value to menuItem badge.
	 * 
	 * @param menuItem
	 * @param badgeValue 
	 */
	public void refreshBadge(Button menuItem, Integer badgeValue) {
		if ((badgeValue != null) && (menuItem != null)) {
			String cleanCaption = menuItem.getCaption().substring(0, menuItem.getCaption().indexOf("<span"));
			menuItem.setCaption(cleanCaption
					+ "<span class=\"valo-menu-badge\">" + badgeValue + "</span>");
		}
	}

	private void removeMenuStyles() {
		ui.removeStyleName(MENU_MOBILE);
		ui.removeStyleName(MENU_TABLET);
		mobileMenuStyleItem.setStyleName("");
		tabletMenuStyleItem.setStyleName("");
		desktopMenuStyleItem.setStyleName("");
	}
}
