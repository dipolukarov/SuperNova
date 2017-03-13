/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.auth_vkontakte_account;
CREATE TABLE sn.auth_vkontakte_account (
    id          serial,
    account_id  bigint, -- COMMENT 'Account ID'
    expires_in  timestamptz NOT NULL DEFAULT now(),
    body        jsonb NOT NULL,
CONSTRAINT auth_vkontakte_account_pkey PRIMARY KEY (id),
--  KEY `FK_vkontakte_account_id` (`account_id`),
CONSTRAINT auth_vkontakte_account_fkey_account_id FOREIGN KEY (account_id) REFERENCES sn.account (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    "access_token": "", -- VARCHAR(250) NOT NULL DEFAULT ''
    "email": "",        -- VARCHAR(250) NOT NULL DEFAULT ''
    "first_name": "",   -- VARCHAR(250) NOT NULL DEFAULT ''
    "last_name": ""     -- VARCHAR(250) NOT NULL DEFAULT ''
}
*/
