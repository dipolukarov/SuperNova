/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.bashing;
CREATE TABLE sn.bashing (
    id          serial,
    user_id     bigint,
    planet_id   bigint,
    time        timestamptz,    -- INT(11) NOT NULL DEFAULT '0'
CONSTRAINT bashing_pkey PRIMARY KEY (id),
--  KEY `bashing_user_id` (`bashing_user_id`, `bashing_planet_id`, `bashing_time`),
--  KEY `bashing_planet_id` (`bashing_planet_id`),
--  KEY `bashing_time` (`bashing_time`),
CONSTRAINT bashing_fkey_planet_id FOREIGN KEY (planet_id) REFERENCES sn.planets (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT bashing_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
