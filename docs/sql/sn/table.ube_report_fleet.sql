/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.ube_report_fleet;
CREATE TABLE sn.ube_report_fleet (
    id              serial,             -- COMMENT 'Record DB ID'
    ube_report_id   bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Report ID'
    player_id       bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Owner ID'
    fleet_id        bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Fleet ID'
    planet_id       bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Player attack bonus'
    body            jsonb NOT NULL,
CONSTRAINT ube_report_fleet_pkey PRIMARY KEY (id),
--  KEY `FK_ube_report_fleet_ube_report` (`ube_report_id`),
CONSTRAINT ube_report_fleet_fkey_ube_report_id FOREIGN KEY (ube_report_id) REFERENCES sn.ube_report (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    planet_name         VARCHAR(64)             NOT NULL DEFAULT 'Planet' COMMENT 'Player planet name',
    planet_galaxy       SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Player planet coordinate galaxy',
    planet_system       SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Player planet coordinate system',
    planet_planet       SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Player planet coordinate planet',
    planet_planet_type  TINYINT(4)              NOT NULL DEFAULT '1' COMMENT 'Player planet type',
    bonus_attack        DECIMAL(11, 2)          NOT NULL DEFAULT '0.00' COMMENT 'Fleet attack bonus',
    bonus_shield        DECIMAL(11, 2)          NOT NULL DEFAULT '0.00' COMMENT 'Fleet shield bonus',
    bonus_armor         DECIMAL(11, 2)          NOT NULL DEFAULT '0.00' COMMENT 'Fleet armor bonus',
    resource_metal      DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Fleet metal amount',
    resource_crystal    DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Fleet crystal amount',
    resource_deuterium  DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Fleet deuterium amount',
}
*/
