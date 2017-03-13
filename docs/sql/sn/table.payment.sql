/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.payment;
CREATE TABLE sn.payment (
    id              serial,                                         -- COMMENT 'Internal payment ID'
    user_id         bigint,
    date            timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- COMMENT 'Payment server timestamp'
    external_date   timestamptz,                                    -- COMMENT 'External payment timestamp in payment system'
    body            jsonb NOT NULL,
CONSTRAINT payment_pkey PRIMARY KEY (id)
--  KEY `I_payment_user` (`payment_user_id`, `payment_user_name`),
--  KEY `I_payment_module_internal_id` (`payment_module_name`, `payment_external_id`)
);
/*
{
    `payment_status`             INT(11)                      DEFAULT '0' COMMENT 'Payment status',
    `payment_user_name`          VARCHAR(64)                  DEFAULT NULL,
    `payment_amount`             DECIMAL(60, 5)               DEFAULT '0.00000' COMMENT 'Amount paid',
    `payment_currency`           VARCHAR(3)                   DEFAULT '' COMMENT 'Payment currency',
    `payment_dark_matter_paid`   DECIMAL(65, 0)               DEFAULT '0' COMMENT 'Real DM paid for',
    `payment_dark_matter_gained` DECIMAL(65, 0)               DEFAULT '0' COMMENT 'DM gained by player (with bonuses)',
    `payment_comment`            TEXT COMMENT 'Payment comment',
    `payment_module_name`        VARCHAR(64)                  DEFAULT '' COMMENT 'Payment module name',
    `payment_external_id`        VARCHAR(64)                  DEFAULT '' COMMENT 'External payment ID in payment system',
    `payment_external_lots`      DECIMAL(65, 5)      NOT NULL DEFAULT '0.00000' COMMENT 'Payment system lot amount',
    `payment_external_amount`    DECIMAL(65, 5)      NOT NULL DEFAULT '0.00000' COMMENT 'Money incoming from payment system',
    `payment_external_currency`  VARCHAR(3)          NOT NULL DEFAULT '' COMMENT 'Payment system currency',
    `payment_test`               TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is this a test payment?',
    `payment_provider_id`        TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Payment account provider',
    `payment_account_id`         BIGINT(20) UNSIGNED NOT NULL,
    `payment_account_name`       VARCHAR(32)         NOT NULL DEFAULT '',
}
*/
