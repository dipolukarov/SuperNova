/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.que;
CREATE TABLE sn.que (
    id                  serial,                                 -- COMMENT 'Internal que id'
    player_id           bigint,                                 -- COMMENT 'Que owner ID'
    planet_id           bigint,                                 -- COMMENT 'Which planet this que item belongs'
    planet_id_origin    bigint,                                 -- COMMENT 'Planet spawner ID'
    time_left           numeric(20, 5) NOT NULL DEFAULT .00000, -- COMMENT 'Build time left from last activity'
    unit_id             bigint NOT NULL DEFAULT 0,              -- COMMENT 'Unit ID'
    unit_time           numeric(20, 5) NOT NULL DEFAULT .00000, -- COMMENT 'Time to build one unit. Informational field',
CONSTRAINT que_pkey PRIMARY KEY (id),
--  KEY `I_que_player_type_planet` (`que_player_id`, `que_type`, `que_planet_id`, `que_id`),
--  KEY `I_que_player_type` (`que_player_id`, `que_type`, `que_id`),
--  KEY `I_que_planet_id` (`que_planet_id`),
--  KEY `FK_que_planet_id_origin` (`que_planet_id_origin`),
CONSTRAINT que_fkey_planet_id FOREIGN KEY (planet_id) REFERENCES sn.planets (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT que_fkey_planet_id_origin FOREIGN KEY (planet_id_origin) REFERENCES sn.planets (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT que_fkey_player_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    type                TINYINT(1) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Que type',
    unit_amount         BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Amount left to build',
    unit_mode           TINYINT(1)              NOT NULL DEFAULT '0' COMMENT 'Build/Destroy',
    unit_level          INT(10) UNSIGNED        NOT NULL DEFAULT '0' COMMENT 'Unit level. Informational field',
    unit_price          VARCHAR(128)            NOT NULL DEFAULT '' COMMENT 'Price per unit - for correct trim/clear in case of global price events',
}
*/
