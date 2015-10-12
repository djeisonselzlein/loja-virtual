
alter table LSPS_WS_REQUEST_HANDLERS drop constraint FK_s65jik6djlb5eic0qv6b4yrpk;

alter table LSPS_REST_RESOURCES drop constraint FK_jrmcejvb7stvrwpqu6d3tgglr;

alter table LSPS_REPORTS drop constraint FK_7nm5khaodj4hmtesv9l94awvu;

alter table LSPS_TIMER_NOTIFICATIONS drop constraint FK_ng6i84skd6gntvqq1uuaylf94;

alter table LSPS_DOCUMENTS drop constraint FK_20c0w8s92v5a3bkv5rcloi4qq;

alter table LSPS_TODOS drop constraint FK_l7bt6coufivbuaovi3nppqcu7;

alter table LSPS_MODEL_UPDATES drop constraint FK_spbwmt8kfuvkg0c86lllah8c5;

alter table LSPS_LOGS drop constraint FK_imdgkti1qe5sfdudi6nqx7rny;

alter table LSPS_ROLLBACK_ITEMS drop constraint FK_hjsguwmg9l9jx77mkeh7vw95k;

drop table LSPS_ACTIVE_USERS_TRACK;

drop table LSPS_BINARY_DATA;

drop table LSPS_BINARY_DATA_METADATAS;

drop table LSPS_DASHBOARD_TABS;

drop table LSPS_DOCUMENTS;

drop table LSPS_DOCUMENT_CONTENTS;

drop table LSPS_ERROR_MODEL_INSTANCES;

drop table LSPS_LOCKS;

drop table LSPS_LOGS;

drop table LSPS_MIGRATIONS;

drop table LSPS_MODEL_INSTANCES;

drop table LSPS_MODEL_INSTANCE_NTFS;

drop table LSPS_MODEL_INSTANCE_PROPERTIES;

drop table LSPS_MODEL_INSTANCE_STATES;

drop table LSPS_MODEL_UPDATES;

drop table LSPS_MODEL_UPDATE_LOGS;

drop table LSPS_MODULES;

drop table LSPS_MODULE_ENTRIES;

drop table LSPS_MODULE_IMPORTS;

drop table LSPS_MONITORING_PERFORMERS;

drop table LSPS_PERSONS;

drop table LSPS_PERSON_DETAILS;

drop table LSPS_PERSON_SETTINGS;

drop table LSPS_PROCESSES;

drop table LSPS_PROCESS_ELEMENTS;

drop table LSPS_PROCESS_LOGS;

drop table LSPS_PROCESS_RELATIONSHIPS;

drop table LSPS_REPORTS;

drop table LSPS_REPORT_METADATAS;

drop table LSPS_REST_RESOURCES;

drop table LSPS_RIGHTS;

drop table LSPS_ROLES;

drop table LSPS_ROLE_NAMES;

drop table LSPS_ROLLBACK_ITEMS;

drop table LSPS_SAVED_DOCUMENTS;

drop table LSPS_SECURITY_ROLES;

drop table LSPS_SETTINGS;

drop table LSPS_SUBSTITUTES;

drop table LSPS_TIMER_NOTIFICATIONS;

drop table LSPS_TIME_PERIODS;

drop table LSPS_TIME_PERIOD_ITEMS;

drop table LSPS_TIME_UNITS;

drop table LSPS_TODOS;

drop table LSPS_TODO_CONTENTS;

drop table LSPS_TODO_ESCALATIONS;

drop table LSPS_TODO_PERFORMERS;

drop table LSPS_TODO_REJECTIONS;

drop table LSPS_UNPROCESSED_INPUTS;

drop table LSPS_USER_ROLES;

drop table LSPS_USER_SECURITY_ROLES;

drop table LSPS_VAADIN_THEMES;

drop table LSPS_WS_REQUEST_HANDLERS;

drop sequence LSPS_SEQ restrict;

drop function LSPS_ADD_SECONDS;
drop function LSPS_DIFF_SECONDS;
