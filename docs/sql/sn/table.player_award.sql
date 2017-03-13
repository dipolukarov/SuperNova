/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.player_award;
CREATE TABLE sn.player_award (
    id          serial,
    player_id   bigint,
    body        jsonb NOT NULL,
CONSTRAINT player_award_pkey PRIMARY KEY (id),
--  KEY `I_award_player` (`player_id`, `award_type_id`),
CONSTRAINT player_award_fkey_user_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    award_type_id    INT(11)                      DEFAULT NULL COMMENT 'Award type i.e. order, medal, pennant, rank etc',
    award_id         INT(11)                      DEFAULT NULL COMMENT 'Global award unit ID',
    award_variant_id INT(11)                      DEFAULT NULL COMMENT 'Multiply award subtype i.e. for same reward awarded early',
    awarded          TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When was awarded',
    active_from      DATETIME                     DEFAULT NULL,
    active_to        DATETIME                     DEFAULT NULL,
    hide             TINYINT(1)          NOT NULL DEFAULT '0',
}
*/
