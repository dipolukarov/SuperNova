/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.survey_votes;
CREATE TABLE sn.survey_votes (
    id                      serial,
    survey_parent_id        bigint,
    survey_parent_answer_id bigint,
    user_id                 bigint,
CONSTRAINT survey_votes_pkey PRIMARY KEY (id),
--  KEY `I_survey_votes_survey_parent_id` (`survey_parent_id`) USING BTREE,
--  KEY `I_survey_votes_survey_parent_answer_id` (`survey_parent_answer_id`) USING BTREE,
--  KEY `I_survey_votes_user_id` (`survey_vote_user_id`),
CONSTRAINT survey_votes_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
CONSTRAINT survey_votes_fkey_survey_parent_answer_id FOREIGN KEY (survey_parent_answer_id) REFERENCES sn.survey_answers (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT survey_votes_fkey_survey_parent_id FOREIGN KEY (survey_parent_id) REFERENCES sn.survey (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
