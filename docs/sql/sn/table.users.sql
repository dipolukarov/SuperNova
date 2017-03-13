/**
 * Table structure for sn_users
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.users;
CREATE TABLE sn.users (
    id                      serial,
    parent_account_id       bigint,                                 -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
    parent_account_global   bigint,                                 -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'

    ally_id                 bigint,
    ally_register_time      timestamptz,                            -- INT(11) NOT NULL DEFAULT '0'
    authlevel               int             NOT NULL DEFAULT 0,     -- TINYINT(3) UNSIGNED
    banaday                 timestamptz,                            -- INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ban status'
    deltime                 timestamptz,                            -- INT(10) UNSIGNED DEFAULT '0'
    immortal                timestamptz,                            -- DEFAULT NULL
    register_time           timestamptz NOT NULL DEFAULT now(),     -- INT(10) UNSIGNED DEFAULT '0'
    user_as_ally            bigint,
    user_last_browser_id    bigint,
    user_lastip             inet,                                   -- COMMENT 'User last IP'
    username                VARCHAR(32)     NOT NULL DEFAULT '',    -- COMMENT 'Player name'
    onlinetime              timestamptz NOT NULL DEFAULT now(),     -- INT(10) UNSIGNED DEFAULT '0'
    
    body                    jsonb NOT NULL,
CONSTRAINT users_pkey PRIMARY KEY (id),
--  KEY `i_ally_id` (`ally_id`),
--  KEY `i_ally_name` (`ally_name`),
--  KEY `i_username` (`username`),
--  KEY `i_ally_online` (`ally_id`, `onlinetime`),
--  KEY `onlinetime` (`onlinetime`),
--  KEY `i_register_time` (`register_time`),
--  KEY `FK_users_ally_tag` (`ally_tag`),
--  KEY `I_user_user_as_ally` (`user_as_ally`),
--  KEY `I_user_birthday` (`user_birthday`, `user_birthday_celebrated`),
--  KEY `I_user_id_name` (`id`, `username`),
--  KEY `I_users_last_browser_id` (`user_last_browser_id`),
--  KEY `I_users_parent_account_id` (`parent_account_id`),
--  KEY `I_users_parent_account_global` (`parent_account_global`),
CONSTRAINT users_fkey_browser_id FOREIGN KEY (user_last_browser_id) REFERENCES sn.security_browser (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);
/*
{
    "admin_protection": 0,              -- TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Protection of administration planets'
    "ally_rank_id": 0,                  -- INT(11) NOT NULL DEFAULT '0'
    "avatar": false,                    -- TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
    "bana": null,                       -- INT(11) DEFAULT NULL
    "crystal": 0.00000,                 -- DECIMAL(65, 5) NOT NULL DEFAULT '0.00000'
    "current_planet": 0,                -- INT(11) NOT NULL DEFAULT '0'
    "dark_matter": 0,                   -- BIGINT(20) DEFAULT '0'
    "dark_matter_total": 0,             -- BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Total Dark Matter amount ever gained'
    "design": 1,                        -- TINYINT(4) UNSIGNED NOT NULL DEFAULT '1'
    "deuterium": 0.00000,               -- DECIMAL(65, 5) NOT NULL DEFAULT '0.00000'
    "dpath": "",                        -- VARCHAR(255) NOT NULL DEFAULT '',
    "email": "",                        -- VARCHAR(64) NOT NULL DEFAULT ''
    "email_2": "",                      -- VARCHAR(64) NOT NULL DEFAULT ''
    "galaxy": 0,                        -- INT(11) NOT NULL DEFAULT '0'
    "gender": 0,                        -- TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
    "id_planet": 0,                     -- INT(11) NOT NULL DEFAULT '0'
    "lang": "ru",                       -- VARCHAR(8) NOT NULL DEFAULT 'ru'
    "lvl_minier": 1,                    -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '1'
    "lvl_raid": 1,                      -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '1'
    "metal": 0.00000,                   -- DECIMAL(65, 5) NOT NULL DEFAULT '0.00000'
    "metamatter": 0,                    -- BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Metamatter amount'
    "metamatter_total": 0,              -- BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Total Metamatter amount ever bought'
    "mnl_alliance": 0,                  -- INT(11) NOT NULL DEFAULT '0'
    "mnl_attaque": 0,                   -- INT(11) NOT NULL DEFAULT '0'
    "mnl_buildlist": 0,                 -- INT(11) NOT NULL DEFAULT '0'
    "mnl_expedition": 0,                -- INT(11) NOT NULL DEFAULT '0'
    "mnl_exploit": 0,                   -- INT(11) NOT NULL DEFAULT '0'
    "mnl_joueur": 0,                    -- INT(11) NOT NULL DEFAULT '0'
    "mnl_spy": 0,                       -- INT(11) NOT NULL DEFAULT '0'
    "mnl_transport": 0,                 -- INT(11) NOT NULL DEFAULT '0'
    "msg_admin": 0,                     -- BIGINT(11) UNSIGNED DEFAULT '0'
    "new_message": 0,                   -- INT(11) NOT NULL DEFAULT '0'
    "news_lastread": 0,                 -- INT(10) UNSIGNED DEFAULT '0'
    "noipcheck": 1,                     -- TINYINT(4) UNSIGNED NOT NULL DEFAULT '1'
    "options": null,                    -- MEDIUMTEXT COMMENT 'Packed user options'
    "password": "",                     -- VARCHAR(64) NOT NULL DEFAULT ''
    "planet": 0,                        -- INT(11) NOT NULL DEFAULT '0'
    "player_race": 0,                   -- INT(11) NOT NULL DEFAULT '0' COMMENT 'Player''s race'
    "player_rpg_explore_xp": 0,         -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
    "player_rpg_explore_level": 0,      -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
    "player_rpg_tech_level: 0,          -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
    "player_rpg_tech_xp": 0,            -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
    "que_processed": 0,                 -- INT(11) UNSIGNED NOT NULL DEFAULT '0'
    "raids": 0,                         -- BIGINT(20) UNSIGNED DEFAULT '0'
    "raidsloose": 0,                    -- BIGINT(20) UNSIGNED DEFAULT '0'
    "raidswin": 0,                      -- BIGINT(20) UNSIGNED DEFAULT '0'
    "salt": "",                         -- CHAR(16)
    "server_name": "",                  -- VARCHAR(128) NOT NULL DEFAULT '',
    "sign": "",                         -- MEDIUMTEXT
    "system": 0,                        -- INT(11) NOT NULL DEFAULT '0'
    "total_rank": 0,                    -- INT(10) UNSIGNED NOT NULL DEFAULT '0'
    "total_points": 0,                  -- BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
    "user_birthday": null,              -- DATE DEFAULT NULL COMMENT 'User birthday'
    "user_birthday_celebrated": null,   -- DATE DEFAULT NULL COMMENT 'Last time where user got birthday gift'
    "user_bot": 0,                      -- TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
    "user_last_proxy": "",              -- VARCHAR(250) NOT NULL DEFAULT ''
    "vacation": 0,                      -- INT(11) UNSIGNED DEFAULT '0'
    "vacation_next": 0,                 -- INT(11) NOT NULL DEFAULT '0' COMMENT 'Next datetime when player can go on vacation'
    "xpminier": 0,                      -- BIGINT(20) UNSIGNED DEFAULT '0'
    "xpraid": 0,                        -- BIGINT(20) UNSIGNED DEFAULT '0'
}
*/
