/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.survey;
CREATE TABLE sn.survey (
    id          serial,
    announce_id bigint,
    question    text NOT NULL,
    until       timestamptz,
CONSTRAINT survey_pkey PRIMARY KEY (id),
--  KEY `I_survey_announce_id` (`survey_announce_id`) USING BTREE,
CONSTRAINT survey_fkey_announce_id FOREIGN KEY (announce_id) REFERENCES sn.announce (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
