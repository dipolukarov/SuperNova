/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.notes;
CREATE TABLE sn.notes (
    id      serial,
    owner   bigint,
    time    timestamptz, -- INT(11) DEFAULT NULL,
    body    jsonb NOT NULL,
CONSTRAINT notes_pkey PRIMARY KEY (id),
--  KEY `I_notes_owner` (`owner`),
--  KEY `I_owner_priority_time` (`owner`, `priority`, `time`),
CONSTRAINT notes_fkey_owner FOREIGN KEY (owner) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    `priority`    TINYINT(1)                    DEFAULT NULL,
    `title`       VARCHAR(32)                   DEFAULT NULL,
    `galaxy`      SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
    `system`      SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
    `planet`      SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
    `planet_type` TINYINT(4) UNSIGNED  NOT NULL DEFAULT '1',
    `text`        TEXT,
    `sticky`      TINYINT(1) UNSIGNED  NOT NULL DEFAULT '0',
}
*/
