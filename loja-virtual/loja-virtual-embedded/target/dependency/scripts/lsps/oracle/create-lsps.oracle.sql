
create table LSPS_ACTIVE_USERS_TRACK (
    ID number(19,0) not null,
    DATA blob,
    END_DATE timestamp,
    START_DATE timestamp,
    primary key (ID)
);

create table LSPS_BINARY_DATA (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    CONTENT blob,
    CONTENT_SIZE number(19,0) not null,
    DESCRIPTION varchar2(255 char),
    FILENAME varchar2(255 char),
    MIME varchar2(255 char),
    primary key (ID)
);

create table LSPS_BINARY_DATA_METADATAS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    NAME varchar2(255 char),
    VALUE varchar2(255 char),
    BINARY_DATA_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_DASHBOARD_TABS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    CONFIGURATION blob,
    TITLE varchar2(255 char) not null,
    primary key (ID)
);

create table LSPS_DOCUMENTS (
    ID number(19,0) not null,
    MODULE_ID number(19,0) not null,
    NAME varchar2(50 char) not null,
    TYPE varchar2(20 char) not null,
    primary key (ID)
);

create table LSPS_DOCUMENT_CONTENTS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    CONTENT blob,
    primary key (ID)
);

create table LSPS_ERROR_MODEL_INSTANCES (
    ID number(19,0) not null,
    DATA blob,
    MODEL_INSTANCE_ID number(19,0),
    TYPE varchar2(10 char) not null,
    ROLLBACK_ITEM_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_LOCKS (
    LOCK_NAME varchar2(255 char) not null,
    ENTITY_VERSION number(19,0) not null,
    LOCK_DATE timestamp not null,
    LOCKED number(1,0) not null,
    MESSAGE varchar2(255 char),
    primary key (LOCK_NAME)
);

create table LSPS_LOGS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    DESCRIPTION clob,
    LOG_DATE timestamp not null,
    LOG_LEVEL number(10,0),
    MODEL_INSTANCE_ID number(19,0),
    primary key (ID)
);

create table LSPS_MIGRATIONS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    FAILED_COUNT number(19,0) not null,
    FINISHED_DATE timestamp not null,
    NEW_MODEL_HASH varchar2(255 char) not null,
    NEW_MODEL_ID number(19,0) not null,
    NEW_MODEL_NAME varchar2(255 char),
    NEW_MODEL_VERSION varchar2(255 char),
    OLD_MODEL_HASH varchar2(255 char) not null,
    OLD_MODEL_ID number(19,0) not null,
    OLD_MODEL_NAME varchar2(255 char),
    OLD_MODEL_VERSION varchar2(255 char),
    POSTPROCESSING_MODEL_ID number(19,0) not null,
    PREPROCESSING_MODEL_ID number(19,0) not null,
    STARTED_DATE timestamp not null,
    SUCCESSFUL_COUNT number(19,0) not null,
    TRANSFORM_MODEL_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_MODEL_INSTANCES (
    ID number(19,0) not null,
    FINISHED_DATE timestamp,
    LAST_ALLOCATED_VALUE_ID number(19,0),
    LAST_DETACHMENT_ID number(19,0),
    LIFECYCLE_STATE varchar2(255 char) not null,
    RUNNING number(1,0) not null,
    STARTED_DATE timestamp,
    TYPE varchar2(255 char) not null,
    MODEL_ID number(19,0) not null,
    MODEL_INSTANCE_MIGRATION_ID number(19,0),
    PARENT_ID number(19,0),
    STATE_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_MODEL_INSTANCE_NTFS (
    ID number(19,0) not null,
    NOTIFICATION varchar2(512 char) not null,
    MODEL_INSTANCE_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_MODEL_INSTANCE_PROPERTIES (
    ID number(19,0) not null,
    NAME varchar2(255 char) not null,
    VALUE varchar2(255 char),
    MODEL_INSTANCE_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_MODEL_INSTANCE_STATES (
    ID number(19,0) not null,
    DATA blob,
    TYPE varchar2(10 char) not null,
    primary key (ID)
);

create table LSPS_MODEL_UPDATES (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    FINISHED timestamp,
    MODEL_INSTANCE_ID number(19,0) not null,
    STARTED timestamp not null,
    STATE varchar2(255 char) not null,
    LOG_ID number(19,0) not null,
    MIGRATION_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_MODEL_UPDATE_LOGS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    LOG clob,
    primary key (ID)
);

create table LSPS_MODULES (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    COMPATIBILITY_VERSION varchar2(255 char),
    CREATE_PROCESS_LOG number(1,0) not null,
    DESCRIPTION varchar2(1000 char),
    EXECUTABLE number(1,0) not null,
    HASH varchar2(255 char) not null,
    NAME varchar2(255 char) not null,
    SYSTEM number(1,0) not null,
    UNLOAD_DATE timestamp,
    UPLOAD_DATE timestamp not null,
    VERSION varchar2(255 char) not null,
    primary key (ID)
);

create table LSPS_MODULE_ENTRIES (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    FILENAME varchar2(255 char) not null,
    TYPE varchar2(255 char),
    CONTENT_ID number(19,0) not null,
    MODULE_ID number(19,0),
    primary key (ID)
);

create table LSPS_MODULE_IMPORTS (
    IMPORTING_MODULE_ID number(19,0) not null,
    IMPORTED_MODULE_ID number(19,0) not null,
    primary key (IMPORTING_MODULE_ID, IMPORTED_MODULE_ID)
);

create table LSPS_MONITORING_PERFORMERS (
    ID number(19,0) not null,
    PERSON_ID varchar2(255 char),
    PARAM_NAME0 varchar2(255 char),
    PARAM_NAME1 varchar2(255 char),
    PARAM_NAME2 varchar2(255 char),
    PARAM_NAME3 varchar2(255 char),
    PARAM_NAME4 varchar2(255 char),
    PARAM_NAME5 varchar2(255 char),
    PARAM_NAME6 varchar2(255 char),
    PARAM_NAME7 varchar2(255 char),
    PARAM_NAME8 varchar2(255 char),
    PARAM_NAME9 varchar2(255 char),
    PARAM_VALUE0 varchar2(50 char),
    PARAM_VALUE1 varchar2(50 char),
    PARAM_VALUE2 varchar2(50 char),
    PARAM_VALUE3 varchar2(50 char),
    PARAM_VALUE4 varchar2(50 char),
    PARAM_VALUE5 varchar2(50 char),
    PARAM_VALUE6 varchar2(50 char),
    PARAM_VALUE7 varchar2(50 char),
    PARAM_VALUE8 varchar2(50 char),
    PARAM_VALUE9 varchar2(50 char),
    ROLE_NAME varchar2(255 char),
    TYPE varchar2(20 char) not null,
    DASHBOARD_TAB_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_PERSONS (
    ID varchar2(255 char) not null,
    ACTIVE number(1,0) not null,
    EMAIL varchar2(255 char),
    ENTITY_VERSION number(19,0) not null,
    FIRST_NAME varchar2(255 char),
    LAST_NAME varchar2(255 char),
    LOGIN_NAME varchar2(255 char) not null,
    PASSWORD_HASH varchar2(255 char),
    PASSWORD_SALT varchar2(255 char),
    PHONE varchar2(255 char),
    SUBSTITUTION_ACTIVE number(1,0) not null,
    primary key (ID)
);

create table LSPS_PERSON_DETAILS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    NAME varchar2(255 char) not null,
    VALUE varchar2(255 char) not null,
    PERSON_ID varchar2(255 char) not null,
    primary key (ID)
);

create table LSPS_PERSON_SETTINGS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    CONTENT blob,
    NAME varchar2(255 char) not null,
    PERSON_ID varchar2(255 char) not null,
    primary key (ID)
);

create table LSPS_PROCESSES (
    ID number(19,0) not null,
    ELEMENT_CLASS varchar2(255 char) not null,
    ELEMENT_ID varchar2(255 char) not null,
    NAME varchar2(255 char) not null,
    MODULE_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_PROCESS_ELEMENTS (
    ID number(19,0) not null,
    ELEMENT_CLASS varchar2(255 char) not null,
    ELEMENT_ID varchar2(255 char) not null,
    NAME varchar2(255 char),
    CONTAINER_ID number(19,0),
    PROCESS_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_PROCESS_LOGS (
    ID number(19,0) not null,
    ELEMENT_CLASS varchar2(200 char),
    ELEMENT_ID varchar2(200 char),
    ELEMENT_NAME varchar2(200 char),
    EVENT varchar2(50 char) not null,
    EXECUTION_ID number(19,0),
    ITERATOR_VALUE varchar2(200 char),
    LOG_DATE timestamp not null,
    LOG_INDEX number(19,0) not null,
    MESSAGE varchar2(1000 char),
    MODEL_ID number(19,0) not null,
    MODULE_INSTANCE_ID number(19,0),
    NEW_STATE varchar2(30 char),
    OLD_STATE varchar2(30 char),
    PARENT_MODEL_ELEMENT_ID varchar2(200 char),
    PARENT_PROCESS_INSTANCE_ID number(19,0),
    PROCESS_INSTANCE_ID number(19,0),
    TERMINATION_REASON varchar2(1000 char),
    TOKEN_ID number(19,0),
    MODEL_INSTANCE_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_PROCESS_RELATIONSHIPS (
    ID number(19,0) not null,
    ELEMENT_CLASS varchar2(255 char) not null,
    ELEMENT_ID varchar2(255 char) not null,
    PROCESS_ID number(19,0) not null,
    SOURCE_ID number(19,0) not null,
    TARGET_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_REPORTS (
    ID number(19,0) not null,
    DEFAULT_HEIGHT number(10,0),
    DEFAULT_WIDTH number(10,0),
    DESCRIPTION varchar2(255 char),
    MODULE_ENTRY_ID number(19,0) not null,
    MODULE_ID number(19,0) not null,
    NAME varchar2(50 char) not null,
    DAYS number(10,0),
    HOURS number(10,0),
    MINUTES number(10,0),
    MONTHS number(10,0),
    SECONDS number(10,0),
    WEEKS number(10,0),
    YEARS number(10,0),
    REPORT_ID varchar2(255 char) not null,
    TITLE varchar2(255 char) not null,
    TYPE varchar2(20 char) not null,
    primary key (ID)
);

create table LSPS_REPORT_METADATAS (
    ID number(19,0) not null,
    NAME varchar2(255 char) not null,
    VALUE varchar2(255 char),
    REPORT_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_REST_RESOURCES (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    FULL_URL varchar2(255 char),
    MODEL_INSTANCE_ID number(19,0),
    MODULE_NAME varchar2(255 char),
    URL_FRAGMENT varchar2(255 char),
    VARIABLE_NAME varchar2(255 char),
    PARENT_ID number(19,0),
    primary key (ID)
);

create table LSPS_RIGHTS (
    NAME varchar2(255 char) not null,
    SECURITY_ROLE_ID number(19,0) not null,
    primary key (NAME, SECURITY_ROLE_ID)
);

create table LSPS_ROLES (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    PERSON_ID varchar2(255 char),
    PARAM_VALUE0 varchar2(50 char),
    PARAM_VALUE1 varchar2(50 char),
    PARAM_VALUE2 varchar2(50 char),
    PARAM_VALUE3 varchar2(50 char),
    PARAM_VALUE4 varchar2(50 char),
    PARAM_VALUE5 varchar2(50 char),
    PARAM_VALUE6 varchar2(50 char),
    PARAM_VALUE7 varchar2(50 char),
    PARAM_VALUE8 varchar2(50 char),
    PARAM_VALUE9 varchar2(50 char),
    ROLE_NAME varchar2(255 char),
    primary key (ID)
);

create table LSPS_ROLE_NAMES (
    NAME varchar2(255 char) not null,
    PARAM_NAME0 varchar2(255 char),
    PARAM_NAME1 varchar2(255 char),
    PARAM_NAME2 varchar2(255 char),
    PARAM_NAME3 varchar2(255 char),
    PARAM_NAME4 varchar2(255 char),
    PARAM_NAME5 varchar2(255 char),
    PARAM_NAME6 varchar2(255 char),
    PARAM_NAME7 varchar2(255 char),
    PARAM_NAME8 varchar2(255 char),
    PARAM_NAME9 varchar2(255 char),
    primary key (NAME)
);

create table LSPS_ROLLBACK_ITEMS (
    ID number(19,0) not null,
    CREATE_DATE timestamp not null,
    INPUT_DATA blob,
    METHOD varchar2(100 char),
    MODEL_INSTANCE_ID number(19,0),
    PRINCIPAL_NAME varchar2(255 char),
    RESEND_DATE timestamp,
    SERVICE varchar2(255 char),
    STACK_TRACE clob,
    TYPE varchar2(255 char) not null,
    primary key (ID)
);

create table LSPS_SAVED_DOCUMENTS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    DOCUMENT_ID varchar2(255 char) not null,
    DOCUMENT_TYPE blob,
    IS_DELETED number(1,0),
    MODULE_ID number(19,0),
    PARAMETERS blob,
    SAVED_BY varchar2(255 char),
    SAVED_DATE timestamp not null,
    TITLE varchar2(255 char) not null,
    CONTENT_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_SECURITY_ROLES (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    NAME varchar2(255 char) not null,
    primary key (ID)
);

create table LSPS_SETTINGS (
    ID varchar2(255 char) not null,
    VALUE varchar2(255 char),
    primary key (ID)
);

create table LSPS_SUBSTITUTES (
    PERSON_ID varchar2(255 char) not null,
    SUBSTITUTE_ID varchar2(255 char) not null,
    primary key (PERSON_ID, SUBSTITUTE_ID)
);

create table LSPS_TIMER_NOTIFICATIONS (
    ID number(19,0) not null,
    INSTANCE_ID number(19,0),
    NOTIFICATION_DATE timestamp,
    primary key (ID)
);

create table LSPS_TIME_PERIODS (
    ID number(19,0) not null,
    ITEMS number(10,0) not null,
    NAME varchar2(30 char) not null,
    TIME_FRAME double precision not null,
    TIME_UNIT varchar2(20 char) not null,
    primary key (ID)
);

create table LSPS_TIME_PERIOD_ITEMS (
    TIME_FROM number(10,0) not null,
    TIME_TO number(10,0) not null,
    primary key (TIME_FROM)
);

create table LSPS_TIME_UNITS (
    ID number(19,0) not null,
    NAME varchar2(30 char) not null,
    UNIT_LENGTH number(10,0) not null,
    primary key (ID)
);

create table LSPS_TODOS (
    ID number(19,0) not null,
    ALLOCATED_TO varchar2(255 char),
    CURRENT_DELEGATION_LEVEL number(10,0) not null,
    ELEMENT_ID number(19,0),
    ESCALATION_DATE timestamp,
    IMPLEMENTATION_TYPE varchar2(255 char),
    INTERRUPTION_REASON varchar2(255 char),
    ISSUED_DATE timestamp not null,
    MODEL_INSTANCE_ID number(19,0),
    NOTES varchar2(1024 char),
    ORPHANED number(1,0),
    PRIORITY number(10,0),
    STATUS varchar2(255 char) not null,
    SUBMITTED_DATE timestamp,
    TASK_ID number(19,0),
    TASK_NAME varchar2(255 char) not null,
    TASK_NAMESPACE varchar2(255 char) not null,
    TITLE varchar2(255 char) not null,
    TYPE varchar2(255 char) not null,
    CONTENT_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_TODO_CONTENTS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    CONTENT blob,
    primary key (ID)
);

create table LSPS_TODO_ESCALATIONS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    ALLOCATED_TO varchar2(255 char),
    ESCALATION_DATE timestamp not null,
    REASON varchar2(255 char),
    TODO_STATUS varchar2(255 char) not null,
    TODO_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_TODO_PERFORMERS (
    ID number(19,0) not null,
    ACTIVE number(1,0) not null,
    DELEGATED_BY_ID varchar2(255 char),
    DELEGATION_LEVEL number(10,0),
    PERSON_ID varchar2(255 char),
    PARAM_NAME0 varchar2(255 char),
    PARAM_NAME1 varchar2(255 char),
    PARAM_NAME2 varchar2(255 char),
    PARAM_NAME3 varchar2(255 char),
    PARAM_NAME4 varchar2(255 char),
    PARAM_NAME5 varchar2(255 char),
    PARAM_NAME6 varchar2(255 char),
    PARAM_NAME7 varchar2(255 char),
    PARAM_NAME8 varchar2(255 char),
    PARAM_NAME9 varchar2(255 char),
    PARAM_VALUE0 varchar2(50 char),
    PARAM_VALUE1 varchar2(50 char),
    PARAM_VALUE2 varchar2(50 char),
    PARAM_VALUE3 varchar2(50 char),
    PARAM_VALUE4 varchar2(50 char),
    PARAM_VALUE5 varchar2(50 char),
    PARAM_VALUE6 varchar2(50 char),
    PARAM_VALUE7 varchar2(50 char),
    PARAM_VALUE8 varchar2(50 char),
    PARAM_VALUE9 varchar2(50 char),
    ROLE_NAME varchar2(255 char),
    SOURCE varchar2(20 char) not null,
    TODO_FINISHED number(1,0) not null,
    TODO_ISSUED_DATE timestamp not null,
    TYPE varchar2(20 char) not null,
    TODO_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_TODO_REJECTIONS (
    ID number(19,0) not null,
    PERSON_ID varchar2(255 char) not null,
    REASON varchar2(255 char) not null,
    TODO_ID number(19,0) not null,
    primary key (ID)
);

create table LSPS_UNPROCESSED_INPUTS (
    ID number(19,0) not null,
    INPUT_DATA blob,
    INPUT_DATE timestamp not null,
    RECEIVER number(19,0) not null,
    SENDER number(19,0),
    primary key (ID)
);

create table LSPS_USER_ROLES (
    PERSON_ID varchar2(255 char) not null,
    ROLE_ID number(19,0) not null,
    primary key (PERSON_ID, ROLE_ID)
);

create table LSPS_USER_SECURITY_ROLES (
    PERSON_ID varchar2(255 char) not null,
    SECURITY_ROLE_ID number(19,0) not null,
    primary key (PERSON_ID, SECURITY_ROLE_ID)
);

create table LSPS_VAADIN_THEMES (
    ID number(19,0) not null,
    NAME varchar2(255 char) not null,
    ZIP blob not null,
    primary key (ID)
);

create table LSPS_WS_REQUEST_HANDLERS (
    ID number(19,0) not null,
    ENTITY_VERSION number(19,0) not null,
    CREATED timestamp not null,
    ERROR number(1,0) not null,
    FINISHED timestamp,
    MODEL_INSTANCE_ID number(19,0),
    OPERATION_URI varchar2(255 char) not null,
    REQUEST clob,
    REQUEST_HEADERS blob,
    REQUEST_RECEIVED timestamp,
    RESPONSE clob,
    RESPONSE_HEADERS blob,
    SERVICE_NAME varchar2(255 char),
    TASK_ID number(19,0),
    IS_TERMINATED number(1,0) not null,
    TIMED_OUT number(1,0) not null,
    primary key (ID)
);

create index FK_BDM_BD on LSPS_BINARY_DATA_METADATAS (BINARY_DATA_ID);

create index IDX_LOGS_MI on LSPS_LOGS (MODEL_INSTANCE_ID);

create index IDX_LOGS_DATE on LSPS_LOGS (LOG_DATE);

create index IDX_LOGS_LEVEL on LSPS_LOGS (LOG_LEVEL);

create index IDX_MODEINST_STATE on LSPS_MODEL_INSTANCES (LIFECYCLE_STATE);

create index FK_MOIN_MODE on LSPS_MODEL_INSTANCES (MODEL_ID);

create index FK_MOIE_MOIM on LSPS_MODEL_INSTANCES (MODEL_INSTANCE_MIGRATION_ID);

create index FK_MOIE_MOIE on LSPS_MODEL_INSTANCES (PARENT_ID);

create index FK_MOIN_MIST on LSPS_MODEL_INSTANCES (STATE_ID);

create index IDX_MODEINST_TYPE on LSPS_MODEL_INSTANCES (TYPE);

create index FK_MINO_MOIN on LSPS_MODEL_INSTANCE_NTFS (MODEL_INSTANCE_ID);

create index IDX_MINO_NTF on LSPS_MODEL_INSTANCE_NTFS (NOTIFICATION);

alter table LSPS_MODEL_INSTANCE_PROPERTIES 
    add constraint UK_b0pvow9c9ade9mgdnkjhavkq8 unique (MODEL_INSTANCE_ID, NAME);

create index IDX_MOINPROP_001 on LSPS_MODEL_INSTANCE_PROPERTIES (NAME, VALUE);

create index IDX_MOUP_001 on LSPS_MODEL_UPDATES (FINISHED);

create index FK_MOUP_MLOG on LSPS_MODEL_UPDATES (LOG_ID);

create index FK_MOUP_MIGR on LSPS_MODEL_UPDATES (MIGRATION_ID);

alter table LSPS_MODULES 
    add constraint UK_c52aaf7b7qe3kypr2u0b13h1h unique (HASH);

create index IDX_MODULES_001 on LSPS_MODULES (NAME, VERSION);

create index FK_MOEN_MODU on LSPS_MODULE_ENTRIES (MODULE_ID);

create index FK_MOEN_LOCA on LSPS_MODULE_ENTRIES (CONTENT_ID);

create index FK_MOPE_MOSE on LSPS_MONITORING_PERFORMERS (DASHBOARD_TAB_ID);

create index FK_MOPE_RONA on LSPS_MONITORING_PERFORMERS (ROLE_NAME);

create index IDX_MONPERF_ROLE on LSPS_MONITORING_PERFORMERS (TYPE, ROLE_NAME, PARAM_VALUE0, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_VALUE4, PARAM_VALUE5, PARAM_VALUE6, PARAM_VALUE7, PARAM_VALUE8, PARAM_VALUE9);

create index IDX_MONPERF_PERS on LSPS_MONITORING_PERFORMERS (TYPE, PERSON_ID);

alter table LSPS_PERSONS 
    add constraint UK_ax18v4c0gm4e8wwpm5vigasfy unique (LOGIN_NAME);

alter table LSPS_PERSON_DETAILS 
    add constraint UK_pu2x7ra1wdbak6gybl8178csr unique (PERSON_ID, NAME);

create index FK_PEDE_PERS on LSPS_PERSON_DETAILS (PERSON_ID);

alter table LSPS_PERSON_SETTINGS 
    add constraint UK_5bg7w8bfsu9h06egptsf4v96m unique (PERSON_ID, NAME);

create index FK_PESE_PERS on LSPS_PERSON_SETTINGS (PERSON_ID);

create index FK_PROC_MODU on LSPS_PROCESSES (MODULE_ID);

create index FK_PREL_PREL on LSPS_PROCESS_ELEMENTS (CONTAINER_ID);

create index FK_PREL_PROC on LSPS_PROCESS_ELEMENTS (PROCESS_ID);

create index IDX_PROCLOGS_001 on LSPS_PROCESS_LOGS (MODEL_INSTANCE_ID, EXECUTION_ID);

create index IDX_PROCLOGS_002 on LSPS_PROCESS_LOGS (MODEL_ID, EVENT, LOG_DATE);

create index IDX_PROCLOGS_003 on LSPS_PROCESS_LOGS (ELEMENT_ID, EVENT, LOG_DATE);

create index FK_PRRE_PROC on LSPS_PROCESS_RELATIONSHIPS (PROCESS_ID);

create index FK_PRRE_PREL_SOURCE on LSPS_PROCESS_RELATIONSHIPS (SOURCE_ID);

create index FK_PRRE_PREL_TARGET on LSPS_PROCESS_RELATIONSHIPS (TARGET_ID);

alter table LSPS_REPORT_METADATAS 
    add constraint UK_4gs7by7nlhgb9xm1cc7ycw4sa unique (REPORT_ID, NAME);

create index IDX_REPMETA_001 on LSPS_REPORT_METADATAS (NAME, VALUE);

alter table LSPS_REST_RESOURCES 
    add constraint UK_7r5uqhwkjr2pny7uiswlenh4u unique (FULL_URL);

create index FK_RIGH_SERO on LSPS_RIGHTS (SECURITY_ROLE_ID);

create index FK_ROLE_PERS on LSPS_ROLES (PERSON_ID);

create index FK_ROLE_RONA on LSPS_ROLES (ROLE_NAME);

create index IDX_ROLE_PARAMS on LSPS_ROLES (ROLE_NAME, PARAM_VALUE0, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_VALUE4, PARAM_VALUE5, PARAM_VALUE6, PARAM_VALUE7, PARAM_VALUE8, PARAM_VALUE9);

create index FK_SDOC_DOCC on LSPS_SAVED_DOCUMENTS (CONTENT_ID);

create index FK_SDOC_DOC on LSPS_SAVED_DOCUMENTS (DOCUMENT_ID);

create index IDX_SDOCS_CREATEDBY on LSPS_SAVED_DOCUMENTS (SAVED_BY);

alter table LSPS_SECURITY_ROLES 
    add constraint UK_7ipvijdixitiex8ifh00gm9hd unique (NAME);

create index IDX_TODOS_ALLOC on LSPS_TODOS (ALLOCATED_TO);

create index FK_TODOS_TOSC on LSPS_TODOS (CONTENT_ID);

create index FK_TODO_PREL on LSPS_TODOS (ELEMENT_ID);

create index IDX_TODOS_STATUS on LSPS_TODOS (STATUS);

create index IDX_TODOS_TASK on LSPS_TODOS (MODEL_INSTANCE_ID, TASK_ID);

create index FK_TOES_TODO on LSPS_TODO_ESCALATIONS (TODO_ID);

create index FK_TOPE_TOSE on LSPS_TODO_PERFORMERS (TODO_ID);

create index FK_TOPE_RONA on LSPS_TODO_PERFORMERS (ROLE_NAME);

create index IDX_TODOPERF_ROLE on LSPS_TODO_PERFORMERS (ROLE_NAME, ACTIVE, TYPE, PARAM_VALUE0, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_VALUE4, PARAM_VALUE5, PARAM_VALUE6, PARAM_VALUE7, PARAM_VALUE8, PARAM_VALUE9, TODO_FINISHED, TODO_ISSUED_DATE, TODO_ID);

create index IDX_TODOPERF_ROLE_FINISHED on LSPS_TODO_PERFORMERS (TODO_FINISHED, TYPE, ROLE_NAME, PARAM_VALUE0, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_VALUE4, PARAM_VALUE5, PARAM_VALUE6, PARAM_VALUE7, PARAM_VALUE8, PARAM_VALUE9);

create index IDX_TODOPERF_PERS on LSPS_TODO_PERFORMERS (PERSON_ID, ACTIVE, SOURCE, TYPE, TODO_FINISHED, TODO_ISSUED_DATE, TODO_ID);

create index IDX_TYPE_ACTIVE on LSPS_TODO_PERFORMERS (TYPE, ACTIVE, TODO_FINISHED, TODO_ISSUED_DATE, TODO_ID);

create index IDX_TODOPERF_PERS_FINISHED on LSPS_TODO_PERFORMERS (TODO_FINISHED, TYPE, SOURCE, PERSON_ID);

alter table LSPS_TODO_REJECTIONS 
    add constraint UK_9cdylyoji4g5sk8byv43qhxvs unique (PERSON_ID, TODO_ID);

create index IDX_TORE_PERS on LSPS_TODO_REJECTIONS (PERSON_ID);

create index FK_TORE_TOSE on LSPS_TODO_REJECTIONS (TODO_ID);

alter table LSPS_VAADIN_THEMES 
    add constraint UK_krvgnpa34fdob2m3ikafto83v unique (NAME);

create index IDX_WSRH_001 on LSPS_WS_REQUEST_HANDLERS (OPERATION_URI, REQUEST_RECEIVED, IS_TERMINATED, MODEL_INSTANCE_ID);

create index IDX_WSRH_002 on LSPS_WS_REQUEST_HANDLERS (MODEL_INSTANCE_ID, TASK_ID);

alter table LSPS_BINARY_DATA_METADATAS 
    add constraint FK_97kqkm63qf0dpdycx26wyaddp 
    foreign key (BINARY_DATA_ID) 
    references LSPS_BINARY_DATA;

alter table LSPS_ERROR_MODEL_INSTANCES 
    add constraint FK_3v5vtf19vugjtli1iyn2fys4g 
    foreign key (ROLLBACK_ITEM_ID) 
    references LSPS_ROLLBACK_ITEMS;

alter table LSPS_MODEL_INSTANCES 
    add constraint FK_fehf15cs561qqwmdodee94a2g 
    foreign key (MODEL_ID) 
    references LSPS_MODULES;

alter table LSPS_MODEL_INSTANCES 
    add constraint FK_1d7nf600uxy58goth5llctt9w 
    foreign key (MODEL_INSTANCE_MIGRATION_ID) 
    references LSPS_MODEL_UPDATES;

alter table LSPS_MODEL_INSTANCES 
    add constraint FK_1gt8fs7oacstlxp5rqrgkb40u 
    foreign key (PARENT_ID) 
    references LSPS_MODEL_INSTANCES;

alter table LSPS_MODEL_INSTANCES 
    add constraint FK_qhwawocy4ercjsjcy1xbutopp 
    foreign key (STATE_ID) 
    references LSPS_MODEL_INSTANCE_STATES;

alter table LSPS_MODEL_INSTANCE_NTFS 
    add constraint FK_9hdrxfaosra4pyu6q46k2sxhr 
    foreign key (MODEL_INSTANCE_ID) 
    references LSPS_MODEL_INSTANCES;

alter table LSPS_MODEL_INSTANCE_PROPERTIES 
    add constraint FK_euj9day50idg66m6x0ck3aqon 
    foreign key (MODEL_INSTANCE_ID) 
    references LSPS_MODEL_INSTANCES;

alter table LSPS_MODEL_UPDATES 
    add constraint FK_syvier9eict86tueb2yvoj02b 
    foreign key (LOG_ID) 
    references LSPS_MODEL_UPDATE_LOGS;

alter table LSPS_MODEL_UPDATES 
    add constraint FK_4y507s2ug6btmllgx0jyrx10a 
    foreign key (MIGRATION_ID) 
    references LSPS_MIGRATIONS;

alter table LSPS_MODULE_ENTRIES 
    add constraint FK_nhjrjykx25d4oq59e89agjpt4 
    foreign key (CONTENT_ID) 
    references LSPS_BINARY_DATA;

alter table LSPS_MODULE_ENTRIES 
    add constraint FK_9ai0cqbdyjr6sodnmrkrekp98 
    foreign key (MODULE_ID) 
    references LSPS_MODULES;

alter table LSPS_MODULE_IMPORTS 
    add constraint FK_8ll12f2kehm60h4fblluvapx2 
    foreign key (IMPORTED_MODULE_ID) 
    references LSPS_MODULES;

alter table LSPS_MODULE_IMPORTS 
    add constraint FK_b5cktxtbqm2xjgm7g0vhicp29 
    foreign key (IMPORTING_MODULE_ID) 
    references LSPS_MODULES;

alter table LSPS_MONITORING_PERFORMERS 
    add constraint FK_4i9k42lj2hyfnu779dhejmmlf 
    foreign key (DASHBOARD_TAB_ID) 
    references LSPS_DASHBOARD_TABS;

alter table LSPS_PERSON_DETAILS 
    add constraint FK_lbja4c4oq1uxade8ex1m5pgmj 
    foreign key (PERSON_ID) 
    references LSPS_PERSONS;

alter table LSPS_PERSON_SETTINGS 
    add constraint FK_6eep9h37jawbahnq3wjxsv0wb 
    foreign key (PERSON_ID) 
    references LSPS_PERSONS;

alter table LSPS_PROCESSES 
    add constraint FK_sn17lunb8hg2snw9qo5ook2h0 
    foreign key (MODULE_ID) 
    references LSPS_MODULES;

alter table LSPS_PROCESS_ELEMENTS 
    add constraint FK_6v43s9sj09ssb6wn95ye2inn9 
    foreign key (CONTAINER_ID) 
    references LSPS_PROCESS_ELEMENTS;

alter table LSPS_PROCESS_ELEMENTS 
    add constraint FK_rqd9lixsx0143i5ixi9fhc7sr 
    foreign key (PROCESS_ID) 
    references LSPS_PROCESSES;

alter table LSPS_PROCESS_LOGS 
    add constraint FK_qpyf3hkgtbth1a04b6g6o876a 
    foreign key (MODEL_INSTANCE_ID) 
    references LSPS_MODEL_INSTANCES;

alter table LSPS_PROCESS_RELATIONSHIPS 
    add constraint FK_pyctq19xmr2sthgjicpss135c 
    foreign key (PROCESS_ID) 
    references LSPS_PROCESSES;

alter table LSPS_PROCESS_RELATIONSHIPS 
    add constraint FK_irj6bsa98tdstlx6ab79ys469 
    foreign key (SOURCE_ID) 
    references LSPS_PROCESS_ELEMENTS;

alter table LSPS_PROCESS_RELATIONSHIPS 
    add constraint FK_1dgdne3pirdmr2apydba4fht1 
    foreign key (TARGET_ID) 
    references LSPS_PROCESS_ELEMENTS;

alter table LSPS_REPORT_METADATAS 
    add constraint FK_o57hk3j97x53d0fvg5yg2ak80 
    foreign key (REPORT_ID) 
    references LSPS_REPORTS;

alter table LSPS_REST_RESOURCES 
    add constraint FK_a30go06695ojh6g63o6hcksxk 
    foreign key (PARENT_ID) 
    references LSPS_REST_RESOURCES;

alter table LSPS_RIGHTS 
    add constraint FK_r1cu7ide8rjwpoyatmilh35rv 
    foreign key (SECURITY_ROLE_ID) 
    references LSPS_SECURITY_ROLES;

alter table LSPS_ROLES 
    add constraint FK_slg3fpvxi8jl4ee474cordt2o 
    foreign key (ROLE_NAME) 
    references LSPS_ROLE_NAMES;

alter table LSPS_SAVED_DOCUMENTS 
    add constraint FK_i592ba7ecfw5go77x8w73vm8 
    foreign key (CONTENT_ID) 
    references LSPS_DOCUMENT_CONTENTS;

alter table LSPS_SUBSTITUTES 
    add constraint FK_saeqay6ijry4uyr3st1j81y38 
    foreign key (SUBSTITUTE_ID) 
    references LSPS_PERSONS;

alter table LSPS_SUBSTITUTES 
    add constraint FK_nqenod3fs70qu7pug529ew46f 
    foreign key (PERSON_ID) 
    references LSPS_PERSONS;

alter table LSPS_TODOS 
    add constraint FK_4bnt8hvrwbq4ox3pb36rriqf4 
    foreign key (CONTENT_ID) 
    references LSPS_TODO_CONTENTS;

alter table LSPS_TODO_ESCALATIONS 
    add constraint FK_4nv18k4orkj1br1fuhs43yp32 
    foreign key (TODO_ID) 
    references LSPS_TODOS;

alter table LSPS_TODO_PERFORMERS 
    add constraint FK_o0o64lkaxkccm5lqb7nnci6xa 
    foreign key (TODO_ID) 
    references LSPS_TODOS;

alter table LSPS_TODO_REJECTIONS 
    add constraint FK_9wwjosyrln394nj3eir7spbqx 
    foreign key (TODO_ID) 
    references LSPS_TODOS;

alter table LSPS_USER_ROLES 
    add constraint FK_e156a2mm9so6o3v83pn3xq6qp 
    foreign key (ROLE_ID) 
    references LSPS_ROLES;

alter table LSPS_USER_ROLES 
    add constraint FK_cilegc1d97tjhf26bgg0a8kod 
    foreign key (PERSON_ID) 
    references LSPS_PERSONS;

alter table LSPS_USER_SECURITY_ROLES 
    add constraint FK_7iaep6dkbyt1lsyjg3hvuwykl 
    foreign key (SECURITY_ROLE_ID) 
    references LSPS_SECURITY_ROLES;

alter table LSPS_USER_SECURITY_ROLES 
    add constraint FK_dl9g7ij6xj7cg22hwwyll8avo 
    foreign key (PERSON_ID) 
    references LSPS_PERSONS;

create sequence LSPS_SEQ start with 2000 increment by 1000;

alter table LSPS_WS_REQUEST_HANDLERS add constraint FK_s65jik6djlb5eic0qv6b4yrpk foreign key (MODEL_INSTANCE_ID) references LSPS_MODEL_INSTANCES;

alter table LSPS_REST_RESOURCES add constraint FK_jrmcejvb7stvrwpqu6d3tgglr foreign key (MODEL_INSTANCE_ID) references LSPS_MODEL_INSTANCES;

alter table LSPS_REPORTS add constraint FK_7nm5khaodj4hmtesv9l94awvu foreign key (MODULE_ID) references LSPS_MODULES;

alter table LSPS_TIMER_NOTIFICATIONS add constraint FK_ng6i84skd6gntvqq1uuaylf94 foreign key (INSTANCE_ID) references LSPS_MODEL_INSTANCES;

alter table LSPS_DOCUMENTS add constraint FK_20c0w8s92v5a3bkv5rcloi4qq foreign key (MODULE_ID) references LSPS_MODULES;

alter table LSPS_TODOS add constraint FK_l7bt6coufivbuaovi3nppqcu7 foreign key (MODEL_INSTANCE_ID) references LSPS_MODEL_INSTANCES;

alter table LSPS_MODEL_UPDATES add constraint FK_spbwmt8kfuvkg0c86lllah8c5 foreign key (MODEL_INSTANCE_ID) references LSPS_MODEL_INSTANCES;

alter table LSPS_LOGS add constraint FK_imdgkti1qe5sfdudi6nqx7rny foreign key (MODEL_INSTANCE_ID) references LSPS_MODEL_INSTANCES;

alter table LSPS_ROLLBACK_ITEMS add constraint FK_hjsguwmg9l9jx77mkeh7vw95k foreign key (MODEL_INSTANCE_ID) references LSPS_MODEL_INSTANCES;

insert into LSPS_SECURITY_ROLES (ID,ENTITY_VERSION,NAME) values (1000, 0, 'Admin');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Exception:Remove');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Expression:Evaluate');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Escalate_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Binary:Delete');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Person:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Process');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Binary:Add');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Model:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'SecurityRole:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Lock:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Person:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Read_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Read_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Reassign');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'ModelInstance:Create');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Debugger:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Escalate_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Exception:Resend');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Signal:Send');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Signal:Remove');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Binary:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'GoalState:Update');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'ModelInstance:Notify');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Exception:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'ModelInstance:Update_Model');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Model:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Variables:Update');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'ModelInstance:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'SecurityRole:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Model:Delete');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Delegate_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Delegate_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Undo_Reject');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Read_Assignees');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Todo:Reject');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Document:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Document:Submit');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Form:Preview');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'ModelInstance:Terminate');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Webservice:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Webservice:Invoke');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Role:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Role:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'ModelInstance:Suspend');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Report:Read_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Report:Read_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Report:Dashboard_Management');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Schema:Validate');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Schema:Update');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Schema:DropCreate');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1000, 'Testing:All');

insert into LSPS_SECURITY_ROLES (ID,ENTITY_VERSION,NAME) values (1001, 0, 'ProcessExecutor');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Expression:Evaluate');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Escalate_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Binary:Delete');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Process');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Binary:Add');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Model:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Lock:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Person:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Read_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Reassign');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'ModelInstance:Create');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Escalate_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Signal:Send');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Signal:Remove');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Binary:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'ModelInstance:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Delegate_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Todo:Reject');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Document:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Document:Submit');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Webservice:Invoke');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Role:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Person:Change_Own_Password');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'Report:Read_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1001, 'ModelInstance:Notify');

insert into LSPS_SECURITY_ROLES (ID,ENTITY_VERSION,NAME) values (1002, 0, 'ProcessManager');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Exception:Remove');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Expression:Evaluate');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Escalate_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Binary:Delete');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Process');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Binary:Add');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Model:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'SecurityRole:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Lock:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Person:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Read_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Read_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Reassign');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'ModelInstance:Create');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Escalate_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Document:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Document:Submit');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Exception:Resend');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Signal:Send');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Signal:Remove');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Binary:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'GoalState:Update');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'ModelInstance:Notify');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Exception:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'ModelInstance:Update_Model');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Model:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Variables:Update');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'ModelInstance:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Delegate_Own');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Delegate_All');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Reject');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Undo_Reject');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Todo:Read_Assignees');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Role:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Role:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Person:Change_Own_Password');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Schema:Validate');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Schema:Update');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1002, 'Schema:DropCreate');

insert into LSPS_SECURITY_ROLES (ID,ENTITY_VERSION,NAME) values (1003, 0, 'ApplicationRoleManager');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1003, 'Person:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1003, 'Model:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1003, 'SecurityRole:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1003, 'Person:Read');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1003, 'Signal:Send');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1003, 'SecurityRole:Manage');
insert into LSPS_RIGHTS (SECURITY_ROLE_ID,NAME) values (1003, 'Role:Read');

insert into LSPS_PERSONS (ID, ENTITY_VERSION, LOGIN_NAME, PASSWORD_HASH, PASSWORD_SALT, ACTIVE, SUBSTITUTION_ACTIVE) values ('processAgent', 0, 'processAgent', 'V2AEPPdCbj5APcGoTQa7qyOOA1c=','4479487219837818905', 1, 0);
insert into LSPS_USER_SECURITY_ROLES (PERSON_ID, SECURITY_ROLE_ID) select p.ID, r.ID from LSPS_SECURITY_ROLES r, LSPS_PERSONS p where p.LOGIN_NAME = 'processAgent' and r.NAME = 'Admin';
insert into LSPS_PERSONS (ID, ENTITY_VERSION, LOGIN_NAME, PASSWORD_HASH, PASSWORD_SALT, ACTIVE, SUBSTITUTION_ACTIVE) values ('admin', 0, 'admin', '6X7MTi344yZDeLnxZTHT/9xKbqU=','-4574453675160255228', 1, 0);
insert into LSPS_USER_SECURITY_ROLES (PERSON_ID, SECURITY_ROLE_ID) select p.ID, r.ID from LSPS_SECURITY_ROLES r, LSPS_PERSONS p where p.LOGIN_NAME = 'admin' and r.NAME = 'Admin';
insert into LSPS_PERSONS (ID, ENTITY_VERSION, LOGIN_NAME, PASSWORD_HASH, PASSWORD_SALT, ACTIVE, SUBSTITUTION_ACTIVE) values ('guest', 0, 'guest', 'aExaYI1Lre2GrmCezH1pusRtKgY=','8025209512674943304', 1, 0);
insert into LSPS_USER_SECURITY_ROLES (PERSON_ID, SECURITY_ROLE_ID) select p.ID, r.ID from LSPS_SECURITY_ROLES r, LSPS_PERSONS p where p.LOGIN_NAME = 'guest' and r.NAME = 'ProcessExecutor';

insert into LSPS_TIME_PERIODS (ID, NAME, TIME_FRAME, TIME_UNIT, ITEMS) values (1, '1 minute', 0.000694445, 'Seconds', 60);
insert into LSPS_TIME_PERIODS (ID, NAME, TIME_FRAME, TIME_UNIT, ITEMS) values (2, '1 hour', 0.041666667, 'Minutes', 60);
insert into LSPS_TIME_PERIODS (ID, NAME, TIME_FRAME, TIME_UNIT, ITEMS) values (3, '1 day', 1, 'Hours', 2 * 24);
insert into LSPS_TIME_PERIODS (ID, NAME, TIME_FRAME, TIME_UNIT, ITEMS) values (4, '1 week', 7, 'Hours', 6 * 7);
insert into LSPS_TIME_PERIODS (ID, NAME, TIME_FRAME, TIME_UNIT, ITEMS) values (5, '1 month', 31, 'Days', 31);
insert into LSPS_TIME_PERIODS (ID, NAME, TIME_FRAME, TIME_UNIT, ITEMS) values (6, '3 months', 91, 'Days', 91);
insert into LSPS_TIME_PERIODS (ID, NAME, TIME_FRAME, TIME_UNIT, ITEMS) values (7, '1 year', 365, 'Weeks', 55);

insert into LSPS_TIME_PERIOD_ITEMS values (0, 1);
insert into LSPS_TIME_PERIOD_ITEMS values (1, 2);
insert into LSPS_TIME_PERIOD_ITEMS values (2, 3);
insert into LSPS_TIME_PERIOD_ITEMS values (3, 4);
insert into LSPS_TIME_PERIOD_ITEMS values (4, 5);
insert into LSPS_TIME_PERIOD_ITEMS values (5, 6);
insert into LSPS_TIME_PERIOD_ITEMS values (6, 7);
insert into LSPS_TIME_PERIOD_ITEMS values (7, 8);
insert into LSPS_TIME_PERIOD_ITEMS values (8, 9);
insert into LSPS_TIME_PERIOD_ITEMS values (9, 10);
insert into LSPS_TIME_PERIOD_ITEMS values (10, 11);
insert into LSPS_TIME_PERIOD_ITEMS values (11, 12);
insert into LSPS_TIME_PERIOD_ITEMS values (12, 13);
insert into LSPS_TIME_PERIOD_ITEMS values (13, 14);
insert into LSPS_TIME_PERIOD_ITEMS values (14, 15);
insert into LSPS_TIME_PERIOD_ITEMS values (15, 16);
insert into LSPS_TIME_PERIOD_ITEMS values (16, 17);
insert into LSPS_TIME_PERIOD_ITEMS values (17, 18);
insert into LSPS_TIME_PERIOD_ITEMS values (18, 19);
insert into LSPS_TIME_PERIOD_ITEMS values (19, 20);
insert into LSPS_TIME_PERIOD_ITEMS values (20, 21);
insert into LSPS_TIME_PERIOD_ITEMS values (21, 22);
insert into LSPS_TIME_PERIOD_ITEMS values (22, 23);
insert into LSPS_TIME_PERIOD_ITEMS values (23, 24);
insert into LSPS_TIME_PERIOD_ITEMS values (24, 25);
insert into LSPS_TIME_PERIOD_ITEMS values (25, 26);
insert into LSPS_TIME_PERIOD_ITEMS values (26, 27);
insert into LSPS_TIME_PERIOD_ITEMS values (27, 28);
insert into LSPS_TIME_PERIOD_ITEMS values (28, 29);
insert into LSPS_TIME_PERIOD_ITEMS values (29, 30);
insert into LSPS_TIME_PERIOD_ITEMS values (30, 31);
insert into LSPS_TIME_PERIOD_ITEMS values (31, 32);
insert into LSPS_TIME_PERIOD_ITEMS values (32, 33);
insert into LSPS_TIME_PERIOD_ITEMS values (33, 34);
insert into LSPS_TIME_PERIOD_ITEMS values (34, 35);
insert into LSPS_TIME_PERIOD_ITEMS values (35, 36);
insert into LSPS_TIME_PERIOD_ITEMS values (36, 37);
insert into LSPS_TIME_PERIOD_ITEMS values (37, 38);
insert into LSPS_TIME_PERIOD_ITEMS values (38, 39);
insert into LSPS_TIME_PERIOD_ITEMS values (39, 40);
insert into LSPS_TIME_PERIOD_ITEMS values (40, 41);
insert into LSPS_TIME_PERIOD_ITEMS values (41, 42);
insert into LSPS_TIME_PERIOD_ITEMS values (42, 43);
insert into LSPS_TIME_PERIOD_ITEMS values (43, 44);
insert into LSPS_TIME_PERIOD_ITEMS values (44, 45);
insert into LSPS_TIME_PERIOD_ITEMS values (45, 46);
insert into LSPS_TIME_PERIOD_ITEMS values (46, 47);
insert into LSPS_TIME_PERIOD_ITEMS values (47, 48);
insert into LSPS_TIME_PERIOD_ITEMS values (48, 49);
insert into LSPS_TIME_PERIOD_ITEMS values (49, 50);
insert into LSPS_TIME_PERIOD_ITEMS values (50, 51);
insert into LSPS_TIME_PERIOD_ITEMS values (51, 52);
insert into LSPS_TIME_PERIOD_ITEMS values (52, 53);
insert into LSPS_TIME_PERIOD_ITEMS values (53, 54);
insert into LSPS_TIME_PERIOD_ITEMS values (54, 55);
insert into LSPS_TIME_PERIOD_ITEMS values (55, 56);
insert into LSPS_TIME_PERIOD_ITEMS values (56, 57);
insert into LSPS_TIME_PERIOD_ITEMS values (57, 58);
insert into LSPS_TIME_PERIOD_ITEMS values (58, 59);
insert into LSPS_TIME_PERIOD_ITEMS values (59, 60);
insert into LSPS_TIME_PERIOD_ITEMS values (60, 61);
insert into LSPS_TIME_PERIOD_ITEMS values (61, 62);
insert into LSPS_TIME_PERIOD_ITEMS values (62, 63);
insert into LSPS_TIME_PERIOD_ITEMS values (63, 64);
insert into LSPS_TIME_PERIOD_ITEMS values (64, 65);
insert into LSPS_TIME_PERIOD_ITEMS values (65, 66);
insert into LSPS_TIME_PERIOD_ITEMS values (66, 67);
insert into LSPS_TIME_PERIOD_ITEMS values (67, 68);
insert into LSPS_TIME_PERIOD_ITEMS values (68, 69);
insert into LSPS_TIME_PERIOD_ITEMS values (69, 70);
insert into LSPS_TIME_PERIOD_ITEMS values (70, 71);
insert into LSPS_TIME_PERIOD_ITEMS values (71, 72);
insert into LSPS_TIME_PERIOD_ITEMS values (72, 73);
insert into LSPS_TIME_PERIOD_ITEMS values (73, 74);
insert into LSPS_TIME_PERIOD_ITEMS values (74, 75);
insert into LSPS_TIME_PERIOD_ITEMS values (75, 76);
insert into LSPS_TIME_PERIOD_ITEMS values (76, 77);
insert into LSPS_TIME_PERIOD_ITEMS values (77, 78);
insert into LSPS_TIME_PERIOD_ITEMS values (78, 79);
insert into LSPS_TIME_PERIOD_ITEMS values (79, 80);
insert into LSPS_TIME_PERIOD_ITEMS values (80, 81);
insert into LSPS_TIME_PERIOD_ITEMS values (81, 82);
insert into LSPS_TIME_PERIOD_ITEMS values (82, 83);
insert into LSPS_TIME_PERIOD_ITEMS values (83, 84);
insert into LSPS_TIME_PERIOD_ITEMS values (84, 85);
insert into LSPS_TIME_PERIOD_ITEMS values (85, 86);
insert into LSPS_TIME_PERIOD_ITEMS values (86, 87);
insert into LSPS_TIME_PERIOD_ITEMS values (87, 88);
insert into LSPS_TIME_PERIOD_ITEMS values (88, 89);
insert into LSPS_TIME_PERIOD_ITEMS values (89, 90);
insert into LSPS_TIME_PERIOD_ITEMS values (90, 91);
insert into LSPS_TIME_PERIOD_ITEMS values (91, 92);
insert into LSPS_TIME_PERIOD_ITEMS values (92, 93);
insert into LSPS_TIME_PERIOD_ITEMS values (93, 94);

insert into LSPS_TIME_UNITS (ID, NAME, UNIT_LENGTH) values (1, 'Minute', 60);
insert into LSPS_TIME_UNITS (ID, NAME, UNIT_LENGTH) values (2, 'Hour', 3600);
insert into LSPS_TIME_UNITS (ID, NAME, UNIT_LENGTH) values (3, 'Day', 86400);
insert into LSPS_TIME_UNITS (ID, NAME, UNIT_LENGTH) values (4, 'Week', 604800);
insert into LSPS_TIME_UNITS (ID, NAME, UNIT_LENGTH) values (5, 'Month', 2419200);

create function LSPS_DIFF_SECONDS(d1 in timestamp, d2 in timestamp)
return number deterministic is begin
	return (cast(d1 as date) - cast(d2 as date)) * 24 * 60 * 60;
end;
/

create function LSPS_ADD_SECONDS(d in timestamp, s in number)
return timestamp deterministic is begin
	return d + s / 24 / 3600;
end;
/

insert into LSPS_SETTINGS (ID, VALUE) values ('SERIALIZE_MODEL_UPLOAD','serialize');
insert into LSPS_SETTINGS (ID, VALUE) values ('LINES_OF_EXPRESSION_LOGGED_IN_EXCEPTION','-1');
insert into LSPS_SETTINGS (ID, VALUE) values ('ENABLE_DROP_CREATE','false');
insert into LSPS_SETTINGS (ID, VALUE) values ('CREATE_PROCESS_LOGS','MODULE');
