/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.annonce;
CREATE TABLE sn.annonce (
    id      serial,
    user_id bigint,
    body    jsonb NOT NULL,
CONSTRAINT annonce_pkey PRIMARY KEY (id),
--  KEY `I_annonce_user` (`user`, `id`),
CONSTRAINT annonce_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    "galaxie": 0,   -- INT(11) NOT NULL DEFAULT '0'
    "systeme": 0,   -- INT(11) NOT NULL DEFAULT '0'
    "metala": 0,    -- BIGINT(11) NOT NULL DEFAULT '0'
    "cristala": 0,  -- BIGINT(11) NOT NULL DEFAULT '0'
    "deuta": 0,     -- BIGINT(11) NOT NULL DEFAULT '0'
    "metals": 0,    -- BIGINT(11) NOT NULL DEFAULT '0'
    "cristals": 0,  -- BIGINT(11) NOT NULL DEFAULT '0'
    "deuts": 0      -- BIGINT(11) NOT NULL DEFAULT '0'
}
*/
