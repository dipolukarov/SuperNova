/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.log_metamatter;
CREATE TABLE sn.log_metamatter (
    id          serial,
    timestamp   timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- COMMENT 'Human-readable record timestamp'
    body        jsonb NOT NULL,
CONSTRAINT log_metamatter_pkey PRIMARY KEY (id)
--  KEY `I_log_metamatter_sender_id` (`user_id`, `id`),
--  KEY `I_log_metamatter_reason_sender_id` (`reason`, `user_id`, `id`)
);
/*
{
    `user_id`      BIGINT(20) UNSIGNED       NOT NULL DEFAULT '0' COMMENT 'User ID which make log record',
    `username`     VARCHAR(32)               NOT NULL DEFAULT '' COMMENT 'Username',
    `reason`       INT(10) UNSIGNED          NOT NULL DEFAULT '0' COMMENT 'Reason ID for metamatter adjustment',
    `amount`       BIGINT(10)                NOT NULL DEFAULT '0' COMMENT 'Amount of metamatter change',
    `comment`      TEXT COMMENT 'Comments',
    `page`         VARCHAR(512)              NOT NULL DEFAULT '' COMMENT 'Page that makes entry to log',
    `provider_id`  TINYINT(3) UNSIGNED       NOT NULL DEFAULT '1' COMMENT 'Account provider',
    `account_id`   BIGINT(20) UNSIGNED       NOT NULL DEFAULT '0',
    `account_name` VARCHAR(32)               NOT NULL DEFAULT '',
    `server_name`  VARCHAR(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'http://localhost/supernova/',
    
}
*/
