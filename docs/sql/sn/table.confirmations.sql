/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.confirmations;
CREATE TABLE sn.confirmations (
    id          serial,
    id_user     bigint,                             -- NOT NULL DEFAULT '0'
    provider_id bigint,                             -- TINYINT(3) UNSIGNED NOT NULL DEFAULT '0'
    account_id  bigint,                             -- NOT NULL DEFAULT '0'
    type        int,                                -- SMALLINT(6) NOT NULL DEFAULT '0',
    email       VARCHAR(64) NOT NULL DEFAULT '',
    code        VARCHAR(16) NOT NULL DEFAULT '',
    create_time timestamptz NOT NULL DEFAULT now(), -- NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
CONSTRAINT confirmations_pkey PRIMARY KEY (id),
CONSTRAINT confirmations_uniq UNIQUE (provider_id, account_id, type, email)
--  KEY `i_code_email` (`code`, `email`)
);
