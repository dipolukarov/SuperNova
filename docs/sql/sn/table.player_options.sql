/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.player_options;
CREATE TABLE sn.player_options (
    player_id   bigint NOT NULL,
    option_id   bigint NOT NULL,
    value       text NOT NULL DEFAULT '',
CONSTRAINT player_options_pkey PRIMARY KEY (player_id, option_id),
CONSTRAINT player_options_fkey_user_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
