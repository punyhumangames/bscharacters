//====================================================
//
//	Vanguard Animations
//
//====================================================


//	The name of the mdl we're going to export to
$modelname player/anim_vanguard.mdl

//	Import all the bones we need to refer to
$include "../../berimbau_sharedbones.qci"

//	Import ik rules and linking
$include "../../../Female/animation/ruleshierarchy.qci"

// shared ik setup
$include "../../../fstandardikchains.qci"

//	Import body yaw pitch blenders
$include "../../../body_poses_lean.qci"

//	Import the shared weight lists
$include "../../../shared_weightlists.qci"
$include "../../../attack_weightlists.qci"

//	Import shared macros
$include "../../../shared_macros.qci"



$pushd "../shared"
	$animation a_RunS_IK RunS startloop 0 LX LY rotateto -180 cmdlist ikrules_run
	$animation a_RunSE_IK RunSE startloop 0 LX LY rotateto -135 cmdlist ikrules_run
	$animation a_RunE_IK RunE startloop 0 LX LY rotateto -90 cmdlist ikrules_run
	$animation a_RunNE_IK RunNE startloop 0 LX LY rotateto -45 cmdlist ikrules_run
	$animation a_RunN_IK RunN startloop 0 LX LY rotateto 0 cmdlist ikrules_run
	$animation a_RunNW_IK RunNW startloop 0 LX LY rotateto 45 cmdlist ikrules_run
	$animation a_RunW_IK RunW startloop 0 LX LY rotateto 90 cmdlist ikrules_run
	$animation a_RunSW_IK RunSW startloop 0 LX LY rotateto 135 cmdlist ikrules_run
	$animation a_RunZero_IK "anim_run_zero_full" cmdlist ikrules_run_idle
$popd


$sequence reference idle_reference

//====================================================
//
//  Vanguard HEAVY STANCE IDLE + RUN
//
//====================================================

  // PLACEHOLDER REPLACE ME
  $sequence h_idle "anim_h_idle"{
    ACT_BB_H_IDLE 1
    fps 24
    //alignto reference
    loop
    //cmdlist lockfeet
  }


  // PLACEHOLDER REPLACE ME
  $animation h_run_uppeh_run anim_h_run_upper weightlist UpperBodyRun alignto reference
  $animation h_run_upper_idle anim_h_run_upper_idle alignto h_run_uppeh_run weightlist UpperBodyRun

  // PLACEHOLDER REPLACE ME
  $sequence h_run_upper {
    h_run_uppeh_run h_run_uppeh_run h_run_uppeh_run
    h_run_uppeh_run h_run_upper_idle h_run_uppeh_run
    h_run_uppeh_run h_run_uppeh_run h_run_uppeh_run
    blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
    weightlist UpperBodyRun
    x
    iklock lfoot 1 0 iklock rfoot 1 0
  }

  // PLACEHOLDER REPLACE ME
  $sequence h_run {
    a_RunNW_IK a_RunN_IK a_RunNE_IK
    a_RunW_IK a_RunZero_IK a_RunE_IK
    a_RunSW_IK a_RunS_IK a_RunSE_IK
    blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
    addlayer h_run_upper
    ACT_BB_H_RUN 1
    { event AE_BB_FOOTSTEP_SPLASH 6 "0" }
    { event AE_BB_FOOTSTEP_SPLASH 15  "1" }
  }

  $cmdlist heavy_attack_settings {
    walkframe 5   LX LY
    walkframe 10  LX LY
    walkframe 15  LX LY
    walkframe 20  LX LY
    walkframe 25  LX LY
    walkframe 30  LX LY
    walkframe 35  LX LY
    walkframe 40  LX LY
    walkframe 41  LX LY
    numframes 41
  }

  $animation h_f_r_t1_zero "anim_h_f_r_t1_zero" {
    //cmdlist heavy_attack_settings
    frames 0 41
  }

  $animation h_f_r_t1_north "anim_h_f_r_t1_north" {
    cmdlist heavy_attack_settings
    frames 0 41
  }

  $animation h_f_r_t1_east "anim_h_f_r_t1_east" {
    cmdlist heavy_attack_settings
    frames 0 41
  }

  $sequence h_f_r_t1 {
    h_f_r_t1_north   h_f_r_t1_north   h_f_r_t1_north
    h_f_r_t1_zero   h_f_r_t1_zero    h_f_r_t1_east
    h_f_r_t1_zero   h_f_r_t1_zero    h_f_r_t1_zero
    blendwidth 3 blend move_y -1 1 blend move_x 1 -1
    ACT_BB_H_F_R_T1 1
    { event AE_BB_FOOTSTEP_SPLASH 6 "0" }
    { event AE_BB_FOOTSTEP_SPLASH 15  "1" }
    frames 0 41
    numframes 41
  }

  $sequence h_f_l_t1_upper "anim_h_f_l_t1_north" {
    weightlist UpperbodyReplace
    x y z
  }

  $sequence h_f_l_t1 {
    h_f_r_t1_north   h_f_r_t1_north   h_f_r_t1_north
    h_f_r_t1_zero   h_f_r_t1_zero    h_f_r_t1_east
    h_f_r_t1_zero   h_f_r_t1_zero    h_f_r_t1_zero
    blendwidth 3 blend move_y -1 1 blend move_x 1 -1
    ACT_BB_H_F_L_T1 1
    { event AE_BB_FOOTSTEP_SPLASH 6 "0" }
    { event AE_BB_FOOTSTEP_SPLASH 15  "1" }
    frames 0 41
    cmdlist heavy_attack_settings
    addlayer h_f_l_t1_upper
  }

  $sequence h_r_t1_upper "anim_h_r_t1_east" {
    weightlist UpperbodyReplace
    x y z
  }

  $sequence h_r_t1 {
    h_f_r_t1_north   h_f_r_t1_north   h_f_r_t1_north
    h_f_r_t1_zero   h_f_r_t1_zero    h_f_r_t1_east
    h_f_r_t1_zero   h_f_r_t1_zero    h_f_r_t1_zero
    blendwidth 3 blend move_y -1 1 blend move_x 1 -1
    ACT_BB_H_R_T1 1
    { event AE_BB_FOOTSTEP_SPLASH 6 "0" }
    { event AE_BB_FOOTSTEP_SPLASH 15  "1" }
    frames 0 41
    cmdlist heavy_attack_settings
    addlayer h_r_t1_upper
  }


/*
  $sequence h_f_r_t1_upper {
    anim_h_f_r_t1
    frames 0 50
    weightlist UpperBodyRun
    x y z
    ACT_BB_H_F_R_T1_UPPER 1
  }

  $sequence h_f_r_t1_lower {
    anim_h_f_r_t1
    frames 0 42
    walkframe 5   LX LY
    walkframe 10  LX LY
    walkframe 15  LX LY
    walkframe 20  LX LY
    walkframe 25  LX LY
    walkframe 30  LX LY
    walkframe 35  LX LY
    walkframe 40  LX LY
    walkframe 42  LX LY
    ACT_BB_H_F_R_T1_LOWER 1
  }
*/