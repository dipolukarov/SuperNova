/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.ube_report;
CREATE TABLE sn.ube_report (
    id              serial,                                         -- COMMENT 'Report ID'
    cypher          CHAR(32) NOT NULL DEFAULT '',                   -- COMMENT '16 char secret report ID'
    time_combat     timestamptz NOT NULL DEFAULT now(),             -- COMMENT 'Combat time'
    time_process    timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- COMMENT 'Time when combat was processed'
    body            jsonb NOT NULL,
CONSTRAINT ube_report_pkey PRIMARY KEY (id)
--  KEY `I_ube_report_cypher` (`ube_report_cypher`),
--  KEY `I_ube_report_time_combat` (`ube_report_time_combat`),
--  KEY `I_ube_report_time_debris_id` (`ube_report_time_process`, `ube_report_debris_total_in_metal`, `ube_report_id`)
);
/*
{
    time_spent              DECIMAL(11, 8) UNSIGNED NOT NULL DEFAULT '0.00000000' COMMENT 'Time in seconds spent for combat calculations',
    mission_type            TINYINT(1) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Mission type',
    combat_admin            TINYINT(1) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Does admin participates in combat?',
    combat_result           TINYINT(1)              NOT NULL DEFAULT '0' COMMENT 'Combat outcome',
    combat_sfr              TINYINT(1)              NOT NULL DEFAULT '0' COMMENT 'Small Fleet Reconnaissance',
    planet_id               BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Player planet ID',
    planet_name             VARCHAR(64)             NOT NULL DEFAULT 'Planet' COMMENT 'Player planet name',
    planet_size             SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Player diameter',
    planet_galaxy           SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Player planet coordinate galaxy',
    planet_system           SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Player planet coordinate system',
    planet_planet           SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Player planet coordinate planet',
    planet_planet_type      TINYINT(4)              NOT NULL DEFAULT '1' COMMENT 'Player planet type',
    moon                    TINYINT(1)              NOT NULL DEFAULT '0' COMMENT 'Moon result: was, none, failed, created, destroyed',
    moon_chance             DECIMAL(9, 6) UNSIGNED  NOT NULL DEFAULT '0.000000' COMMENT 'Moon creation chance',
    moon_size               SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Moon size',
    moon_reapers            TINYINT(1)              NOT NULL DEFAULT '0' COMMENT 'Moon reapers result: none, died, survived',
    moon_destroy_chance     TINYINT(1)              NOT NULL DEFAULT '0' COMMENT 'Moon destroy chance',
    moon_reapers_die_chance TINYINT(1)              NOT NULL DEFAULT '0' COMMENT 'Moon reapers die chance',
    debris_metal            DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Metal debris',
    debris_crystal          DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Crystal debris',
    capture_result          TINYINT(3) UNSIGNED     NOT NULL DEFAULT '0', `ube_report_debris_total_in_metal`
            DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Total debris in metal',
}
*/
