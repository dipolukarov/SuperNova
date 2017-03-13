/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.quest;
CREATE TABLE sn.quest (
    id      serial,
    name    text,
    type    int,
    "order" int NOT NULL DEFAULT 0,
    body    jsonb,
CONSTRAINT quest_pkey PRIMARY KEY (id)
--  KEY `quest_type` (`quest_type`, `quest_order`)
);
/*
{
        description text,
    conditions  text,
    rewards     text,

}
*/
