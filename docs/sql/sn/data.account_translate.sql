/**
 * Author:  neo
 * Created: 13.03.2017
 */

INSERT INTO sn.account_translate (provider_id,provider_account_id,user_id) VALUES (
1,
1,
(SELECT id FROM sn.users WHERE username = 'admin' LIMIT 1)
);
