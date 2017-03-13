/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.unit;
CREATE TABLE sn.unit (
    id          serial, -- COMMENT 'Record ID',
    player_id   bigint, -- COMMENT 'Unit owner',
    body        jsonb NOT NULL,
CONSTRAINT unit_pkey PRIMARY KEY (id),
--  KEY `I_unit_player_location_snid` (`unit_player_id`, `unit_location_type`, `unit_location_id`, `unit_snid`),
--  KEY `I_unit_record_search` (`unit_snid`, `unit_player_id`, `unit_level`, `unit_id`),
--  KEY `I_unit_location` (`unit_location_type`, `unit_location_id`),
--  KEY `I_unit_type_snid` (`unit_type`, `unit_snid`) USING BTREE,
CONSTRAINT unit_fkey_player_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    `unit_location_type` TINYINT(4)              NOT NULL DEFAULT '0' COMMENT 'Location type: universe, user, planet (moon?), fleet',
    `unit_location_id`   BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Location ID',
    `unit_type`          BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Unit type',
    `unit_snid`          BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Unit SuperNova ID',
    `unit_level`         DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit level or count - dependent of unit_type',
    `unit_time_start`    DATETIME                         DEFAULT NULL COMMENT 'Unit activation start time',
    `unit_time_finish`   DATETIME                         DEFAULT NULL COMMENT 'Unit activation end time',
}
*/
