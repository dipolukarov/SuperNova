/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.blitz_registrations;
CREATE TABLE sn.blitz_registrations (
    id              serial,
    server_id       bigint, -- SMALLINT(5) UNSIGNED DEFAULT '0',
    round_number    bigint, -- SMALLINT(5) UNSIGNED DEFAULT '0',
    user_id         bigint,
    timestamp       timestamptz NOT NULL DEFAULT now(), -- NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    body            jsonb NOT NULL,
CONSTRAINT blitz_registrations_pkey PRIMARY KEY (id),
CONSTRAINT blitz_registrations_uniq UNIQUE (server_id, round_number, user_id),
--  KEY `I_blitz_user_id` (`user_id`) USING BTREE,
CONSTRAINT blitz_registrations_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    `blitz_name`               VARCHAR(32) CHARACTER SET utf8      NOT NULL DEFAULT '',
    `blitz_password`           VARCHAR(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
    `blitz_player_id`          BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0',
    `blitz_status`             TINYINT(3) UNSIGNED     NOT NULL DEFAULT '0',
    `blitz_place`              TINYINT(3) UNSIGNED     NOT NULL DEFAULT '0',
    `blitz_points`             DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0',
    `blitz_online`             INT(10) UNSIGNED        NOT NULL DEFAULT '0',
    `blitz_reward_dark_matter` BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0',
}
*/
