
alter table LSPS_WS_REQUEST_HANDLERS drop foreign key FK_s65jik6djlb5eic0qv6b4yrpk;

alter table LSPS_REST_RESOURCES drop foreign key FK_jrmcejvb7stvrwpqu6d3tgglr;

alter table LSPS_REPORTS drop foreign key FK_7nm5khaodj4hmtesv9l94awvu;

alter table LSPS_TIMER_NOTIFICATIONS drop foreign key FK_ng6i84skd6gntvqq1uuaylf94;

alter table LSPS_DOCUMENTS drop foreign key FK_20c0w8s92v5a3bkv5rcloi4qq;

alter table LSPS_TODOS drop foreign key FK_l7bt6coufivbuaovi3nppqcu7;

alter table LSPS_MODEL_UPDATES drop foreign key FK_spbwmt8kfuvkg0c86lllah8c5;

alter table LSPS_LOGS drop foreign key FK_imdgkti1qe5sfdudi6nqx7rny;

alter table LSPS_ROLLBACK_ITEMS drop foreign key FK_hjsguwmg9l9jx77mkeh7vw95k;

alter table LSPS_BINARY_DATA_METADATAS 
    drop 
    foreign key FK_97kqkm63qf0dpdycx26wyaddp;

alter table LSPS_ERROR_MODEL_INSTANCES 
    drop 
    foreign key FK_3v5vtf19vugjtli1iyn2fys4g;

alter table LSPS_MODEL_INSTANCES 
    drop 
    foreign key FK_fehf15cs561qqwmdodee94a2g;

alter table LSPS_MODEL_INSTANCES 
    drop 
    foreign key FK_1d7nf600uxy58goth5llctt9w;

alter table LSPS_MODEL_INSTANCES 
    drop 
    foreign key FK_1gt8fs7oacstlxp5rqrgkb40u;

alter table LSPS_MODEL_INSTANCES 
    drop 
    foreign key FK_qhwawocy4ercjsjcy1xbutopp;

alter table LSPS_MODEL_INSTANCE_NTFS 
    drop 
    foreign key FK_9hdrxfaosra4pyu6q46k2sxhr;

alter table LSPS_MODEL_INSTANCE_PROPERTIES 
    drop 
    foreign key FK_euj9day50idg66m6x0ck3aqon;

alter table LSPS_MODEL_UPDATES 
    drop 
    foreign key FK_syvier9eict86tueb2yvoj02b;

alter table LSPS_MODEL_UPDATES 
    drop 
    foreign key FK_4y507s2ug6btmllgx0jyrx10a;

alter table LSPS_MODULE_ENTRIES 
    drop 
    foreign key FK_nhjrjykx25d4oq59e89agjpt4;

alter table LSPS_MODULE_ENTRIES 
    drop 
    foreign key FK_9ai0cqbdyjr6sodnmrkrekp98;

alter table LSPS_MODULE_IMPORTS 
    drop 
    foreign key FK_8ll12f2kehm60h4fblluvapx2;

alter table LSPS_MODULE_IMPORTS 
    drop 
    foreign key FK_b5cktxtbqm2xjgm7g0vhicp29;

alter table LSPS_MONITORING_PERFORMERS 
    drop 
    foreign key FK_4i9k42lj2hyfnu779dhejmmlf;

alter table LSPS_PERSON_DETAILS 
    drop 
    foreign key FK_lbja4c4oq1uxade8ex1m5pgmj;

alter table LSPS_PERSON_SETTINGS 
    drop 
    foreign key FK_6eep9h37jawbahnq3wjxsv0wb;

alter table LSPS_PROCESSES 
    drop 
    foreign key FK_sn17lunb8hg2snw9qo5ook2h0;

alter table LSPS_PROCESS_ELEMENTS 
    drop 
    foreign key FK_6v43s9sj09ssb6wn95ye2inn9;

alter table LSPS_PROCESS_ELEMENTS 
    drop 
    foreign key FK_rqd9lixsx0143i5ixi9fhc7sr;

alter table LSPS_PROCESS_LOGS 
    drop 
    foreign key FK_qpyf3hkgtbth1a04b6g6o876a;

alter table LSPS_PROCESS_RELATIONSHIPS 
    drop 
    foreign key FK_pyctq19xmr2sthgjicpss135c;

alter table LSPS_PROCESS_RELATIONSHIPS 
    drop 
    foreign key FK_irj6bsa98tdstlx6ab79ys469;

alter table LSPS_PROCESS_RELATIONSHIPS 
    drop 
    foreign key FK_1dgdne3pirdmr2apydba4fht1;

alter table LSPS_REPORT_METADATAS 
    drop 
    foreign key FK_o57hk3j97x53d0fvg5yg2ak80;

alter table LSPS_REST_RESOURCES 
    drop 
    foreign key FK_a30go06695ojh6g63o6hcksxk;

alter table LSPS_RIGHTS 
    drop 
    foreign key FK_r1cu7ide8rjwpoyatmilh35rv;

alter table LSPS_ROLES 
    drop 
    foreign key FK_slg3fpvxi8jl4ee474cordt2o;

alter table LSPS_SAVED_DOCUMENTS 
    drop 
    foreign key FK_i592ba7ecfw5go77x8w73vm8;

alter table LSPS_SUBSTITUTES 
    drop 
    foreign key FK_saeqay6ijry4uyr3st1j81y38;

alter table LSPS_SUBSTITUTES 
    drop 
    foreign key FK_nqenod3fs70qu7pug529ew46f;

alter table LSPS_TODOS 
    drop 
    foreign key FK_4bnt8hvrwbq4ox3pb36rriqf4;

alter table LSPS_TODO_ESCALATIONS 
    drop 
    foreign key FK_4nv18k4orkj1br1fuhs43yp32;

alter table LSPS_TODO_PERFORMERS 
    drop 
    foreign key FK_o0o64lkaxkccm5lqb7nnci6xa;

alter table LSPS_TODO_REJECTIONS 
    drop 
    foreign key FK_9wwjosyrln394nj3eir7spbqx;

alter table LSPS_USER_ROLES 
    drop 
    foreign key FK_e156a2mm9so6o3v83pn3xq6qp;

alter table LSPS_USER_ROLES 
    drop 
    foreign key FK_cilegc1d97tjhf26bgg0a8kod;

alter table LSPS_USER_SECURITY_ROLES 
    drop 
    foreign key FK_7iaep6dkbyt1lsyjg3hvuwykl;

alter table LSPS_USER_SECURITY_ROLES 
    drop 
    foreign key FK_dl9g7ij6xj7cg22hwwyll8avo;

drop table if exists LSPS_ACTIVE_USERS_TRACK;

drop table if exists LSPS_BINARY_DATA;

drop table if exists LSPS_BINARY_DATA_METADATAS;

drop table if exists LSPS_DASHBOARD_TABS;

drop table if exists LSPS_DOCUMENTS;

drop table if exists LSPS_DOCUMENT_CONTENTS;

drop table if exists LSPS_ERROR_MODEL_INSTANCES;

drop table if exists LSPS_LOCKS;

drop table if exists LSPS_LOGS;

drop table if exists LSPS_MIGRATIONS;

drop table if exists LSPS_MODEL_INSTANCES;

drop table if exists LSPS_MODEL_INSTANCE_NTFS;

drop table if exists LSPS_MODEL_INSTANCE_PROPERTIES;

drop table if exists LSPS_MODEL_INSTANCE_STATES;

drop table if exists LSPS_MODEL_UPDATES;

drop table if exists LSPS_MODEL_UPDATE_LOGS;

drop table if exists LSPS_MODULES;

drop table if exists LSPS_MODULE_ENTRIES;

drop table if exists LSPS_MODULE_IMPORTS;

drop table if exists LSPS_MONITORING_PERFORMERS;

drop table if exists LSPS_PERSONS;

drop table if exists LSPS_PERSON_DETAILS;

drop table if exists LSPS_PERSON_SETTINGS;

drop table if exists LSPS_PROCESSES;

drop table if exists LSPS_PROCESS_ELEMENTS;

drop table if exists LSPS_PROCESS_LOGS;

drop table if exists LSPS_PROCESS_RELATIONSHIPS;

drop table if exists LSPS_REPORTS;

drop table if exists LSPS_REPORT_METADATAS;

drop table if exists LSPS_REST_RESOURCES;

drop table if exists LSPS_RIGHTS;

drop table if exists LSPS_ROLES;

drop table if exists LSPS_ROLE_NAMES;

drop table if exists LSPS_ROLLBACK_ITEMS;

drop table if exists LSPS_SAVED_DOCUMENTS;

drop table if exists LSPS_SECURITY_ROLES;

drop table if exists LSPS_SETTINGS;

drop table if exists LSPS_SUBSTITUTES;

drop table if exists LSPS_TIMER_NOTIFICATIONS;

drop table if exists LSPS_TIME_PERIODS;

drop table if exists LSPS_TIME_PERIOD_ITEMS;

drop table if exists LSPS_TIME_UNITS;

drop table if exists LSPS_TODOS;

drop table if exists LSPS_TODO_CONTENTS;

drop table if exists LSPS_TODO_ESCALATIONS;

drop table if exists LSPS_TODO_PERFORMERS;

drop table if exists LSPS_TODO_REJECTIONS;

drop table if exists LSPS_UNPROCESSED_INPUTS;

drop table if exists LSPS_USER_ROLES;

drop table if exists LSPS_USER_SECURITY_ROLES;

drop table if exists LSPS_VAADIN_THEMES;

drop table if exists LSPS_WS_REQUEST_HANDLERS;

drop table if exists LSPS_SEQ;

drop function LSPS_ADD_SECONDS;
drop function LSPS_DIFF_SECONDS;
