/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.security_url;
CREATE TABLE sn.security_url (
    id      serial,
    string  text NOT NULL DEFAULT '',
CONSTRAINT security_url_pkey PRIMARY KEY (id),
CONSTRAINT security_url_uniq UNIQUE (string)
);
