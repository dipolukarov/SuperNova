/**
 * Table structure for sn_alliance_negotiation
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.alliance_negotiation;
CREATE TABLE sn.alliance_negotiation (
    id              serial,
    ally_id         bigint,
    contr_ally_id   bigint,
    time            timestamptz,    -- INT(11) NOT NULL DEFAULT '0'
    body            jsonb NOT NULL,
CONSTRAINT alliance_negotiation_pkey PRIMARY KEY (id),
--  KEY `alliance_negotiation_ally_id` (`alliance_negotiation_ally_id`, `alliance_negotiation_contr_ally_id`, `alliance_negotiation_time`),
--  KEY `alliance_negotiation_ally_id_2` (`alliance_negotiation_ally_id`, `alliance_negotiation_time`),
--  KEY `FK_negotiation_ally_name` (`alliance_negotiation_ally_name`),
--  KEY `FK_negotiation_contr_ally_id` (`alliance_negotiation_contr_ally_id`),
--  KEY `FK_negotiation_contr_ally_name` (`alliance_negotiation_contr_ally_name`),
CONSTRAINT alliance_negotiation_fkey_ally_id FOREIGN KEY (ally_id) REFERENCES sn.alliance (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT alliance_negotiation_fkey_contr_ally_id FOREIGN KEY (contr_ally_id) REFERENCES sn.alliance (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    "relation": "neutral",  -- SET ('neutral', 'war', 'peace', 'confederation', 'federation', 'union', 'master', 'slave') NOT NULL DEFAULT 'neutral'
    "response": null,       -- TEXT
    "propose": null,        -- TEXT
    "status": 0             -- TINYINT(1) NOT NULL DEFAULT '0'
}
*/
