/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.logs;
CREATE TABLE sn.logs (
    timestamp   timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- COMMENT 'Human-readable record timestamp'
    username    VARCHAR(64) NOT NULL DEFAULT '',                -- COMMENT 'Username'
    title       VARCHAR(64) NOT NULL DEFAULT 'Log entry',       -- COMMENT 'Short description'
    text        text,
    page        VARCHAR(512) NOT NULL DEFAULT '',               -- COMMENT 'Page that makes entry to log'
    code        int NOT NULL DEFAULT 0,                         -- INT(10) UNSIGNED NOT NULL DEFAULT '0'
    sender      bigint NOT NULL,                                -- DEFAULT '0' COMMENT 'User ID which make log record'
    time        timestamptz NOT NULL DEFAULT now(),             -- INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Machine-readable timestamp'
    dump        text NOT NULL,                                  -- MEDIUMTEXT COMMENT 'Machine-readable dump of variables'
    id          serial,
CONSTRAINT logs_pkey PRIMARY KEY (id)
--  KEY `i_log_username` (`log_username`),
--  KEY `i_log_time` (`log_time`),
--  KEY `i_log_sender` (`log_sender`),
--  KEY `i_log_code` (`log_code`),
--  KEY `i_log_page` (`log_page`(255))
);
