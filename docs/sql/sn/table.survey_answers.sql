/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.survey_answers;
CREATE TABLE sn.survey_answers (
    id                  serial,
    survey_parent_id    bigint,
    text                text,
CONSTRAINT survey_answers_pkey PRIMARY KEY (id),
--  KEY `I_survey_answers_survey_parent_id` (`survey_parent_id`) USING BTREE,
CONSTRAINT survey_answers_fkey_survey_parent_id FOREIGN KEY (survey_parent_id) REFERENCES sn.survey (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
