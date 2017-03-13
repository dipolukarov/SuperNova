/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.captain;
CREATE TABLE sn.captain (
    id      serial, -- COMMENT 'Record ID'
    unit_id bigint, -- COMMENT 'Link to `unit` record'
    body    jsonb NOT NULL,
CONSTRAINT captain_pkey PRIMARY KEY (id),
--  KEY `I_captain_unit_id` (`captain_unit_id`),
CONSTRAINT captain_fkey_unit_id FOREIGN KEY (unit_id) REFERENCES sn.unit (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    `captain_xp`      DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Captain expirience',
    `captain_level`   BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Captain level so far',
    `captain_shield`  BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Captain shield bonus level',
    `captain_armor`   BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Captain armor bonus level',
    `captain_attack`  BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Captain defense bonus level',
}
*/
