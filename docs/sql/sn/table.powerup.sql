/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.powerup;
CREATE TABLE sn.powerup (
    id          serial,
    user_id     bigint,
    planet_id   bigint,
    category    int,                    -- SMALLINT(6) NOT NULL DEFAULT '0'
    unit_id     int NOT NULL,           -- MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0'
    unit_level  int NOT NULL,           -- SMALLINT(5) UNSIGNED  NOT NULL DEFAULT '0'
    time_start  timestamptz NOT NULL,   -- INT(11) NOT NULL DEFAULT '0'
    time_finish timestamptz NOT NULL,   -- INT(11) NOT NULL DEFAULT '0'
CONSTRAINT powerup_pkey PRIMARY KEY (id),
--  KEY `I_powerup_user_id` (`powerup_user_id`),
--  KEY `I_powerup_planet_id` (`powerup_planet_id`),
--  KEY `I_user_powerup_time` (`powerup_user_id`, `powerup_unit_id`, `powerup_time_start`, `powerup_time_finish`),
--  KEY `I_planet_powerup_time` (`powerup_planet_id`, `powerup_unit_id`, `powerup_time_start`, `powerup_time_finish`),
CONSTRAINT powerup_fkey_planet_id FOREIGN KEY (planet_id) REFERENCES sn.planets (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT powerup_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
