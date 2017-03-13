/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.log_dark_matter;
CREATE TABLE sn.log_dark_matter (
    id          serial,
    timestamp   timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- COMMENT 'Human-readable record timestamp'
    body        jsonb NOT NULL,
CONSTRAINT log_dark_matter_pkey PRIMARY KEY (id)
--  KEY `i_log_dark_matter_sender_id` (`log_dark_matter_sender`, `log_dark_matter_id`),
--  KEY `i_log_dark_matter_reason_sender_id` (`log_dark_matter_reason`, `log_dark_matter_sender`, `log_dark_matter_id`),
--  KEY `i_log_dark_matter_amount` (`log_dark_matter_amount`)
);
/*
{
    username  VARCHAR(64)         NOT NULL DEFAULT '' COMMENT 'Username',
    reason    INT(10) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Reason ID for dark matter adjustment',
    amount    INT(10)             NOT NULL DEFAULT '0' COMMENT 'Amount of dark matter change',
    comment   TEXT COMMENT 'Comments',
    page      VARCHAR(512)        NOT NULL DEFAULT '' COMMENT 'Page that makes entry to log',
    sender    BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID which make log record',
}
*/
