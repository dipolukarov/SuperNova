/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.alliance_requests;
CREATE TABLE sn.alliance_requests (
    id_user         bigint NOT NULL,
    id_ally         bigint NOT NULL,
    request_time    timestamptz, -- INT(11) NOT NULL DEFAULT '0'
    body            jsonb NOT NULL,
CONSTRAINT alliance_requests_pkey PRIMARY KEY (id_user, id_ally),
--  KEY `I_alliance_requests_id_ally` (`id_ally`, `id_user`),
CONSTRAINT alliance_requests_fkey_ally_id FOREIGN KEY (id_ally) REFERENCES sn.alliance (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT alliance_requests_fkey_user_id FOREIGN KEY (id_user) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    "request_text": null,       -- TEXT
    "request_denied": false,    -- TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
}
*/
