/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.player_name_history;
CREATE TABLE sn.player_name_history (
    player_id   bigint,                                         -- COMMENT 'Player ID'
    player_name VARCHAR(32) NOT NULL,                           -- COMMENT 'Historical player name'
    timestamp   timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- ON UPDATE CURRENT_TIMESTAMP COMMENT 'When player changed name'
CONSTRAINT player_name_history_pkey PRIMARY KEY (player_name),
--  KEY `I_player_name_history_id_name` (`player_id`, `player_name`),
CONSTRAINT player_name_history_fkey_player_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
