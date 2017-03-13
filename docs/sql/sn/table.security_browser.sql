/**
 * Table structure for sn_security_browser
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.security_browser;
CREATE TABLE sn.security_browser (
    id          serial,
    user_agent  text        NOT NULL DEFAULT '',
    timestamp   timestamptz NOT NULL DEFAULT now(),
CONSTRAINT security_browser_pkey PRIMARY KEY (id)
);
