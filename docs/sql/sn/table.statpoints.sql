/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.statpoints;
CREATE TABLE sn.statpoints (
    stat_date   timestamptz NOT NULL DEFAULT now(),  -- INT(11) NOT NULL DEFAULT '0'
    id_owner    bigint,
    id_ally     bigint,
    body        jsonb NOT NULL,
--  KEY `TECH` (`tech_points`),
--  KEY `BUILDS` (`build_points`),
--  KEY `DEFS` (`defs_points`),
--  KEY `FLEET` (`fleet_points`),
--  KEY `TOTAL` (`total_points`),
--  KEY `i_stats_owner` (`id_owner`, `stat_type`, `stat_code`, `tech_rank`, `build_rank`, `defs_rank`, `fleet_rank`, `total_rank`),
--  KEY `I_stats_id_ally` (`id_ally`, `stat_type`, `stat_code`) USING BTREE,
--  KEY `I_stats_type_code` (`stat_type`, `stat_code`) USING BTREE,
CONSTRAINT statpoints_fkey_id_ally FOREIGN KEY (id_ally) REFERENCES sn.alliance (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT statpoints_fkey_id_owner FOREIGN KEY (id_owner) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    stat_type      TINYINT(3) UNSIGNED                 DEFAULT '0',
    stat_code      TINYINT(3) UNSIGNED     NOT NULL    DEFAULT '0',
    tech_rank      INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    tech_old_rank  INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    tech_points    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    tech_count     DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    build_rank     INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    build_old_rank INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    build_points   DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    build_count    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    defs_rank      INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    defs_old_rank  INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    defs_points    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    defs_count     DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    fleet_rank     INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    fleet_old_rank INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    fleet_points   DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    fleet_count    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    res_rank       INT(11) UNSIGNED                    DEFAULT '0' COMMENT 'Rank by resources',
    res_old_rank   INT(11) UNSIGNED                    DEFAULT '0' COMMENT 'Old rank by resources',
    res_points     DECIMAL(65, 0) UNSIGNED             DEFAULT '0' COMMENT 'Resource stat points',
    res_count      DECIMAL(65, 0) UNSIGNED             DEFAULT '0' COMMENT 'Resource count',
    total_rank     INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    total_old_rank INT(11) UNSIGNED        NOT NULL    DEFAULT '0',
    total_points   DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
    total_count    DECIMAL(65, 0) UNSIGNED NOT NULL    DEFAULT '0',
}
*/
