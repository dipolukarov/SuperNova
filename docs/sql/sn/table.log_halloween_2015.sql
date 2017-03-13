/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.log_halloween_2015;
CREATE TABLE sn.log_halloween_2015 (
    id          serial,
    timestamp   timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    body        jsonb NOT NULL,
CONSTRAINT log_halloween_2015_pkey PRIMARY KEY (id)
--  KEY `player_id` (`player_id`, `log_hw2015_id`)
);
/*
{
    player_id   BIGINT(20) UNSIGNED NOT NULL COMMENT 'User ID',
    player_name VARCHAR(32)         NOT NULL DEFAULT '',
    unit_snid   BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
}
*/
