/**
 * Table structure for sn_alliance_diplomacy
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.alliance_diplomacy;
CREATE TABLE sn.alliance_diplomacy (
    id              serial,
    ally_id         bigint,
    contr_ally_id   bigint,
    time            timestamptz,    -- INT(11) NOT NULL DEFAULT '0'
    body            jsonb NOT NULL,
CONSTRAINT alliance_diplomacy_pkey PRIMARY KEY (id),
--  KEY `alliance_diplomacy_ally_id` (`alliance_diplomacy_ally_id`, `alliance_diplomacy_contr_ally_id`, `alliance_diplomacy_time`),
--  KEY `alliance_diplomacy_ally_id_2` (`alliance_diplomacy_ally_id`, `alliance_diplomacy_time`),
--  KEY `FK_diplomacy_contr_ally_id` (`alliance_diplomacy_contr_ally_id`),
--  KEY `FK_diplomacy_contr_ally_name` (`alliance_diplomacy_contr_ally_name`),
CONSTRAINT alliance_diplomacy_fkey_ally_id FOREIGN KEY (ally_id) REFERENCES sn.alliance (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT alliance_diplomacy_fkey_contr_ally_id FOREIGN KEY (contr_ally_id) REFERENCES sn.alliance (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    "relation": "neutral",      -- SET ('neutral', 'war', 'peace', 'confederation', 'federation', 'union', 'master', 'slave') NOT NULL DEFAULT 'neutral'
    "relation_last": "neutral", -- SET ('neutral', 'war', 'peace', 'confederation', 'federation', 'union', 'master', 'slave') NOT NULL DEFAULT 'neutral'
}
*/
