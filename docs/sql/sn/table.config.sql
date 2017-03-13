/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.config;
CREATE TABLE sn.config (
    name    varchar(64) NOT NULL DEFAULT '',
    value   text,
CONSTRAINT config_pkey PRIMARY KEY (name)
--  KEY `i_config_name` (`config_name`)
);
