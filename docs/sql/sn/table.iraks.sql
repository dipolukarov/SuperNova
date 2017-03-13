/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.iraks;
CREATE TABLE sn.iraks (
    id              serial,
    owner           bigint,
    target_owner    bigint,
    body            jsonb NOT NULL,
CONSTRAINT iraks_pkey PRIMARY KEY (id),
--  KEY `I_iraks_fleet_owner` (`fleet_owner`),
--  KEY `I_iraks_fleet_target_owner` (`fleet_target_owner`),
CONSTRAINT iraks_fkey_owner FOREIGN KEY (owner) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT iraks_fkey_target_owner FOREIGN KEY (target_owner) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    end_time     INT(11) UNSIGNED    NOT NULL DEFAULT '0',
    end_galaxy   INT(2) UNSIGNED              DEFAULT '0',
    end_system   INT(4) UNSIGNED              DEFAULT '0',
    end_planet   INT(2) UNSIGNED              DEFAULT '0',
    start_galaxy INT(2) UNSIGNED              DEFAULT '0',
    start_system INT(4) UNSIGNED              DEFAULT '0',
    start_planet INT(2) UNSIGNED              DEFAULT '0',
    amount       BIGINT(20) UNSIGNED          DEFAULT '0',
    primaer            INT(32)                      DEFAULT NULL,
    start_type   SMALLINT(6)         NOT NULL DEFAULT '1',
    end_type     SMALLINT(6)         NOT NULL DEFAULT '1',
}
*/
