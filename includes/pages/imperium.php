<?php

// TODO: Переделать под $template_result

/*
 * imperium.php
 *
 * Overview you empire
 *
 * @version 2.1 copyright (c) 2010-2012 by Gorlum for http://supernova.ws
 *
 */

$sn_mvc['view']['imperium'][] = 'sn_imperium_view';

function sn_imperium_view($template = null) {
  global $user, $lang;

  $planets = array();
  $ques = array();

  $sn_group_factories = sn_get_groups('factories');
  $planet_density = sn_get_groups('planet_density');

  if(sys_get_param('save_production')) {
    $production = sys_get_param('percent');
    if(is_array($production) && !empty($production)) {
      // sn_db_transaction_start();
      $query = array();
      $planet_row_list = DBStaticPlanet::db_planet_list_sorted($user, false, '*');
      // while($planet = db_fetch($planet_row_list))
      foreach($planet_row_list as $planet) {
        foreach($sn_group_factories as $factory_unit_id) {
          $unit_db_name_porcent = pname_factory_production_field_name($factory_unit_id);
          if(
            get_unit_param($factory_unit_id, P_MINING_IS_MANAGED)
            && isset($production[$factory_unit_id][$planet['id']])
            && ($actual_porcent = intval($production[$factory_unit_id][$planet['id']] / 10)) >= 0
            && $actual_porcent <= 10
            && $actual_porcent != $planet[$unit_db_name_porcent]
          ) {
            $query[$planet['id']][] = "{$unit_db_name_porcent} = {$actual_porcent}";
          }
        }
      }
      foreach($query as $planet_id => $query_data) {
        DBStaticPlanet::db_planet_set_by_id($planet_id, implode(',', $query_data));
      }
      // sn_db_transaction_commit();
    }
  }

  $planet_row_list = DBStaticPlanet::db_planet_list_sorted($user);
  // while ($planet = db_fetch($planet_row_list))
  foreach($planet_row_list as $planet) {
    sn_db_transaction_start();
    $global_data = sys_o_get_updated($user, $planet['id'], SN_TIME_NOW, false, true);
    $planets[$planet['id']] = $global_data['planet'];
    // $ques[$planet['id']] = que_get($user['id'], $planet['id'], false);
    $ques[$planet['id']] = $global_data['que'];
    sn_db_transaction_commit();
  }

  $template = gettemplate('imperium', $template);
  $template->assign_var('amount', count($planets) + 2);

  for($i = 100; $i >= 0; $i -= 10) {
    $template->assign_block_vars('percent', array('PERCENT' => $i));
  }

  $fleet_id = 1;
  $fleets = array();

  $total['temp_min'] = 1000;
  $total['temp_max'] = -999;

  foreach ($planets as $planet_index => &$planet) {
    $list_planet_que = $ques[$planet_index];
    $planet_template = tpl_parse_planet($planet);

    $planet_fleet_id = 0;
    $fleet_list = $planet_template['fleet_list'];//flt_get_fleets_to_planet($planet);
    if($fleet_list['own']['count'])
    {
      $planet_fleet_id = "p{$fleet_id}";
      $fleets[] = tpl_parse_fleet_sn($fleet_list['own']['total'], $planet_fleet_id);
      $fleet_id++;
    }

    $template->assign_block_vars('planet', array_merge($planet_template, array(
      'PLANET_FLEET_ID'   => $planet_fleet_id,

      'METAL_CUR'         => pretty_number($planet['metal'], true, $planet['caps']['total_storage'][RES_METAL]),
      'METAL_PROD'        => pretty_number($planet['caps']['total'][RES_METAL]),

      'CRYSTAL_CUR'       => pretty_number($planet['crystal'], true, $planet['caps']['total_storage'][RES_CRYSTAL]),
      'CRYSTAL_PROD'      => pretty_number($planet['caps']['total'][RES_CRYSTAL]),

      'DEUTERIUM_CUR'     => pretty_number($planet['deuterium'], true, $planet['caps']['total_storage'][RES_DEUTERIUM]),
      'DEUTERIUM_PROD'    => pretty_number($planet['caps']['total'][RES_DEUTERIUM]),

      'ENERGY_CUR'        => pretty_number($planet['caps'][RES_ENERGY][BUILD_CREATE] - $planet['caps'][RES_ENERGY][BUILD_DESTROY], true, true),
      'ENERGY_MAX'        => pretty_number($planet['caps'][RES_ENERGY][BUILD_CREATE]),

      'TEMP_MIN'          => $planet['temp_min'],
      'TEMP_MAX'          => $planet['temp_max'],

      'DENSITY_CLASS'     => $planet['density_index'],
      'DENSITY_RICHNESS'  => $planet_density[$planet['density_index']][UNIT_PLANET_DENSITY_RICHNESS],
      'DENSITY_CLASS_TEXT'=> $lang['uni_planet_density_types'][$planet['density_index']],
    )));

    $planet['fleet_list'] = $planet_template['fleet_list'];
    $planet['BUILDING_ID'] = $planet_template['BUILDING_ID'];
    $planet['hangar_que'] = $planet_template['hangar_que'];
    $planet['full_que'] = $list_planet_que;

    $total['fields'] += $planet['field_current'];
    $total['metal'] += $planet['metal'];
    $total['crystal'] += $planet['crystal'];
    $total['deuterium'] += $planet['deuterium'];
    $total['energy'] += $planet['energy_max'] - $planet['energy_used'];

    $total['fields_max'] += eco_planet_fields_max($planet);
    $total['metal_perhour'] += $planet['caps']['total'][RES_METAL];
    $total['crystal_perhour'] += $planet['caps']['total'][RES_CRYSTAL];
    $total['deuterium_perhour'] += $planet['caps']['total'][RES_DEUTERIUM];
    $total['energy_max'] += $planet['caps'][RES_ENERGY][BUILD_CREATE];

    $total['temp_min'] = min($planet['temp_min'], $total['temp_min']);
    $total['temp_max'] = max($planet['temp_max'], $total['temp_max']);
  }

  tpl_assign_fleet($template, $fleets);

  unset($planet);

  $show_groups = array(
    UNIT_STRUCTURES => 'structures',
    UNIT_STRUCTURES_SPECIAL => 'structures',
    UNIT_SHIPS => 'fleet',
    UNIT_DEFENCE => 'defense',
  );

  foreach($show_groups as $unit_group_id => $mode)
  {
    $template->assign_block_vars('prods', array(
      'NAME' => $lang['tech'][$unit_group_id],
    ));
    $unit_group = get_unit_param('techtree', $unit_group_id);
    foreach($unit_group as $unit_id)
    {
      $unit_count = $unit_count_abs = 0;
      $block_vars = array();
      $unit_is_factory = in_array($unit_id, $sn_group_factories) && get_unit_param($unit_id, P_MINING_IS_MANAGED);
      // $unit_db_name = pname_resource_name($unit_id);
      foreach($planets as $planet)
      {
        $unit_level_plain = mrc_get_level($user, $planet, $unit_id, false, true);

        $level_plus['FACTORY'] = $unit_is_factory;
        $level_plus['LEVEL_PLUS_YELLOW'] = 0;
        $level_plus['LEVEL_PLUS_GREEN'] = 0;

        $level_plus['PERCENT'] = $unit_is_factory ? ($unit_level_plain ? $planet[pname_factory_production_field_name($unit_id)] * 10 : -1) : -1;
        switch($mode)
        {
          /*
          case 'structures':
            $level_plus_build = $ques[$planet['id']]['in_que'][que_get_unit_que($unit_id)][$user['id']][$planet['id']][$unit_id];
            if($level_plus_build)
            {
              $level_plus['LEVEL_PLUS_GREEN'] = $level_plus_build < 0 ? $level_plus_build : "+{$level_plus_build}";
              $total['units'][$unit_id]['LEVEL_PLUS_GREEN'] += $level_plus['LEVEL_PLUS_GREEN'];
            }
          break;
          */

          /** @noinspection PhpMissingBreakStatementInspection */
          case 'fleet':
            $level_plus['LEVEL_PLUS_YELLOW'] = $planet['fleet_list']['own']['total'][$unit_id]<=0 ? $planet['fleet_list']['own']['total'][$unit_id] : "+{$planet['fleet_list']['own']['total'][$unit_id]}";
            $total['units'][$unit_id]['LEVEL_PLUS_YELLOW'] += $level_plus['LEVEL_PLUS_YELLOW'];

          case 'structures':
          case 'defense':
            $level_plus_build = $ques[$planet['id']]['in_que'][que_get_unit_que($unit_id)][$user['id']][$planet['id']][$unit_id];
            if($level_plus_build)
            {
              $level_plus['LEVEL_PLUS_GREEN'] = $level_plus_build < 0 ? $level_plus_build : "+{$level_plus_build}";
              // $level_plus['LEVEL_PLUS_GREEN'] = "+{$level_plus_build}";
              $total['units'][$unit_id]['LEVEL_PLUS_GREEN'] += $level_plus['LEVEL_PLUS_GREEN'];
            }
          break;

          default:
          break;
        }

        $block_vars[] = array_merge($level_plus, array(
          'ID'         => $planet['id'],
          'TYPE'       => $planet['planet_type'],
          'LEVEL'      => $unit_level_plain == 0 && !$level_plus['LEVEL_PLUS_YELLOW'] && !$level_plus['LEVEL_PLUS_GREEN'] ? '-' : $unit_level_plain,
        ));
        $unit_count += $unit_level_plain;
        $unit_count_abs += $unit_level_plain + abs($level_plus['LEVEL_PLUS_YELLOW']) + abs($level_plus['LEVEL_PLUS_GREEN']);
      }

      if($unit_count_abs)
      {
        $template->assign_block_vars('prods', array(
          'ID'    => $unit_id,
          'FIELD' => 'unit_' . $unit_id, // pname_resource_name($unit_id), // TODO Делать это прямо в темплейте
          'NAME'  => $lang['tech'][$unit_id],
          'MODE'  => $mode,
        ));

        foreach($block_vars as $block_var)
        {
          $template->assign_block_vars('prods.planet', $block_var);
        }
        $unit_green = $total['units'][$unit_id]['LEVEL_PLUS_GREEN'];
        $unit_yellow = $total['units'][$unit_id]['LEVEL_PLUS_YELLOW'];
        $template->assign_block_vars('prods.planet', array(
          'ID' => 0,
          'LEVEL' => $unit_count,
          'LEVEL_PLUS_GREEN' => $unit_green == 0 ? '' : ($unit_green > 0 ? "+{$unit_green}" : $unit_green),
          'LEVEL_PLUS_YELLOW' => $unit_yellow == 0 ? '' : ($unit_yellow > 0 ? "+{$unit_yellow}" : $unit_yellow),
          'PERCENT' => $unit_is_factory ? '' : -1,
          'FACTORY' => $unit_is_factory,
        ));
      }
    }
  }

  $template->assign_block_vars('planet', array_merge(array(
    'ID'         => 0,
    'NAME'       => $lang['sys_total'],

    'FIELDS_CUR' => $total['fields'],
    'FIELDS_MAX' => $total['fields_max'],

    'METAL_CUR'  => pretty_number($total['metal']),
    'METAL_PROD' => pretty_number($total['metal_perhour']),

    'CRYSTAL_CUR'  => pretty_number($total['crystal']),
    'CRYSTAL_PROD' => pretty_number($total['crystal_perhour']),

    'DEUTERIUM_CUR'  => pretty_number($total['deuterium']),
    'DEUTERIUM_PROD' => pretty_number($total['deuterium_perhour']),

    'ENERGY_CUR' => pretty_number($total['energy']),
    'ENERGY_MAX' => pretty_number($total['energy_max']),

    'TEMP_MIN' => $total['temp_min'],
    'TEMP_MAX' => $total['temp_max'],
  )));


  $template->assign_vars(array(
    'COLONIES_CURRENT' => get_player_current_colonies($user),
    'COLONIES_MAX' => get_player_max_colonies($user),

    'EXPEDITIONS_CURRENT' => fleet_count_flying($user['id'], MT_EXPLORE),
    'EXPEDITIONS_MAX' => get_player_max_expeditons($user),

    'PLANET_DENSITY_RICHNESS_NORMAL' => PLANET_DENSITY_RICHNESS_NORMAL,
    'PLANET_DENSITY_RICHNESS_AVERAGE' => PLANET_DENSITY_RICHNESS_AVERAGE,
    'PLANET_DENSITY_RICHNESS_GOOD' => PLANET_DENSITY_RICHNESS_GOOD,
    'PLANET_DENSITY_RICHNESS_PERFECT' => PLANET_DENSITY_RICHNESS_PERFECT,
  ));
  //$template->assign_recursive($template_result);

  return $template;
}
