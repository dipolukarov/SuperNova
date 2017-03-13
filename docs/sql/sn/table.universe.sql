/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.universe;
CREATE TABLE sn.universe (
    galaxy  int NOT NULL DEFAULT 0,
    system  int NOT NULL DEFAULT 0,
    body    jsonb NOT NULL,
CONSTRAINT universe_pkey PRIMARY KEY (galaxy, system)
);
/*
    name    varchar(32) NOT NULL DEFAULT '',
    price   bigint NOT NULL DEFAULT 0,
*/
