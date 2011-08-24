<?php
/*
#############################################################################
#  Filename: admin.mo
#  Create date: Wednesday, April 02, 2008	 19:18:25
#  Project: prethOgame
#  Description: RPG web based game
#
#  Copyright c 2008 Aleksandar Spasojevic <spalekg@gmail.com>
#  Copyright c 2005 - 2008 KGsystem
#  Copyright (c) 2009 Gorlum
#############################################################################
*/

if(!defined('INSIDE'))
{
  die('Hack attempt!');
}

$lang = array_merge($lang, array(
  'adm_err_denied' => 'Access denied',
  'adm_done' => 'Successfully Completed',
  'adm_inactive_removed' => '<li>Remove inactive players: %d</li>',
  'adm_stat_title' => 'Update statistics',
  'adm_maintenance_title' => 'Database Services',
  'adm_records' => 'Processed records',
  'adm_cleaner_title' => 'Clean queue structures',
  'adm_cleaned' => 'Number of deleted tasks: ',
  'adm_schedule_none' => 'There are no tasks in the schedule for now',
  'Fix' => 'Updated',
  'Welcome_to_Fix_section' => 'Section Patches',
  'There_is_not_need_fix' => 'Fix unnecessary!',
  'Fix_welldone' => 'Done!',
  'adm_ov_title' => 'Overview',
  'adm_ov_infos' => 'Information',
  'adm_ov_yourv' => 'The current version',
  'adm_ov_lastv' => 'Available version',
  'adm_ov_here' => 'Here',
  'adm_ov_onlin' => 'Online',
  'adm_ov_ally' => 'Alliance',
  'adm_ov_point' => 'Point',
  'adm_ov_activ' => 'Active',
  'adm_ov_count' => 'Online players',
  'adm_ov_wrtpm' => 'Write Private Message',
  'adm_ov_altpm' => '[PM]',
  'adm_ul_title' => 'Players list',
  'adm_ul_ttle2' => 'Players listed',
  'adm_ul_id' => 'ID',
  'adm_ul_name' => 'Player name',
  'adm_ul_mail' => 'E-mail',
  'adm_ul_adip' => 'IP',
  'adm_ul_regd' => 'Registred from',
  'adm_ul_lconn' => 'Last login',
  'adm_ul_bana' => 'Ban',
  'adm_ul_detai' => 'Details',
  'adm_ul_actio' => 'Actions',
  'adm_ul_playe' => ' Players',
  'adm_ul_yes' => 'Yes',
  'adm_ul_no' => 'No',
  'adm_pl_title' => 'Active planet',
  'adm_pl_activ' => 'Active planet',
  'adm_pl_name' => 'Planet name',
  'adm_pl_posit' => 'Coordinates',
  'adm_pl_point' => 'Value',
  'adm_pl_since' => 'Is Active',
  'adm_pl_they' => 'Total',
  'adm_pl_apla' => 'Planet(s)',
  'adm_am_plid' => 'Planet ID',
  'adm_am_done' => 'Add was successful',
  'adm_am_ttle' => 'Add resources',
  'adm_am_add' => 'Confirm',
  'adm_am_form' => 'One-step add link form resources',
  'adm_ban_title' => 'Banned Players',
  'adm_bn_plto' => 'Banned Players',
  'adm_bn_name' => 'Player name',
  'adm_bn_reas' => 'Reason for ban',
  'adm_bn_isvc' => 'Vacation mode',
  'adm_bn_time' => 'Duration of Ban',
  'adm_bn_days' => 'Days',
  'adm_bn_hour' => 'Hours',
  'adm_bn_mins' => 'Mins',
  'adm_bn_secs' => 'Seconds',
  'adm_bn_bnbt' => 'The ban',
  'adm_bn_thpl' => 'Player',
  'adm_bn_isbn' => 'Successfully Banned!',
  'adm_bn_vctn' => ' Vacation mode.',
  'adm_bn_errr' => 'Error: Banning player! perhaps Name %s not found.',
  'adm_bn_err2' => 'Error: Unable to stop production on the planets!',
  'adm_bn_plnt' => 'Production on the planets is disabled.',
  'adm_unbn_ttle' => 'Unban',
  'adm_unbn_plto' => 'Unban player',
  'adm_unbn_name' => 'Name',
  'adm_unbn_bnbt' => 'Unban',
  'adm_unbn_thpl' => 'Player',
  'adm_unbn_isbn' => 'Unbanned!',
  'adm_rz_ttle' => 'Zeroing Universe',
  'adm_rz_done' => 'User(s) of transfer(s)',
  'adm_rz_conf' => 'Confirmation',
  'adm_rz_text' => 'Clicking (reset) You delete all database. You did backup??? Accounts will not be removed...',
  'adm_rz_doit' => 'Zero out',
  'adm_ch_ttle' => 'Admin chat',
  'adm_ch_list' => 'Message list',
  'adm_ch_clear' => 'Clear',
  'adm_ch_idmsg' => 'ID',
  'adm_ch_delet' => 'Delete',
  'adm_ch_play' => 'Player',
  'adm_ch_time' => 'Date',
  'adm_ch_chat' => 'Chat',
  'adm_ch_nbs' => 'Total messages...',
  'adm_er_ttle' => 'Errors',
  'adm_er_list' => 'Error list',
  'adm_er_clear' => 'Clear',
  'adm_er_idmsg' => 'ID',
  'adm_er_type' => 'Type',
  'adm_er_play' => 'Player Id',
  'adm_er_time' => 'Date',
  'adm_er_page' => 'Address of the page',
  'adm_er_nbs' => 'Total Errors...',
  'adm_er_text' => 'Error text',
  'adm_er_bktr' => 'Debugging information',
  'adm_dm_title' => 'Change the number of dark matter',
  'adm_dm_planet' => 'ID, Coordinates or name of the planet',
  'adm_dm_oruser' => 'Or',
  'adm_dm_user' => 'ID or username',
  'adm_dm_no_quant' => 'Specify the number Dark Matter(positive-Negative-for charging, removal)',
  'adm_dm_no_dest' => 'Specify the user or planet to edit Dark Matter',
  'adm_dm_add_err' => 'It look like during charging Dark Matter Occured.',
  'adm_dm_user_none' => 'Error: could not find user with ID or name %s',
  'adm_dm_user_added' => 'Number of Dark Matter user: [%s] (ID: %d) has been successfully changed to %d Dark Matter.',
  'adm_dm_user_conflict' => 'Error locating user: looks like the Database is the user and with the same name, and with the same ID',
  'adm_dm_planet_none' => 'Error locating planet: Planet ID is not found, coordinates or name %s',
  'adm_dm_planet_added' => 'The user ID number DM %1$d (owner of planet %4$s %2$s ID %3$d) successfully renamed to %5$d DM.',
  'adm_dm_planet_conflict' => 'Non-unique data to search for the planet.<br>This means that the Database at the same time there is a ',
  'adm_dm_planet_conflict_id' => 'Planet named "%1$s" and the planet with ID %1$s .<br>try using the coordinates of the planet.',
  'adm_dm_planet_conflict_name' => 'Multiple planets named "%1$s".<br>try using coordinates or ID planet.',
  'adm_dm_planet_conflict_coords' => 'Planet named "%1$s" and the planet coordinates %1$s.<br>try using the ID of the planet.',
  'adm_apply' => 'Apply',
  'adm_maint' => 'Servicing',
  'adm_backup' => 'Backup',
  'adm_tools' => 'Utilities',
  'adm_tools_reloadConfig' => 'Recalculate configuration',
  'adm_reason' => 'The reason for',
  'adm_opt_title' => 'Configuration of the universe',
  'adm_opt_game_settings' => 'Universe Parameters',
  'adm_opt_game_name' => 'Universe name',
  'adm_opt_speed' => 'Speed',
  'adm_opt_game_gspeed' => 'Games',
  'adm_opt_game_fspeed' => 'Fleet',
  'adm_opt_game_pspeed' => 'Resource',
  'adm_opt_main_not_counted' => '(Apart from home planet)',
  'adm_opt_game_speed_normal' => '(1&nbsp;-&nbsp;normal)',
  'adm_opt_game_faq' => 'Link to FAQ',
  'adm_opt_game_forum' => 'Forum address',
  'adm_opt_game_dark_matter' => 'Reference &quot;Harvest Dark Matter&quot;',
  'adm_opt_game_copyrigh' => 'Copyright',
  'adm_opt_game_online' => 'Turn off the game. Users will see the following message:',
  'adm_opt_game_offreaso' => 'Turn off reason',
  'adm_opt_plan_settings' => 'Planet settings',
  'adm_opt_plan_initial' => 'Size of main planet',
  'adm_opt_plan_base_inc' => 'Basic production',
  'adm_opt_game_debugmod' => 'Enable debug mode',
  'adm_opt_game_counter' => 'Add game counter',
  'adm_opt_game_oth_info' => 'Other options',
  'adm_opt_int_news_count' => 'News count',
  'adm_opt_int_page_imperor' => 'On the page &quot;Emperor&quot;:',
  'adm_opt_game_zero_dsiable' => '(0&nbsp;-&nbsp;Disable)',
  'adm_opt_game_advertise' => 'Ad units',
  'adm_opt_game_oth_adds' => 'Enable the ad block in the left menu. Banner code:',
  'adm_opt_game_oth_gala' => 'Galaxy',
  'adm_opt_game_oth_syst' => 'System',
  'adm_opt_game_oth_plan' => 'Planet',
  'adm_opt_btn_save' => 'Save',
  'adm_opt_vacation_mode' => 'Turn off vacation',
  'adm_opt_sectors' => 'Fields',
  'adm_opt_per_hour' => 'per hour',
  'adm_opt_saved' => 'Game settings saved successfully',
  'adm_opt_players_online' => 'Players on the server',
  'adm_opt_vacation_mode_is' => 'Vacation mode',
  'adm_opt_maintenance' => 'Maintenance and debugging',
  'adm_opt_links' => 'Links and banners',
  'adm_opt_universe_size' => 'Universe size',
  'adm_opt_galaxies' => 'Galaxies',
  'adm_opt_systems' => 'Systems',
  'adm_opt_planets' => 'Planets',
  'adm_opt_build_on_research' => 'Build on research',
  'adm_opt_game_rules' => 'Game rules',
  'adm_opt_max_colonies' => 'Number of colonies',
  'adm_opt_exchange' => 'Exchange resources',
  'adm_opt_game_mode' => 'Type of universe',
  'adm_opt_chat' => 'Chat settings',
  'adm_opt_chat_timeout' => 'Timeout for idle',
  'adm_opt_allow_buffing' => 'Allow buffing',
  'adm_opt_ally_help_weak' => 'Allow HOLD on weak co-ally',
  'adm_opt_email_pm' => 'Enables sending PM to e-mail',
  'adm_opt_game_defaults' => 'Configuring default Game setting',
  'adm_opt_game_default_language' => 'Default language',
  'adm_opt_game_default_skin' => 'Skin',
  'adm_opt_game_default_template' => 'Template',
  'adm_lm_compensate' => 'Compensation',
  'adm_pl_comp_title' => 'Compensation for destroyed planet',
  'adm_pl_comp_src' => 'Destroy the planet',
  'adm_pl_comp_dst' => 'Credit resources on the planet',
  'adm_pl_comp_bonus' => 'Bonus player',
  'adm_pl_comp_check' => 'Check',
  'adm_pl_comp_confirm' => 'Confirm',
  'adm_pl_comp_done' => 'Finish',
  'adm_pl_comp_price' => 'Cost structures',
  'adm_pl_comp_got' => 'Be enrolled',
  'adm_pl_com_of_plr' => 'Player',
  'adm_pl_comp_will_be' => 'will be',
  'adm_pl_comp_destr' => 'destroyed.',
  'adm_pl_comp_recieve' => 'The specified number of resources',
  'adm_pl_comp_recieve2' => 'enrolled on the planet',
  'adm_pl_comp_err_0' => 'Not found to be destroyed planet',
  'adm_pl_comp_err_1' => 'Planet destroyed',
  'adm_pl_comp_err_2' => 'Not found, the planet you want to enroll',
  'adm_pl_comp_err_3' => 'From the planets different owners. Credit resources can only be the same player on the planet',
  'adm_pl_comp_err_4' => 'Planet belongs to the specified player',
  'adm_pl_comp_err_5' => 'Planet for -- and for credit resources match',
  'adm_ver_versions' => 'Version of server components',
  'adm_ver_version_sn' => 'Version',
  'adm_ver_version_db' => 'Database version',
  'adm_update_force' => 'Force Update',
  'adm_update_repeat' => 'Repeat last system update',
  'adm_lm_planet_edit' => 'Edit planet',
  'adm_planet_edit' => 'Edit planet',
  'adm_planet_id' => 'Planet ID',
  'adm_name' => 'Name',
  'adm_on_planet' => 'On planet',
  'adm_planet_change' => 'Change',
  'adm_planet_parent' => 'Parent Planet',
  'adm_planet_active' => 'Active Planets',
  'adm_planet_edit_hint' => '<ul>    <li>Entering planet ID and pressing "Confirm" on empty page will print info about planet: type, name, coordinates and current amount of units/resources of    selected type</li>    <li>To remove units/resources from planet enter negative value</li>  </ul>',
  'adm_planet_list_title' => 'Planet List',
  'adm_sys_owner' => 'Owner',
  'adm_sys_owner_id' => 'Onwer ID',
  'addm_title' => 'Add Moon',
  'addm_addform' => 'Form new moon',
  'addm_playerid' => 'ID world accommodation',
  'addm_moonname' => 'The name of the Moon',
  'addm_moongala' => 'Specify the Galaxy',
  'addm_moonsyst' => 'Specify system',
  'addm_moonplan' => 'Specify position',
  'addm_moondoit' => 'Add',
  'addm_done' => 'The Moon formed',
  'adm_usr_level' => array(
    '0' => 'Player',
    '1' => 'Operator',
    '2' => 'Moderator',
    '3' => 'Administrator',
  ),

  'adm_usr_genre' => array(
    'M' => 'Male',
    'F' => 'Female',
  ),

  'panel_mainttl' => 'Admin Panel',
  'adm_panel_mnu' => 'Search player',
  'adm_panel_ttl' => 'Type of search',
  'adm_search_pl' => 'Search by name',
  'adm_search_ip' => 'Search by IP',
  'adm_stat_play' => 'Player statistics',
  'adm_mod_level' => 'Access level',
  'adm_player_nm' => 'Player name',
  'adm_ip' => 'IP',
  'adm_plyer_wip' => 'Players with IP',
  'adm_frm1_id' => 'ID',
  'adm_frm1_name' => 'Name',
  'adm_frm1_ip' => 'IP',
  'adm_frm1_mail' => 'E-Mail',
  'adm_frm1_acc' => 'Rank',
  'adm_frm1_gen' => 'Gender',
  'adm_frm1_main' => 'Planet ID',
  'adm_frm1_gpos' => 'Coordinates',
  'adm_mess_lvl1' => 'Access level',
  'adm_mess_lvl2' => '&quot;now&quot; ',
  'adm_colony' => 'Colony',
  'adm_planet' => 'Planet',
  'adm_moon' => 'Moon',
  'adm_technos' => 'Technology',
  'adm_bt_search' => 'Search',
  'adm_bt_change' => 'Change',
  'flt_id' => 'ID',
  'flt_fleet' => 'Fleet',
  'flt_mission' => 'Mission',
  'flt_owner' => 'Owner',
  'flt_planet' => 'Planet',
  'flt_time_st' => 'Departure time',
  'flt_e_owner' => 'Arrival',
  'flt_time_en' => 'Time of arrival',
  'flt_staying' => 'Stat.',
  'flt_action' => 'Action',
  'flt_title' => 'Fleets in flight',
  'adm_md5' => 'MD5-hash',
  'md5_title' => 'Encryption utility',
  'md5_pswcyp' => 'Password encryption',
  'md5_psw' => 'Password',
  'md5_pswenc' => 'Encrypted password',
  'md5_doit' => '[ encrypt ]',
  'mlst_title' => 'Message list',
  'mlst_mess_del' => 'Delete messages',
  'mlst_hdr_page' => 'Page.',
  'mlst_hdr_title' => ' ) Messages:',
  'mlst_hdr_prev' => '[ &lt;- ]',
  'mlst_hdr_next' => '[ -&gt; ]',
  'mlst_hdr_id' => 'ID',
  'mlst_hdr_type' => 'Type',
  'mlst_hdr_time' => 'Here',
  'mlst_hdr_from' => 'From',
  'mlst_hdr_to' => 'To',
  'mlst_hdr_text' => 'Text',
  'mlst_hdr_action' => 'Action.',
  'mlst_del_mess' => 'Delete',
  'mlst_bt_delsel' => 'Delete selected',
  'mlst_bt_deldate' => 'Delete message date',
  'mlst_hdr_delfrom' => 'Remove the date',
  'mlst_mess_typ__0' => 'Spy',
  'mlst_mess_typ__1' => 'Players',
  'mlst_mess_typ__2' => 'Alliances',
  'mlst_mess_typ__3' => 'Fights',
  'mlst_mess_typ__4' => 'Operational.',
  'mlst_mess_typ__5' => 'Transport',
  'mlst_mess_typ_15' => 'Expedition',
  'mlst_mess_typ_99' => 'Building List',
  'adm_lng_title' => 'Localization',
  'adm_lng_warning' => 'WARNING! Locale editor is in pre-alpha stage! Use it on your own risk!',
  'adm_lng_domain' => 'Domain',
  'adm_lng_string_name' => 'String name',
  'adm_lng_string_add' => 'Add string',
));

?>
