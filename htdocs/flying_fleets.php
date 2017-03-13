<?php

include('common.' . substr(strrchr(__FILE__, '.'), 1));

if(!empty($_POST['return']) && is_array($_POST['return'])) {
  foreach($_POST['return'] as $fleet_id) {
    if($fleet_id = idval($fleet_id)) {
      sn_db_transaction_start();
//      $FleetRow = doquery("SELECT * FROM {{fleets}} WHERE `fleet_id` = '{$fleet_id}' LIMIT 1 FOR UPDATE;", true);
      $FleetRow = db_fleet_get($fleet_id);

      if ($FleetRow['fleet_owner'] == $user['id'] && $FleetRow['fleet_mess'] == 0) {
//        $ReturnFlyingTime = ($FleetRow['fleet_end_stay'] != 0 && $FleetRow['fleet_start_time'] < SN_TIME_NOW ? $FleetRow['fleet_start_time'] : SN_TIME_NOW) - $FleetRow['start_time'] + SN_TIME_NOW + 1;
//        doquery("UPDATE {{fleets}} SET `fleet_start_time` = " . SN_TIME_NOW . ", `fleet_group` = 0, `fleet_end_stay` = '0', `fleet_end_time` = '{$ReturnFlyingTime}', `fleet_target_owner` = '{$user['id']}', `fleet_mess` = '1' WHERE `fleet_id` = '{$fleet_id}' LIMIT 1;");

//        if($FleetRow['fleet_group']) {
//          // TODO: Make here to delete only one AKS - by adding aks_fleet_count to AKS table
//          doquery('DELETE FROM {{aks}} WHERE `id` NOT IN (SELECT DISTINCT `fleet_group` FROM {{fleets}});');
//        }
        fleet_return_forced($FleetRow, $user);
      } elseif ($FleetRow['fleet_id'] && $FleetRow['fleet_owner'] != $user['id']) {
        $debug->warning('Trying to return fleet that not belong to user', 'Hack attempt', 302, array('base_dump' => true, 'fleet_row' => $FleetRow));
        sn_db_transaction_rollback();
        die('Hack attempt 302');
      }
      sn_db_transaction_commit();
    }
  }
}

lng_include('overview');
lng_include('fleet');

if(!$planetrow) {
  message($lang['fl_noplanetrow'], $lang['fl_error']);
}

$template = gettemplate('flying_fleets', true);

$i = 0;
//$fleet_query = doquery("SELECT * FROM {{fleets}} WHERE fleet_owner={$user['id']};");
//while ($fleet_row = db_fetch($fleet_query)) {
//  $i++;
//  $fleet_data = tpl_parse_fleet_db($fleet_row, $i, $user);
//
//  $template->assign_block_vars('fleets', $fleet_data['fleet']);
//
//  foreach($fleet_data['ships'] as $ship_data) {
//    $template->assign_block_vars('fleets.ships', $ship_data);
//  }
//}

$fleet_list = fleet_list_by_owner_id($user['id']);
foreach($fleet_list as $fleet_id => $fleet_row) {
  $i++;
  $fleet_data = tpl_parse_fleet_db($fleet_row, $i, $user);

  $template->assign_block_vars('fleets', $fleet_data['fleet']);

  foreach($fleet_data['ships'] as $ship_data) {
    $template->assign_block_vars('fleets.ships', $ship_data);
  }
}

$MaxExpeditions = get_player_max_expeditons($user);
$FlyingExpeditions = fleet_count_flying($user['id'], MT_EXPLORE);
//if($MaxExpeditions) {
//  $FlyingExpeditions  = doquery("SELECT COUNT(fleet_owner) AS `expedi` FROM {{fleets}} WHERE `fleet_owner` = {$user['id']} AND `fleet_mission` = '" . MT_EXPLORE . "';", '', true);
//  $FlyingExpeditions  = $FlyingExpeditions['expedi'];
//} else {
//  $FlyingExpeditions = 0;
//};

//$fleet_flying_amount = doquery("SELECT COUNT(fleet_id) AS `flying_fleets` FROM {{fleets}} WHERE `fleet_owner`='{$user['id']}';", '', true);
//$fleet_flying_amount = $fleet_flying_amount['flying_fleets'];
$fleet_flying_amount = fleet_count_flying($user['id'], MT_EXPLORE);

$template->assign_vars(array(
  'FLEETS_FLYING'      => $fleet_flying_amount,
  'FLEETS_MAX'         => GetMaxFleets($user),
  'EXPEDITIONS_FLYING' => $FlyingExpeditions,
  'EXPEDITIONS_MAX'    => $MaxExpeditions,
));

display($template, $lang['fl_title']);
