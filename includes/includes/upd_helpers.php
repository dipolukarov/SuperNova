<?php

if(!defined('IN_UPDATE')) {
  die('Trying to call update helpers externally!');
}

function upd_do_query($query, $no_log = false) {
  global $update_tables;

  upd_add_more_time();
  if(!$no_log) {
    upd_log_message("Performing query '{$query}'");
  }

  // classSupernova::$db->sn_db_connect();
  if(!(strpos($query, '{{') === false)) {
    foreach($update_tables as $tableName => $cork) {
      $query = str_replace("{{{$tableName}}}", classSupernova::$db->db_prefix . $tableName, $query);
    }
  }
  $result = classSupernova::$db->db_sql_query($query) or die('Query error for ' . $query . ': ' . db_error());
  return $result;
}

function upd_check_key($key, $default_value, $condition = false) {
  global $config, $sys_log_disabled;

  $config->db_loadItem($key);
  if($condition || !isset($config->$key)) {
    upd_add_more_time();
    if(!$sys_log_disabled) {
      upd_log_message("Updating config key '{$key}' with value '{$default_value}'");
    }
    $config->db_saveItem($key, $default_value);
  } else {
    $config->db_saveItem($key);
  }
}

function upd_log_version_update() {
  global $new_version;

  doquery('START TRANSACTION;');
  upd_add_more_time();
  upd_log_message("Detected outdated version {$new_version}. Upgrading...");
}

function upd_add_more_time($time = 0) {
  global $config, $sys_log_disabled;

  $time = $time ? $time : ($config->upd_lock_time ? $config->upd_lock_time : 30);
  !$sys_log_disabled ? $config->db_saveItem('var_db_update_end', SN_TIME_NOW + $time) : false;
  set_time_limit($time);
}

function upd_log_message($message) {
  global $sys_log_disabled, $upd_log, $debug;

  if($sys_log_disabled)
  {
//    print("{$message}<br />");
  } else {
    $upd_log .= "{$message}\r\n";
    $debug->warning($message, 'Database Update', 103);
  }
}

function upd_unset_table_info($table_name) {
  global $update_tables, $update_indexes, $update_foreigns;

  if(isset($update_tables[$table_name])) {
    unset($update_tables[$table_name]);
  }

  if(isset($update_indexes[$table_name])) {
    unset($update_indexes[$table_name]);
  }

  if(isset($update_foreigns[$table_name])) {
    unset($update_foreigns[$table_name]);
  }
}

function upd_load_table_info($prefix_table_name, $prefixed = true) {
  global $config, $update_tables, $update_indexes, $update_indexes_full, $update_foreigns;

  $tableName = $prefixed ? str_replace($config->db_prefix, '', $prefix_table_name) : $prefix_table_name;
  $prefix_table_name = $prefixed ? $prefix_table_name : $config->db_prefix . $prefix_table_name;

  upd_unset_table_info($tableName);

  $q1 = upd_do_query("SHOW FULL COLUMNS FROM {$prefix_table_name};", true);
  while($r1 = db_fetch($q1)) {
    $update_tables[$tableName][$r1['Field']] = $r1;
  }

  $q1 = upd_do_query("SHOW INDEX FROM {$prefix_table_name};", true);
  while($r1 = db_fetch($q1)) {
    $update_indexes[$tableName][$r1['Key_name']] .= "{$r1['Column_name']},";
    $update_indexes_full[$tableName][$r1['Key_name']][$r1['Column_name']] = $r1;
  }

  $q1 = upd_do_query("SELECT * FROM `information_schema`.`KEY_COLUMN_USAGE` WHERE `TABLE_SCHEMA` = '" . db_escape(classSupernova::$db_name). "' AND TABLE_NAME = '{$prefix_table_name}' AND REFERENCED_TABLE_NAME is not null;", true);
  while($r1 = db_fetch($q1)) {
    $table_referenced = str_replace($config->db_prefix, '', $r1['REFERENCED_TABLE_NAME']);

    $update_foreigns[$tableName][$r1['CONSTRAINT_NAME']] .= "{$r1['COLUMN_NAME']},{$table_referenced},{$r1['REFERENCED_COLUMN_NAME']};";
  }
}

function upd_alter_table($table, $alters, $condition = true) {
  global $config, $update_tables;

  if(!$condition) {
    return;
  }

  upd_add_more_time();
  $alters_print = is_array($alters) ? dump($alters) : $alters;
  upd_log_message("Altering table '{$table}' with alterations {$alters_print}");

  if(!is_array($alters)) {
    $alters = array($alters);
  }

  $alters = implode(',', $alters);
  // foreach($alters as $table_name => )
  $qry = "ALTER TABLE {$config->db_prefix}{$table} {$alters};";

  //$result = db_query($qry);
  $result = upd_do_query($qry);
  $error = db_error();
  if($error) {
    die("Altering error for table `{$table}`: {$error}<br />{$alters_print}");
  }

//  if(strpos('RENAME TO', strtoupper(implode(',', $alters))) === false)
  {
    upd_load_table_info($table, false);
  }

  return $result;
}

function upd_drop_table($table_name) {
  global $config;

  classSupernova::$db->db_sql_query("DROP TABLE IF EXISTS {$config->db_prefix}{$table_name};");

  upd_unset_table_info($table_name);
}

function upd_create_table($table_name, $declaration) {
  global $config, $update_tables;

  if(!$update_tables[$table_name]) {
    upd_do_query('set foreign_key_checks = 0;', true);
    $result = upd_do_query("CREATE TABLE IF NOT EXISTS `{$config->db_prefix}{$table_name}` {$declaration}");
    $error = db_error();
    if($error) {
      die("Creating error for table `{$table_name}`: {$error}<br />" . dump($declaration));
    }
    upd_do_query('set foreign_key_checks = 1;', true);
    upd_load_table_info($table_name, false);
    sys_refresh_tablelist();
  }

  return $result;
}

function upd_db_unit_by_location($user_id = 0, $location_type, $location_id, $unit_snid = 0, $for_update = false, $fields = '*') {
  return db_fetch(upd_do_query(
    "SELECT {$fields}
    FROM {{unit}}
    WHERE
      `unit_location_type` = {$location_type} AND `unit_location_id` = {$location_id} AND " . DBStaticUnit::db_unit_time_restrictions() .
    ($user_id = intval($user_id) ? " AND `unit_player_id` = {$user_id}" : '') .
    ($unit_snid = intval($unit_snid) ? " AND `unit_snid` = {$unit_snid}" : '') .
    " LIMIT 1" .
    ($for_update ? ' FOR UPDATE' : '')
  ));
}


function upd_db_unit_changeset_prepare($unit_id, $unit_value, $user, $planet_id = null) {
  if(!is_array($user)) {
    // TODO - remove later
    print('<h1>СООБЩИТЕ ЭТО АДМИНУ: sn_db_unit_changeset_prepare() - USER is not ARRAY</h1>');
    pdump(debug_backtrace());
    die('USER is not ARRAY');
  }

  if(!isset($user['id']) || !$user['id']) {
    // TODO - remove later
    print('<h1>СООБЩИТЕ ЭТО АДМИНУ: sn_db_unit_changeset_prepare() - USER[id] пустой</h1>');
    pdump($user);
    pdump(debug_backtrace());
    die('USER[id] пустой');
  }
  $planet_id = is_array($planet_id) && isset($planet_id['id']) ? $planet_id['id'] : $planet_id;

  $unit_location = get_unit_param($unit_id, 'location'); // sys_get_unit_location($user, array(), $unit_id);
  $location_id = $unit_location == LOC_USER ? $user['id'] : $planet_id;
  $location_id = $location_id ? $location_id : 'NULL';

  $db_changeset = array();
  $temp = upd_db_unit_by_location($user['id'], $unit_location, $location_id, $unit_id, true, 'unit_id');
  if($temp['unit_id']) {
    // update
    $db_changeset = array(
      'action' => SQL_OP_UPDATE,
      'where' => array(
        "`unit_id` = {$temp['unit_id']}",
      ),
      'fields' => array(
        'unit_level' => array(
          'delta' => $unit_value
        ),
      ),
    );
  } else {
    // insert
    $db_changeset = array(
      'action' => SQL_OP_INSERT,
      'fields' => array(
        'unit_player_id' => array(
          'set' => $user['id'],
        ),
        'unit_location_type' => array(
          'set' => $unit_location,
        ),
        'unit_location_id' => array(
          'set' => $unit_location == LOC_USER ? $user['id'] : $planet_id,
        ),
        'unit_type' => array(
          'set' => get_unit_param($unit_id, P_UNIT_TYPE),
        ),
        'unit_snid' => array(
          'set' => $unit_id,
        ),
        'unit_level' => array(
          'set' => $unit_value,
        ),
      ),
    );
  }

  return $db_changeset;
}



function upd_db_changeset_apply($db_changeset) {
  if(!is_array($db_changeset) || empty($db_changeset)) {
    return;
  }

  foreach($db_changeset as $table_name => $table_data) {
    foreach($table_data as $record_id => $conditions) {
      $where = '';
      if(!empty($conditions['where'])) {
        $where = 'WHERE ' . implode(' AND ', $conditions['where']);
      }

      $fields = array();
      if($conditions['fields']) {
        foreach($conditions['fields'] as $field_name => $field_data) {
          $condition = "`{$field_name}` = ";
          $value = '';
          if($field_data['delta']) {
            $value = "`{$field_name}`" . ($field_data['delta'] >= 0 ? '+' : '') . $field_data['delta'];
          } elseif($field_data['set']) {
            $value = (is_string($field_data['set']) ? "'{$field_data['set']}'": $field_data['set']);
          }
          if($value) {
            $fields[] = $condition . $value;
          }
        }
      }
      $fields = implode(',', $fields);

      switch($conditions['action']) {
        case SQL_OP_DELETE:
          upd_do_query("DELETE FROM {{{$table_name}}} {$where}");
          break;

        case SQL_OP_UPDATE:
          if($fields) {
            upd_do_query("UPDATE {{{$table_name}}} SET {$fields} {$where}");
          }
          break;

        case SQL_OP_INSERT:
          if($fields) {
            upd_do_query("INSERT INTO {{{$table_name}}} SET {$fields}");
          }
          break;

        case SQL_OP_REPLACE:
          if($fields) {
            upd_do_query("REPLACE INTO {{{$table_name}}} SET {$fields}");
          }
          break;

      }
    }
  }
}
