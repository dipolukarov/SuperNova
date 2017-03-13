/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.ube_report_outcome_unit;
CREATE TABLE sn.ube_report_outcome_unit (
    id              serial,             -- COMMENT 'Record DB ID'
    ube_report_id   bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Report ID'
    fleet_id        bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Fleet ID'
    unit_id         bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Unit ID'
    body            jsonb NOT NULL,
CONSTRAINT ube_report_outcome_unit_pkey PRIMARY KEY (id),
--  KEY `I_ube_report_outcome_unit_report_order` (`ube_report_id`, `ube_report_outcome_unit_sort_order`),
CONSTRAINT ube_report_outcome_unit_fkey_ube_report_id FOREIGN KEY (ube_report_id) REFERENCES sn.ube_report (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    restored    DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Unit restored',
    lost        DECIMAL(65, 0)      NOT NULL DEFAULT '0' COMMENT 'Unit lost',
    sort_order  BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unit pass-through sort order to maintain same output',
}
*/
