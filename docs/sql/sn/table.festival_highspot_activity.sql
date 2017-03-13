/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.festival_highspot_activity;
CREATE TABLE sn.festival_highspot_activity (
    id          serial,
    highspot_id bigint,
    start       timestamptz NOT NULL,   -- DATETIME NOT NULL COMMENT 'Запланированное время запуска'
    finish      timestamptz,            -- DATETIME DEFAULT NULL COMMENT 'Реальное время запуска'
    body        jsonb NOT NULL,
CONSTRAINT festival_highspot_activity_pkey PRIMARY KEY (id),
--  KEY `I_festival_activity_order` (`start`, `finish`, `id`) USING BTREE,
--  KEY `I_festival_activity_highspot_id` (`highspot_id`, `start`, `finish`, `id`) USING BTREE,
CONSTRAINT festival_highspot_activity_fkey_highspot_id FOREIGN KEY (highspot_id) REFERENCES sn.festival_highspot (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
/*
{
    `class`       SMALLINT(5) UNSIGNED         NOT NULL DEFAULT '0' COMMENT 'Класс события - ID модуля события'
    `type`        TINYINT(1) UNSIGNED          NOT NULL DEFAULT '0' COMMENT 'Тип активити: 1 - триггер, 2 - хук'
    `params`      TEXT COLLATE utf8_unicode_ci NOT NULL COMMENT 'Параметры активити в виде сериализованного архива'
}
*/
