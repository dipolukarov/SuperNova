/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.festival_unit;
CREATE TABLE sn.festival_unit (
    id          serial,
    highspot_id bigint,
    player_id   bigint,
    unit_id     bigint NOT NULL,    -- BIGINT(20) NOT NULL DEFAULT '0'
    unit_level  bigint NOT NULL,    -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
CONSTRAINT festival_unit_pkey PRIMARY KEY (id),
--  KEY `I_festival_unit_player_id` (`player_id`, `highspot_id`) USING BTREE,
--  KEY `I_festival_unit_highspot_id` (`highspot_id`, `unit_id`, `player_id`) USING BTREE,
CONSTRAINT festival_unit_fkey_highspot_id FOREIGN KEY (highspot_id) REFERENCES sn.festival_highspot (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT festival_unit_fkey_player_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
