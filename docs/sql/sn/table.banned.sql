/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.banned;
CREATE TABLE sn.banned (
    id          serial,
    user_id     bigint,         -- COMMENT 'Banned user ID'
    issuer_id   bigint,         -- COMMENT 'Banner ID'
    time        timestamptz,    -- INT(11) NOT NULL DEFAULT '0'
    until       timestamptz,    -- INT(11) NOT NULL DEFAULT '0'
    body        jsonb NOT NULL,
CONSTRAINT banned_pkey PRIMARY KEY (id),
--  KEY `ID` (`ban_id`),
--  KEY `I_ban_user_id` (`ban_user_id`),
--  KEY `I_ban_issuer_id` (`ban_issuer_id`),
CONSTRAINT banned_fkey_issuer_id FOREIGN KEY (issuer_id) REFERENCES sn.users (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
CONSTRAINT banned_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);
/*
{
    "reason": ""    -- VARCHAR(128) NOT NULL DEFAULT ''
}
*/
