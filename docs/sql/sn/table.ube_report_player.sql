/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.ube_report_player;
CREATE TABLE sn.ube_report_player (
    id              serial,             -- COMMENT 'Record ID'
    ube_report_id   bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Report ID'
    player_id       bigint NOT NULL,    -- DEFAULT '0' COMMENT 'Player ID'
    body            jsonb NOT NULL,
CONSTRAINT ube_report_player_pkey PRIMARY KEY (id),
--  KEY `I_ube_report_player_player_id` (`ube_report_player_player_id`),
--  KEY `FK_ube_report_player_ube_report` (`ube_report_id`),
CONSTRAINT ube_report_player_fkey_ube_report FOREIGN KEY (ube_report_id) REFERENCES sn.ube_report (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    name            VARCHAR(64)         NOT NULL DEFAULT '' COMMENT 'Player name',
    attacker        TINYINT(1)          NOT NULL DEFAULT '0' COMMENT 'Is player an attacker?',
    bonus_attack    DECIMAL(11, 2)      NOT NULL DEFAULT '0.00' COMMENT 'Player attack bonus',
    bonus_shield    DECIMAL(11, 2)      NOT NULL DEFAULT '0.00' COMMENT 'Player shield bonus',
    bonus_armor     DECIMAL(11, 2)      NOT NULL DEFAULT '0.00' COMMENT 'Player armor bonus',
}
*/
