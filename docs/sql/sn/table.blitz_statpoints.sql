/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.blitz_statpoints;
CREATE TABLE sn.blitz_statpoints (
    server_id       bigint,         -- SMALLINT(5) UNSIGNED DEFAULT '0',
    round_number    bigint,         -- SMALLINT(5) UNSIGNED DEFAULT '0'
    stat_date       timestamptz,    -- INT(11) NOT NULL DEFAULT '0'
    id_owner        bigint,
    id_ally         bigint,
    body            jsonb NOT NULL,
CONSTRAINT blitz_statpoints_fkey_id_ally FOREIGN KEY (id_ally) REFERENCES sn.alliance (id)
);
/*
    `stat_type`      TINYINT(3) UNSIGNED                 DEFAULT '0',
    `stat_code`      TINYINT(3) UNSIGNED     NOT NULL    DEFAULT '0',
    `tech_rank`      INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `tech_old_rank`  INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `tech_points`    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `tech_count`     DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `build_rank`     INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `build_old_rank` INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `build_points`   DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `build_count`    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `defs_rank`      INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `defs_old_rank`  INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `defs_points`    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `defs_count`     DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `fleet_rank`     INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `fleet_old_rank` INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `fleet_points`   DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `fleet_count`    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `res_rank`       INT(11) UNSIGNED                    DEFAULT '0' COMMENT 'Rank by resources',
    `res_old_rank`   INT(11) UNSIGNED                    DEFAULT '0' COMMENT 'Old rank by resources',
    `res_points`     DECIMAL(65, 0) UNSIGNED             DEFAULT '0' COMMENT 'Resource stat points',
    `res_count`      DECIMAL(65, 0) UNSIGNED             DEFAULT '0' COMMENT 'Resource count',
    `total_rank`     INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `total_old_rank` INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    `total_points`   DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    `total_count`    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
*/
