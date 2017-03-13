/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.festival_highspot;
CREATE TABLE sn.festival_highspot (
    id          serial,
    festival_id bigint,
    start       timestamptz NOT NULL,   -- DATETIME NOT NULL COMMENT 'Highspot start datetime'
    finish      timestamptz NOT NULL,   -- DATETIME NOT NULL COMMENT 'Highspot end datetime'
    body        jsonb NOT NULL,
CONSTRAINT festival_highspot_pkey PRIMARY KEY (id),
--  KEY `I_highspot_order` (`start`, `finish`, `id`),
--  KEY `I_highspot_festival_id` (`festival_id`, `start`, `finish`, `id`) USING BTREE,
CONSTRAINT festival_highspot_fkey_festival_id FOREIGN KEY (festival_id) REFERENCES sn.festival (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    class       TINYINT(3) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Highspot class',
    name        VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
}
*/
