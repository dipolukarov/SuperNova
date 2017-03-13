/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.festival;
CREATE TABLE sn.festival (
    id      serial,
    start   timestamptz NOT NULL,       -- DATETIME NOT NULL COMMENT 'Festival start datetime'
    finish  timestamptz NOT NULL,       -- DATETIME NOT NULL COMMENT 'Festival end datetime'
    name    text NOT NULL DEFAULT '',   -- VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Название акции/ивента'
CONSTRAINT festival_pkey PRIMARY KEY (id)
--  KEY `I_festival_date_range` (`start`, `finish`, `id`) USING BTREE
);
