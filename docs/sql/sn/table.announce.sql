/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.announce;
CREATE TABLE sn.announce (
    id          serial,
    tsTimeStamp timestamptz NOT NULL DEFAULT now(), -- COMMENT 'Date & Time of announce'
    user_id     bigint NOT NULL,                    -- COMMENT 'Announcer user ID'
    body        jsonb NOT NULL,
CONSTRAINT announce_pkey PRIMARY KEY (id)
--  KEY `indTimeStamp` (`tsTimeStamp`)
);
/*
{
    strAnnounce TEXT,
    detail_url  VARCHAR(250)        NOT NULL DEFAULT '' COMMENT 'Link to more details about update',
}
*/
