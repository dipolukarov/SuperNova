/**
 * Table structure for sn_account
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.account;
CREATE TABLE sn.account (
    id              serial,
    name            text        NOT NULL DEFAULT '',
    register_time   timestamptz NOT NULL DEFAULT now(),
    immortal        timestamptz,
    body            jsonb       NOT NULL,
CONSTRAINT account_pkey PRIMARY KEY (id),
CONSTRAINT account_uniq_name UNIQUE (name) -- KEY `I_account_name` 
--  KEY `I_account_email` (`account_email`)
);
--
-- BODY
-- {
--  "password": "CHAR(32)",
--  "salt": "CHAR(16)",
--  "email": "VARCHAR(64)",
--  "email_verified": false, NOT NULL DEFAULT false
--  "language": "NOT NULL DEFAULT ru",
--  "metamatter": 0, BIGINT(20) NOT NULL DEFAULT '0' COMMENT Metamatter amount
--  "metamatter_total": 0, BIGINT(20) NOT NULL DEFAULT '0' COMMENT Total Metamatter amount ever bought
-- }
