/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.ube_report_outcome_fleet;
CREATE TABLE sn.ube_report_outcome_fleet (
    id              serial,             -- COMMENT 'Record DB ID'
    ube_report_id   bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Report ID'
    fleet_id        bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Fleet ID'
    body            jsonb NOT NULL,
CONSTRAINT ube_report_outcome_fleet_pkey PRIMARY KEY (id),
--  KEY `I_ube_report_outcome_fleet_report_fleet` (`ube_report_id`, `ube_report_outcome_fleet_fleet_id`),
CONSTRAINT ube_report_outcome_fleet_fkey_ube_report_id FOREIGN KEY (ube_report_id) REFERENCES sn.ube_report (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    resource_lost_metal        DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Fleet metal loss from units',
    resource_lost_crystal      DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Fleet crystal loss from units',
    resource_lost_deuterium    DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Fleet deuterium loss from units',
    resource_dropped_metal     DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Fleet metal dropped due reduced cargo',
    resource_dropped_crystal   DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Fleet crystal dropped due reduced cargo',
    resource_dropped_deuterium DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Fleet deuterium dropped due reduced cargo',
    resource_loot_metal        DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Looted/Lost from loot metal',
    resource_loot_crystal      DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Looted/Lost from loot crystal',
    resource_loot_deuterium    DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Looted/Lost from loot deuterium',
    resource_lost_in_metal     DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Fleet total resource loss in metal',
}
*/
