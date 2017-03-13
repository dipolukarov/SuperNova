/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.security_device;
CREATE TABLE sn.security_device (
    id          serial,
    cypher      CHAR(16) NOT NULL DEFAULT '',   -- COLLATE latin1_bin
    timestamp   timestamptz NOT NULL DEFAULT now(),
CONSTRAINT security_device_pkey PRIMARY KEY (id)
--  KEY `I_device_cypher` (`device_cypher`)
);
