/**
 * Table structure for sn_aks
 *
 * Author:  neo
 * Created: 10.03.2017
 */

DROP TABLE IF EXISTS sn.aks;
CREATE TABLE sn.aks (
    id              serial,

    fleet_end_time  timestamptz, -- INT(11) NOT NULL DEFAULT '0'

    body            jsonb NOT NULL,
CONSTRAINT aks_pkey PRIMARY KEY (id)
);
/*
{
    "name": null,       -- VARCHAR(50) DEFAULT NULL
    "teilnehmer": "",   -- TEXT
    "flotten": "",      -- TEXT
    "ankunft: null,     -- INT(32) DEFAULT NULL
    "galaxy": null,     -- INT(2) DEFAULT NULL
    "system": null,     -- INT(4) DEFAULT NULL
    "planet": null,     -- INT(2) DEFAULT NULL
    "planet_type": 0,   -- TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
    "eingeladen": null, -- VARCHAR(50) DEFAULT NULL
}
*/
