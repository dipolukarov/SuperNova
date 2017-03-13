/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.chat;
CREATE TABLE sn.chat (
    id              serial,
    sender_id       bigint,                             -- COMMENT 'Message sender ID'
    recipient_id    bigint,                             -- BIGINT(20) UNSIGNED DEFAULT NULL COMMENT 'Message recipient ID'
    timestamp       timestamptz NOT NULL DEFAULT now(), -- INT(11) NOT NULL DEFAULT '0'
    ally_id         bigint,                             -- INT(11) NOT NULL DEFAULT '0'
    body            jsonb NOT NULL,
CONSTRAINT chat_pkey PRIMARY KEY (id),
--  KEY `i_ally_idmess` (`ally_id`, `messageid`),
--  KEY `I_chat_message_sender_id` (`chat_message_sender_id`),
--  KEY `I_chat_message_recipient_id` (`chat_message_recipient_id`),
CONSTRAINT chat_fkey_recipient_id FOREIGN KEY (recipient_id) REFERENCES sn.users (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
CONSTRAINT chat_fkey_sender_id FOREIGN KEY (sender_id) REFERENCES sn.users (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);
/*
{
    `chat_message_sender_name`    VARCHAR(64)                  DEFAULT '' COMMENT 'Message sender name',
    `user`                        TEXT COMMENT 'Chat message user name',
    `chat_message_recipient_name` VARCHAR(64)                  DEFAULT '' COMMENT 'Message sender name',
    `message`                     TEXT,
}
*/
