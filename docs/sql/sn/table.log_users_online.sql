/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.log_users_online;
CREATE TABLE sn.log_users_online (
    timestamp   timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP, -- COMMENT 'Measure time'
    count       int NOT NULL DEFAULT 0,                         -- COMMENT 'Users online'
    aggregated  boolean NOT NULL DEFAULT FALSE,                 -- TINYINT(1) UNSIGNED  NOT NULL DEFAULT '0'
CONSTRAINT log_users_online_pkey PRIMARY KEY (timestamp, aggregated)
);
