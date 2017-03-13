/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.messages;
CREATE TABLE sn.messages (
    id      serial,
    owner   bigint NOT NULL,                    -- DEFAULT '0'
    sender  bigint NOT NULL,                    -- DEFAULT '0'
    time    timestamptz NOT NULL DEFAULT now(), -- INT(11) NOT NULL DEFAULT '0'
    body    jsonb NOT NULL,
CONSTRAINT messages_pkey PRIMARY KEY (id)
--  KEY `i_owner_time` (`message_owner`, `message_time`),
--  KEY `i_sender_time` (`message_sender`, `message_time`),
--  KEY `i_time` (`message_time`)
);
/*
{
    type    INT(11)    NOT NULL DEFAULT '0',
    from    VARCHAR(48)         DEFAULT NULL,
    subject VARCHAR(48)         DEFAULT NULL,
    text    TEXT,
}
*/
