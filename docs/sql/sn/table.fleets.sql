/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.fleets;
CREATE TABLE sn.fleets (
    id              serial,
    owner           bigint,
    start_planet_id bigint,         -- COMMENT 'Fleet start planet ID'
    end_planet_id   bigint,         -- COMMENT 'Fleet end planet ID'
    start_time      timestamptz,    -- INT(11) DEFAULT '0'
    body            jsonb NOT NULL,
CONSTRAINT fleets_pkey PRIMARY KEY (id),
--  KEY `fleet_origin` (`fleet_start_galaxy`, `fleet_start_system`, `fleet_start_planet`),
--  KEY `fleet_dest` (`fleet_end_galaxy`, `fleet_end_system`, `fleet_end_planet`),
--  KEY `fleet_start_time` (`fleet_start_time`),
--  KEY `fllet_end_time` (`fleet_end_time`),
--  KEY `fleet_owner` (`fleet_owner`),
--  KEY `i_fl_targ_owner` (`fleet_target_owner`),
--  KEY `fleet_both` (`fleet_start_galaxy`, `fleet_start_system`, `fleet_start_planet`, `fleet_start_type`, `fleet_end_galaxy`, `fleet_end_system`, `fleet_end_planet`),
--  KEY `fleet_mess` (`fleet_mess`),
--  KEY `fleet_group` (`fleet_group`),
--  KEY `I_fleet_start_planet_id` (`fleet_start_planet_id`),
--  KEY `I_fleet_end_planet_id` (`fleet_end_planet_id`),
CONSTRAINT fleets_fkey_owner FOREIGN KEY (owner) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT fleets_fkey_end_planet_id FOREIGN KEY (end_planet_id) REFERENCES sn.planets (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
CONSTRAINT fleets_fkey_start_planet_id FOREIGN KEY (start_planet_id) REFERENCES sn.planets (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);
/*
{
    mission            INT(11)             NOT NULL DEFAULT '0',
    amount             BIGINT(11)          NOT NULL DEFAULT '0',
    array              TEXT,
    fleet_start_time   INT(11)             NOT NULL DEFAULT '0',
    start_galaxy       INT(11)             NOT NULL DEFAULT '0',
    start_system       INT(11)             NOT NULL DEFAULT '0',
    start_planet       INT(11)             NOT NULL DEFAULT '0',
    start_type         INT(11)             NOT NULL DEFAULT '0',
    end_time           INT(11)             NOT NULL DEFAULT '0',
    end_stay           INT(11)             NOT NULL DEFAULT '0',
    end_galaxy         INT(11)             NOT NULL DEFAULT '0',
    end_system         INT(11)             NOT NULL DEFAULT '0',
    end_planet         INT(11)             NOT NULL DEFAULT '0',
    end_type           INT(11)             NOT NULL DEFAULT '0',
    resource_metal     DECIMAL(65, 0)               DEFAULT '0',
    resource_crystal   DECIMAL(65, 0)               DEFAULT '0',
    resource_deuterium DECIMAL(65, 0)               DEFAULT '0',
    target_owner       INT(11)             NOT NULL DEFAULT '0',
    group              VARCHAR(15)         NOT NULL DEFAULT '0',
    mess               INT(11)             NOT NULL DEFAULT '0',
}
*/
