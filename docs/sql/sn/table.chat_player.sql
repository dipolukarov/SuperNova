/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.chat_player;
CREATE TABLE sn.chat_player (
    id              serial,                             -- COMMENT 'Record ID'
    player_id       bigint,                             -- COMMENT 'Chat player record owner'
    activity        timestamptz NOT NULL DEFAULT now(), -- NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last player activity in chat'
    refresh_last    timestamptz,                        -- INT(11) NOT NULL DEFAULT '0' COMMENT 'Player last refresh time'
    body            jsonb NOT NULL,
CONSTRAINT chat_player_pkey PRIMARY KEY (id),
--  KEY `I_chat_player_id` (`chat_player_player_id`),
--  KEY `I_chat_player_refresh_last` (`chat_player_refresh_last`),
CONSTRAINT chat_player_fkey_player_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    invisible    TINYINT(4)          NOT NULL DEFAULT '0' COMMENT 'Player invisibility',
    muted        INT(11)             NOT NULL DEFAULT '0' COMMENT 'Player is muted',
    mute_reason  VARCHAR(256)        NOT NULL DEFAULT '' COMMENT 'Player mute reason'
}
*/
