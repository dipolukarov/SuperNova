/**
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.counter;
CREATE TABLE sn.counter (
    id              serial,
    visit_time      timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id         bigint,
    device_id       bigint,
    browser_id      bigint,
    user_ip         inet,
    user_proxy      text NOT NULL DEFAULT '', -- CHARACTER SET latin1 COLLATE latin1_bin  NOT NULL DEFAULT ''
    page_url_id     bigint,
    plain_url_id    bigint,
CONSTRAINT counter_pkey PRIMARY KEY (id),
--  KEY `i_user_id` (`user_id`),
--  KEY `I_counter_device_id` (`device_id`) USING BTREE,
--  KEY `I_counter_browser_id` (`browser_id`),
--  KEY `I_counter_page_url_id` (`page_url_id`),
--  KEY `I_counter_plain_url_id` (`plain_url_id`),
CONSTRAINT counter_fkey_browser_id FOREIGN KEY (browser_id) REFERENCES sn.security_browser (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT counter_fkey_device_id FOREIGN KEY (device_id) REFERENCES sn.security_device (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT counter_fkey_page_url_id FOREIGN KEY (page_url_id) REFERENCES sn.security_url (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT counter_fkey_plain_url_id FOREIGN KEY (plain_url_id) REFERENCES sn.security_url (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
