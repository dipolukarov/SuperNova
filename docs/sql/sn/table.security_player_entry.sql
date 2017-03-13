/**
 * Author:  neo
 * Created: 13.03.2017
 */

DROP TABLE IF EXISTS sn.security_player_entry;
CREATE TABLE sn.security_player_entry (
    player_id   bigint,
    device_id   bigint,
    browser_id  bigint,
    user_ip     inet,
    user_proxy  text NOT NULL DEFAULT '',   -- VARCHAR(255) COLLATE latin1_bin  NOT NULL DEFAULT ''
    first_visit timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT security_player_entry_pkey PRIMARY KEY (player_id, device_id, browser_id, user_ip, user_proxy),
--  KEY `I_player_entry_device_id` (`device_id`) USING BTREE,
--  KEY `I_player_entry_browser_id` (`browser_id`),
CONSTRAINT security_player_entry_fkey_device_id FOREIGN KEY (device_id) REFERENCES sn.security_device (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT security_player_entry_fkey_browser_id FOREIGN KEY (browser_id) REFERENCES sn.security_browser (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT security_player_entry_fkey_player_id FOREIGN KEY (player_id) REFERENCES sn.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
