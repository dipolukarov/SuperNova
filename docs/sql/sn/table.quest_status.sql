/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.quest_status;
CREATE TABLE sn.quest_status (
    id          serial,
    quest_id    bigint,
    user_id     bigint NOT NULL,
    progress    text NOT NULL DEFAULT '',
    status      int NOT NULL DEFAULT 1,
CONSTRAINT quest_status_pkey PRIMARY KEY (id),
--  KEY `quest_status_user_id` (`quest_status_user_id`, `quest_status_quest_id`, `quest_status_status`),
--  KEY `FK_quest_status_quest_id` (`quest_status_quest_id`),
CONSTRAINT quest_status_fkey_quest_id FOREIGN KEY (quest_id) REFERENCES sn.quest (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT quest_status_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
