/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.buddy;
CREATE TABLE sn.buddy (
    id        serial,   -- COMMENT 'Buddy table row ID'
    sender_id bigint,   -- COMMENT 'Buddy request sender ID'
    owner_id  bigint,   -- COMMENT 'Buddy request recipient ID'
    body      jsonb NOT NULL,
CONSTRAINT buddy_pkey PRIMARY KEY (id),
--  KEY `I_BUDDY_SENDER_ID` (`BUDDY_SENDER_ID`, `BUDDY_OWNER_ID`),
--  KEY `I_BUDDY_OWNER_ID` (`BUDDY_OWNER_ID`, `BUDDY_SENDER_ID`),
CONSTRAINT buddy_fkey_owner_id FOREIGN KEY (owner_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT buddy_fkey_sender_id FOREIGN KEY (sender_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    BUDDY_STATUS`    TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Buddy request status',
    BUDDY_REQUEST`   TINYTEXT COMMENT 'Buddy request text',
}
*/
