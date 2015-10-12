
alter table LSPS_WS_REQUEST_HANDLERS drop constraint FK_s65jik6djlb5eic0qv6b4yrpk;

alter table LSPS_REST_RESOURCES drop constraint FK_jrmcejvb7stvrwpqu6d3tgglr;

alter table LSPS_REPORTS drop constraint FK_7nm5khaodj4hmtesv9l94awvu;

alter table LSPS_TIMER_NOTIFICATIONS drop constraint FK_ng6i84skd6gntvqq1uuaylf94;

alter table LSPS_DOCUMENTS drop constraint FK_20c0w8s92v5a3bkv5rcloi4qq;

alter table LSPS_TODOS drop constraint FK_l7bt6coufivbuaovi3nppqcu7;

alter table LSPS_MODEL_UPDATES drop constraint FK_spbwmt8kfuvkg0c86lllah8c5;

alter table LSPS_LOGS drop constraint FK_imdgkti1qe5sfdudi6nqx7rny;

alter table LSPS_ROLLBACK_ITEMS drop constraint FK_hjsguwmg9l9jx77mkeh7vw95k;

drop table LSPS_ACTIVE_USERS_TRACK cascade constraints;

drop table LSPS_BINARY_DATA cascade constraints;

drop table LSPS_BINARY_DATA_METADATAS cascade constraints;

drop table LSPS_DASHBOARD_TABS cascade constraints;

drop table LSPS_DOCUMENTS cascade constraints;

drop table LSPS_DOCUMENT_CONTENTS cascade constraints;

drop table LSPS_ERROR_MODEL_INSTANCES cascade constraints;

drop table LSPS_LOCKS cascade constraints;

drop table LSPS_LOGS cascade constraints;

drop table LSPS_MIGRATIONS cascade constraints;

drop table LSPS_MODEL_INSTANCES cascade constraints;

drop table LSPS_MODEL_INSTANCE_NTFS cascade constraints;

drop table LSPS_MODEL_INSTANCE_PROPERTIES cascade constraints;

drop table LSPS_MODEL_INSTANCE_STATES cascade constraints;

drop table LSPS_MODEL_UPDATES cascade constraints;

drop table LSPS_MODEL_UPDATE_LOGS cascade constraints;

drop table LSPS_MODULES cascade constraints;

drop table LSPS_MODULE_ENTRIES cascade constraints;

drop table LSPS_MODULE_IMPORTS cascade constraints;

drop table LSPS_MONITORING_PERFORMERS cascade constraints;

drop table LSPS_PERSONS cascade constraints;

drop table LSPS_PERSON_DETAILS cascade constraints;

drop table LSPS_PERSON_SETTINGS cascade constraints;

drop table LSPS_PROCESSES cascade constraints;

drop table LSPS_PROCESS_ELEMENTS cascade constraints;

drop table LSPS_PROCESS_LOGS cascade constraints;

drop table LSPS_PROCESS_RELATIONSHIPS cascade constraints;

drop table LSPS_REPORTS cascade constraints;

drop table LSPS_REPORT_METADATAS cascade constraints;

drop table LSPS_REST_RESOURCES cascade constraints;

drop table LSPS_RIGHTS cascade constraints;

drop table LSPS_ROLES cascade constraints;

drop table LSPS_ROLE_NAMES cascade constraints;

drop table LSPS_ROLLBACK_ITEMS cascade constraints;

drop table LSPS_SAVED_DOCUMENTS cascade constraints;

drop table LSPS_SECURITY_ROLES cascade constraints;

drop table LSPS_SETTINGS cascade constraints;

drop table LSPS_SUBSTITUTES cascade constraints;

drop table LSPS_TIMER_NOTIFICATIONS cascade constraints;

drop table LSPS_TIME_PERIODS cascade constraints;

drop table LSPS_TIME_PERIOD_ITEMS cascade constraints;

drop table LSPS_TIME_UNITS cascade constraints;

drop table LSPS_TODOS cascade constraints;

drop table LSPS_TODO_CONTENTS cascade constraints;

drop table LSPS_TODO_ESCALATIONS cascade constraints;

drop table LSPS_TODO_PERFORMERS cascade constraints;

drop table LSPS_TODO_REJECTIONS cascade constraints;

drop table LSPS_UNPROCESSED_INPUTS cascade constraints;

drop table LSPS_USER_ROLES cascade constraints;

drop table LSPS_USER_SECURITY_ROLES cascade constraints;

drop table LSPS_VAADIN_THEMES cascade constraints;

drop table LSPS_WS_REQUEST_HANDLERS cascade constraints;

drop sequence LSPS_SEQ;

drop function LSPS_ADD_SECONDS;
drop function LSPS_DIFF_SECONDS;
