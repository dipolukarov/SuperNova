/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.lng_usage_stat;
CREATE TABLE sn.lng_usage_stat (
    lang_code   CHAR(2) NOT NULL,       -- COLLATE utf8_unicode_ci NOT NULL
    string_id   VARCHAR(128) NOT NULL,  -- COLLATE utf8_unicode_ci NOT NULL
    file        VARCHAR(128) NOT NULL,  -- COLLATE utf8_unicode_ci NOT NULL
    line        int NOT NULL,           -- SMALLINT(6) NOT NULL
    is_empty    boolean NOT NULL,       -- TINYINT(1) NOT NULL
    locale      text,                   -- MEDIUMTEXT COLLATE utf8_unicode_ci
CONSTRAINT lng_usage_stat_pkey PRIMARY KEY (lang_code, string_id, file, line, is_empty)
);
