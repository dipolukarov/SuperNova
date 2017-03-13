/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.ube_report_unit;
CREATE TABLE sn.ube_report_unit (
    id              serial,             -- COMMENT 'Record DB ID'
    ube_report_id   bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Report ID'
    player_id       bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Owner ID'
    fleet_id        bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Fleet ID'
    unit_id         bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Unit ID'
    body            jsonb NOT NULL,
CONSTRAINT ube_report_unit_pkey PRIMARY KEY (id),
--  KEY `I_ube_report_unit_report_round_fleet_order` (`ube_report_id`, `ube_report_unit_round`, `ube_report_unit_fleet_id`, `ube_report_unit_sort_order`),
--  KEY `I_ube_report_unit_report_unit_order` (`ube_report_id`, `ube_report_unit_sort_order`),
--  KEY `I_ube_report_unit_order` (`ube_report_unit_sort_order`),
CONSTRAINT ube_report_unit_fkey_ube_report_id FOREIGN KEY (ube_report_id) REFERENCES sn.ube_report (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    round       TINYINT(4)              NOT NULL DEFAULT '0' COMMENT 'Round number',
    count       DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit count',
    boom        SMALLINT(5) UNSIGNED    NOT NULL DEFAULT '0' COMMENT 'Unit booms',
    attack      DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit attack',
    shield      DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit shield',
    armor       DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit armor',
    attack_base DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit base attack',
    shield_base DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit base shield',
    armor_base  DECIMAL(65, 0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit base armor',
    sort_order  BIGINT(20) UNSIGNED     NOT NULL DEFAULT '0' COMMENT 'Unit pass-through sort order to maintain same output',
}
*/
