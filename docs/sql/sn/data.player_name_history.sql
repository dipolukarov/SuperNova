/**
 * Author:  neo
 * Created: 13.03.2017
 */

INSERT INTO sn.player_name_history (player_id,player_name) VALUES (
(SELECT id FROM sn.users WHERE username = 'admin' LIMIT 1),
'admin'
);
