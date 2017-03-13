/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.festival_unit_log;
CREATE TABLE sn.festival_unit_log (
    id          serial,
    highspot_id bigint,
    player_id   bigint NOT NULL,    -- COMMENT 'User ID'
    unit_id     bigint NOT NULL,    -- DEFAULT '0'
    timestamp   timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    body        jsonb NOT NULL,
CONSTRAINT festival_unit_log_pkey PRIMARY KEY (id),
--  KEY `I_festival_unit_log_player_id` (`player_id`, `highspot_id`, `id`) USING BTREE,
--  KEY `I_festival_unit_log_highspot_id` (`highspot_id`, `unit_id`, `player_id`) USING BTREE,
CONSTRAINT festival_unit_log_fkey_highspot_id FOREIGN KEY (highspot_id) REFERENCES sn.festival_highspot (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT festival_unit_log_fkey_player_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    `player_name` VARCHAR(32)         NOT NULL DEFAULT '',
    `unit_image`  VARCHAR(255)        NOT NULL DEFAULT '',
    unit_level`  INT(11)             NOT NULL DEFAULT '0',
}
*/
