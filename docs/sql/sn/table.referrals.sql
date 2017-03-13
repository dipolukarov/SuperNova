/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.referrals;
CREATE TABLE sn.referrals (
    id          bigint NOT NULL,
    id_partner  bigint,
    dark_matter numeric(65, 0) NOT NULL DEFAULT 0,
CONSTRAINT referrals_pkey PRIMARY KEY (id),
--  KEY `id_partner` (`id_partner`),
CONSTRAINT referrals_fkey_id FOREIGN KEY (id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT referrals_fkey_id_partner FOREIGN KEY (id_partner) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
