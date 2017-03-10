<?php

require_once('includes/includes/coe_simulator_helpers.php');

/**
 * MissionCaseSpy.php
 *
 * V2 optimizations; correctly works mission
 * @version 1
 * @copyright 2008
 */
// ----------------------------------------------------------------------------------------------------------------
function coe_compress_add_units($unit_group, $target_planet, &$compress_data, $target_user = array())
{
  foreach($unit_group as $unit_id)
  {
    if(($unit_count = mrc_get_level($target_user, $target_planet, $unit_id, false, true)) > 0)
    {
      $compress_data[$unit_id] = $unit_count;
    }

    /*
    $unit_count = $target_planet[get_unit_param($unit_id, P_NAME)];
    if($unit_count > 0)
    {
      $compress_data[$unit_id] = $unit_count;
    }
    */
  }
}

function flt_spy_scan($target_planet, $group_name, $section_title, $target_user = array())
{
  global $lang;

  $result = "<tr><td class=\"c\" colspan=\"4\">{$section_title}</td></tr>";
  foreach(sn_get_groups($group_name) as $unit_id)
  {
    if(($unit_amount = mrc_get_level($target_user, $target_planet, $unit_id, false, true)) > 0)
    {
      $result .= "<tr><td align=\"left\" colspan=\"3\">{$lang['tech'][$unit_id]}</td><td align=\"right\">{$unit_amount}</td></tr>";
    }

    /*
    $unit_db_name = get_unit_param($unit_id, P_NAME);
    if($target_planet[$unit_db_name] > 0)
    {
      $result .= "<tr><td align=left colspan = 3>{$lang['tech'][$unit_id]}</td><td align=right>{$target_planet[$unit_db_name]}</td></tr>";
    }
    */
  }

  return $result;
}

function flt_mission_spy(&$mission_data)
{
  global $lang;

  $fleet_row         = &$mission_data['fleet'];
  $target_user_row   = &$mission_data['dst_user'];
  $target_planet_row = &$mission_data['dst_planet'];
  $spying_user_row   = &$mission_data['src_user'];
  $spying_planet_row = &$mission_data['src_planet'];

  if(!isset($target_user_row['id']) || !isset($target_planet_row['id']) || !isset($spying_user_row['id']))
  {
//    doquery("UPDATE {{fleets}} SET `fleet_mess` = 1 WHERE `fleet_id` = {$fleet_row['fleet_id']} LIMIT 1;");
    fleet_send_back($fleet_row);
    return;
  }

  $fleet_array = sys_unit_str2arr($fleet_row['fleet_array']);
  if($fleet_array[SHIP_SPY] > 0)
  {
    $TargetSpyLvl      = GetSpyLevel($target_user_row);
    $CurrentSpyLvl     = GetSpyLevel($spying_user_row);
    $spy_diff_empire = $CurrentSpyLvl - $TargetSpyLvl;

    $spy_probes = $fleet_array[SHIP_SPY];
    $spy_diff   = $spy_diff_empire + sqrt($spy_probes) - 1 ;

    $combat_pack[0] = array(
      RES_METAL => $target_planet_row['metal'],
      RES_CRYSTAL => $target_planet_row['crystal'],
      RES_DEUTERIUM => $target_planet_row['deuterium']
    );

    $spy_message  = "<table width=\"440\" cellspacing = \"1\"><tr><td class=\"c\" colspan=\"4\">{$lang['sys_spy_maretials']} {$target_planet_row['name']} ";
    $spy_message .= uni_render_coordinates_href($target_planet_row, '', 3);
    $spy_message .= " ({$lang['Player_']} '{$target_user_row['username']}') {$lang['On_']} ";
    $spy_message .= date(FMT_DATE_TIME, $fleet_row['fleet_end_time']);
    $spy_message .= "</td></tr><tr>";
    $spy_message .= "<td width=220>{$lang['sys_metal']}</td><td width=220 align=right>" . pretty_number($target_planet_row['metal']) . "</td>";
    $spy_message .= "<td width=220>{$lang['sys_crystal']}</td></td><td width=220 align=right>" . pretty_number($target_planet_row['crystal']) . "</td>";
    $spy_message .= "</tr><tr>";
    $spy_message .= "<td width=220>{$lang['sys_deuterium']}</td><td width=220 align=right>" . pretty_number($target_planet_row['deuterium'])  . "</td>";
    $spy_message .= "<td width=220>{$lang['sys_energy']}</td><td width=220 align=right>" . pretty_number($target_planet_row['energy_max']) . "</td>";
    $spy_message .= "</tr>";
    if ($spy_diff >= 2)
    {
      $spy_message .= "<div class='spy_medium'>" . flt_spy_scan($target_planet_row, 'fleet', $lang['tech'][UNIT_SHIPS], $target_user_row) . "</div>";
      coe_compress_add_units(sn_get_groups('fleet'), $target_planet_row, $combat_pack[0]);
    }
    if ($spy_diff >= 3) {
      $spy_message .= "<div class='spy_medium'>" . flt_spy_scan($target_planet_row, 'defense', $lang['tech'][UNIT_DEFENCE], $target_user_row) . "</div>";
      coe_compress_add_units(sn_get_groups('defense_active'), $target_planet_row, $combat_pack[0]);
    }
    if ($spy_diff >= 5)
    {
      $spy_message .= "<div class='spy_long'>" . flt_spy_scan($target_planet_row, 'structures', $lang['tech'][UNIT_STRUCTURES], $target_user_row) . "</div>";
    }

    if($spy_diff_empire >= 0)
    {
      $spy_message .= "<div class='spy_long'>" . flt_spy_scan($target_planet_row, 'tech', $lang['tech'][UNIT_TECHNOLOGIES], $target_user_row) . "</div>";
      coe_compress_add_units(array(TECH_WEAPON, TECH_SHIELD, TECH_ARMOR), $target_planet_row, $combat_pack[0], $target_user_row);
    }
    // TODO: Наемники, губернаторы, артефакты и прочее имперское

    $simulator_link = sn_ube_simulator_encode_replay($combat_pack, 'D');

    $target_unit_list = 0;
    foreach(sn_get_groups('fleet') as $unit_id)
    {
      $target_unit_list += max(0, mrc_get_level($target_user_row, $target_planet_row, $unit_id, false, true));
    }

    $spy_detected = $spy_probes * $target_unit_list / 4 * pow(2, $TargetSpyLvl - $CurrentSpyLvl);

    if(mt_rand(0, 99) > $spy_detected)
    {
      $spy_outcome_str = sprintf($lang['sys_mess_spy_detect_chance'], $spy_detected);
      $spy_detected = false;
    }
    else
    {
      $spy_outcome_str = $lang['sys_mess_spy_destroyed'];
      $spy_detected = true;
    }

    $spy_message .= "<tr><th class=\"c_c\" colspan=4>";
    $spy_message .= "{$spy_outcome_str}<br />";
    $spy_message .= "<a href=\"fleet.php?target_mission=1&planet_type={$fleet_row['fleet_end_type']}&galaxy={$fleet_row['fleet_end_galaxy']}&system={$fleet_row['fleet_end_system']}&planet={$fleet_row['fleet_end_planet']} \">{$lang['type_mission'][1]}</a><br />";
    $spy_message .= "<a href=\"simulator.php?replay={$simulator_link}\">{$lang['COE_combatSimulator']}</a><br />";
    $spy_message .= "</th></tr></table>";
    // End of link generation

    msg_send_simple_message($spying_user_row['id'], '', $fleet_row['fleet_start_time'], MSG_TYPE_SPY, $lang['sys_mess_qg'], $lang['sys_mess_spy_report'], $spy_message);

    $target_message  = "{$lang['sys_mess_spy_ennemyfleet']} {$spying_planet_row['name']} " . uni_render_coordinates_href($spying_planet_row, '', 3);
    $target_message .= " {$lang['sys_mess_spy_seen_at']} {$target_planet_row['name']} " . uni_render_coordinates($target_planet_row);

    $target_user_id = $fleet_row['fleet_target_owner'];

    if($spy_detected)
    {
//      doquery("DELETE FROM {{fleets}} WHERE `fleet_id` = '{$fleet_row['fleet_id']}' LIMIT 1;");
      db_fleet_delete($fleet_row['fleet_id']);

      $debris_planet_id = $target_planet_row['planet_type'] == PT_PLANET ? $target_planet_row['id'] : $target_planet_row['parent_planet'];

      $spy_cost = get_unit_param(SHIP_SPY, P_COST);

      DBStaticPlanet::db_planet_set_by_id($debris_planet_id,
        "`debris_metal` = `debris_metal` + ". floor($spy_probes * $spy_cost[RES_METAL] * 0.3) .", `debris_crystal` = `debris_crystal` + ". floor($spy_probes * $spy_cost[RES_CRYSTAL] * 0.3));

      $target_message .= "<br />{$lang['sys_mess_spy_destroyed_enemy']}";

      $result = CACHE_FLEET | CACHE_PLANET_DST;
    }
    else
    {
      $result = CACHE_FLEET;
    }
    msg_send_simple_message($target_user_id, '', $fleet_row['fleet_start_time'], MSG_TYPE_SPY, $lang['sys_mess_spy_control'], $lang['sys_mess_spy_activity'], $target_message);
  }

  if(!$spy_detected)
  {
//    doquery("UPDATE {{fleets}} SET `fleet_mess` = '1' WHERE `fleet_id` = '{$fleet_row['fleet_id']}' LIMIT 1;");
    fleet_send_back($fleet_row);
  }

  return $result;
}
