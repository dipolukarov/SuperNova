<?php
if(!defined('INSIDE')){ die('attemp hacking'); }

$json = file_get_contents('settings.json', true);
$settings = json_decode($swp);

$dbsettings = $settings->db;

$game['prefix'] = $dbsettings->schema;
