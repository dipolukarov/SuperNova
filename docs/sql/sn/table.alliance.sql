/**
 * Table structure for sn_alliance
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.alliance;
CREATE TABLE sn.alliance (
    id              serial,
    name            varchar(32) NOT NULL DEFAULT '',
    tag             varchar(8)  NOT NULL DEFAULT '',
    owner           bigint,
    user_id         bigint,
    register_time   timestamptz NOT NULL DEFAULT now(),
    body            jsonb       NOT NULL,
CONSTRAINT alliance_pkey PRIMARY KEY (id),
CONSTRAINT alliance_uniq_name UNIQUE (name),
CONSTRAINT alliance_uniq_tag UNIQUE (tag),
CONSTRAINT alliance_fkey_owner FOREIGN KEY (owner) REFERENCES sn.users (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
CONSTRAINT alliance_fkey_user_id FOREIGN KEY (user_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    "description": "TEXT",
    "web": "VARCHAR(255)",
    "text": "TEXT",
    "image": false, TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
    "request": "TEXT",
    "request_waiting": "TEXT",
    "request_notallow": false, TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
    "owner_range": "VARCHAR(32)",
    "ranks": "TEXT",
    "members": 0, INT(11) NOT NULL DEFAULT '0'
    "ranklist": "TEXT",
    "total_rank": 0, INT(10) UNSIGNED NOT NULL DEFAULT '0'
    "total_points": 0, BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'
}
*/
ALTER TABLE sn.users ADD CONSTRAINT users_fkey_ally_id FOREIGN KEY (ally_id) REFERENCES sn.alliance (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
ALTER TABLE sn.users ADD CONSTRAINT users_fkey_user_as_ally FOREIGN KEY (user_as_ally) REFERENCES sn.alliance (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
