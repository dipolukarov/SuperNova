/**
 * Author:  neo
 * Created: 13.03.2017
 */

INSERT INTO sn.planets (id_owner,last_update,body) VALUES (
(SELECT id FROM sn.users WHERE username = 'admin' LIMIT 1),
now(),
'{"name":"Planet","id_level": 0,"galaxy": 1,"system": 1,"planet": 1, "planet": 1,"planet_type": 1}'
);
