/**
 * Table structure for sn.account_translate
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.account_translate;
CREATE TABLE sn.account_translate (
    provider_id         int         NOT NULL DEFAULT 1,     -- TINYINT(3) UNSIGNED COMMENT 'Account provider'
    provider_account_id bigint      NOT NULL,               -- COMMENT 'Account ID on provider'
    user_id             bigint      NOT NULL,               -- COMMENT 'User ID'
    timestamp           timestamptz NOT NULL DEFAULT now(),
CONSTRAINT account_translate_pkey PRIMARY KEY (provider_id, provider_account_id, user_id),
--  KEY `user_id` (`user_id`),
CONSTRAINT account_translate_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
