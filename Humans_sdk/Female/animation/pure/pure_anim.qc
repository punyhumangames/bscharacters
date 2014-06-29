//====================================================
//
//	Pure Animations
//
//====================================================


//	The name of the mdl we're going to export to
$modelname player/anim_pure.mdl

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

//      Import sheathing
$include "stance_sheathe.qci"


//====================================================
//
//	Pure BALANCED STANCE IDLE + RUN
//
//====================================================

	$sequence b_idle "anim_b_idle"{
		ACT_BB_B_IDLE 1
		fps 24
		//alignto reference
		loop
		//cmdlist lockfeet
	}

	$sequence b_turn_left {
		anim_b_idle_turn_left_90
		activity ACT_BB_B_TURN_LEFT 1
		alignto b_idle
		fps 40
		LZR
		loop
		//	TODO
		//ikrule lfoot footstep range 3 18 22 21 height $STANDARD_IK_HEIGHT$ usesequence
		//ikrule rfoot footstep range 1 4 13 18 height $STANDARD_IK_HEIGHT$ usesequence
	}

	$animation b_run_upper_run anim_b_run_upper weightlist UpperBodyRun alignto reference
	$animation b_run_upper_idle anim_b_run_upper_idle alignto b_run_upper_run weightlist UpperBodyRun

	$sequence b_run_upper {
		b_run_upper_run b_run_upper_run b_run_upper_run
		b_run_upper_run b_run_upper_idle b_run_upper_run
		b_run_upper_run b_run_upper_run b_run_upper_run
		blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
		weightlist UpperBodyRun
		x
		iklock lfoot 1 0 iklock rfoot 1 0
	}

	$sequence b_run {
		a_RunNW_IK a_RunN_IK a_RunNE_IK
		a_RunW_IK a_RunZero_IK a_RunE_IK
		a_RunSW_IK a_RunS_IK a_RunSE_IK
		blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
		addlayer b_run_upper
		ACT_BB_B_RUN 1
		{ event AE_BB_FOOTSTEP_SPLASH	6	"0" }
		{ event AE_BB_FOOTSTEP_SPLASH	15	"1" }
	}

	//	string 1 charge
	$sequence b_s1_charge "anim_b_s1_charge"{
		ACT_BB_B_C1_CHARGE 1
		alignto b_idle
		fps 20
	}

	//	string 1 charge run
	$sequence b_s1_charge_run "anim_b_s1_charge_run"{
		ACT_BB_B_C1_CHARGE_RUNNING 1
		alignto b_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRun
	}

	//	string 1 tiered attacks
	$animation a_b_s1_t1 "anim_b_s1_t1" frames 0 60
	$sequence	b_s1_t1 {
		a_b_s1_t1
		ACT_BB_B_C1_T1 1
		fps 60
		//alignto reference
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		{ event AE_CL_PLAYWEAPONSOUND				15	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			15	".B_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				32	"Weapon_Blade.Balanced" }
	}

	$animation a_b_s1_t2 "anim_b_s1_t2" frames 0 91
	$sequence	b_s1_t2 {
		a_b_s1_t2
		ACT_BB_B_C1_T2 1
		fps 60
		//alignto reference
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		walkframe 80	LX
		walkframe 90	LX
		walkframe 91	LX
		{ event AE_CL_PLAYWEAPONSOUND				15	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			67	".B_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				67	"Weapon_Blade.Balanced" }
	}

	$animation a_b_s1_t3 "anim_b_s1_t3" frames 0 70
	$sequence	b_s1_t3 {
		a_b_s1_t3
		ACT_BB_B_C1_T3 1
		fps 60
		//alignto reference
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		{ event AE_CL_PLAYWEAPONSOUND				13	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			33	".B_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				33	"Weapon_Blade.Balanced" }
	}



	//	string 2 charge
	$sequence b_s2_charge "anim_b_s2_charge"{
		ACT_BB_B_C2_CHARGE 1
		alignto b_idle
		fps 20
	}

	//	string 2 tiered attacks
	$animation a_b_s2_t1 "anim_b_s2_t1" frames 0 60
	$sequence	b_s2_t1 {
		a_b_s2_t1
		ACT_BB_B_C2_T1 1
		fps 50
		alignto b_idle
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		{ event AE_CL_PLAYSOUND						0	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				10	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			10	".B_Attack" }
	}

	$animation a_b_s2_t2 "anim_b_s2_t1" frames 0 60
	$sequence	b_s2_t2 {
		a_b_s2_t2
		ACT_BB_B_C2_T2 1
		fps 34
		alignto b_idle
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		{ event AE_CL_PLAYSOUND						0	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				10	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			10	".B_Attack" }
	}

	$animation a_b_s2_t3 "anim_b_s2_t3" frames 0 110
	$sequence	b_s2_t3 {
		a_b_s2_t3
		ACT_BB_B_C2_T3 1
		fps 60
		alignto b_idle
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		walkframe 80	LX
		walkframe 90	LX
		walkframe 100	LX
		walkframe 110	LX
		{ event AE_CL_PLAYCHARACTERSOUND			10	".Kata" }
		{ event AE_CL_PLAYSOUND						36	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				37	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				41	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYSOUND						47	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				68	"Weapon_Blade.Balanced" }
	}

	//	string 3 charge
	$sequence b_s3_charge "anim_b_s3_charge"{
		ACT_BB_B_C3_CHARGE 1
		alignto b_idle
		fps 20
	}

	//	string 3 tiered attacks
	$animation a_b_s3_t1 "anim_b_s3_t1" frames 0 100
	$sequence	b_s3_t1 {
		a_b_s3_t1
		ACT_BB_B_C3_T1 1
		fps 70
		alignto b_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 100	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				5	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYSOUND						10	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				20	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				50	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			40	".B_Attack" }
		{ event AE_SCREEN_SHAKE						55	"0.1 1.2 4.0" }
	}

	$animation a_b_s3_t2 "anim_b_s3_t1" frames 0 100
	$sequence	b_s3_t2 {
		a_b_s3_t2
		ACT_BB_B_C3_T2 1
		fps 55
		alignto b_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 100	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				5	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYSOUND						10	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				20	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				50	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			40	".B_Attack" }
		{ event AE_SCREEN_SHAKE						55	"0.1 1.2 4.0" }
	}


	$animation a_b_s3_t3 "anim_b_s3_t3" frames 0 120
	$sequence	b_s3_t3 {
		a_b_s3_t3
		ACT_BB_B_C3_T3 1
		fps 60
		alignto b_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 100	LX LY
		walkframe 110	LX LY
		walkframe 120	LX LY
		{ event AE_CL_PLAYCHARACTERSOUND			10	".Kata" }
		{ event AE_CL_PLAYWEAPONSOUND				23	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				48	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				55	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				60	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYSOUND						58	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				75	"Weapon_Blade.Balanced" }
		{ event AE_SCREEN_SHAKE						82	"0.1 1.2 4.0" }

	}

	//	right charge
	$sequence b_right_charge "anim_b_right_charge"{
		ACT_BB_B_RIGHT_CHARGE 1
		alignto b_idle
		fps 20
	}

	//	right charge run
	$sequence b_right_charge_run "anim_b_right_charge_run"{
		ACT_BB_B_RIGHT_CHARGE_RUNNING 1
		alignto b_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRun
	}

	$animation a_b_right_t1 "anim_b_right_t1" frames 0 78
	$sequence	b_right_t1 {
		a_b_right_t1
		ACT_BB_B_RIGHT_T1 1
		fps 58
		alignto b_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 78	LX LY
		{ event AE_CL_PLAYSOUND						10	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYSOUND						30	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				55	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			10	".B_Attack" }
	}

	$animation a_b_right_t2 "anim_b_right_t1" frames 0 78
	$sequence	b_right_t2 {
		a_b_right_t2
		ACT_BB_B_RIGHT_T2 1
		fps 48
		alignto b_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 78	LX LY
		{ event AE_CL_PLAYSOUND						10	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYSOUND						30	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				55	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			10	".B_Attack" }
	}

	$animation a_b_right_t3 "anim_b_right_t3" frames 0 130
	$sequence	b_right_t3 {
		a_b_right_t3
		ACT_BB_B_RIGHT_T3 1
		fps 60
		alignto b_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 100	LX LY
		walkframe 110	LX LY
		walkframe 120	LX LY
		walkframe 130	LX LY
		{ event AE_CL_PLAYSOUND						10	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYCHARACTERSOUND			10	".Kata" }
		{ event AE_CL_PLAYWEAPONSOUND				12	"Weapon_Blade.Balanced" }

		{ event AE_CL_PLAYSOUND						33	"Player_Shared.WindImpact" }
		{ event AE_CL_PLAYWEAPONSOUND				37	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				42	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYWEAPONSOUND				49	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYSOUND						49	"Player_Shared.WindImpact" }

		{ event AE_CL_PLAYWEAPONSOUND				65	"Weapon_Blade.Balanced" }
	}

	//	left charge
	$sequence b_left_charge "anim_b_left_charge"{
		ACT_BB_B_LEFT_CHARGE 1
		alignto b_idle
		fps 20
	}

	//	left charge run
	$sequence b_left_charge_run "anim_b_left_charge_run"{
		ACT_BB_B_LEFT_CHARGE_RUNNING 1
		alignto b_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRun
	}

	$animation a_b_left_t1 "anim_b_left_t1" frames 0 36
	$sequence	b_left_t1 {
		a_b_left_t1
		ACT_BB_B_LEFT_T1 1
		fps 32
		alignto b_idle
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackMoveBlend
		{ event AE_CL_PLAYWEAPONSOUND				13	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			13	".B_Attack" }
	}

	$animation a_b_left_t2 "anim_b_left_t2" frames 0 36
	$sequence	b_left_t2 {
		a_b_left_t2
		ACT_BB_B_LEFT_T2 1
		fps 60
		alignto b_idle
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackMoveBlend
		{ event AE_CL_PLAYWEAPONSOUND				13	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			13	".B_Attack" }
	}


	$animation a_b_left_t3 "anim_b_left_t3"
	$sequence	b_left_t3 {
		a_b_left_t3
		ACT_BB_B_LEFT_T3 1
		fps 60
		alignto b_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				13	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			13	".B_Attack" }
	}


//====================================================
//
//	Pure FAST STANCE IDLE + RUN
//
//====================================================


	$sequence r_idle "anim_r_idle"{
		ACT_BB_R_IDLE 1
		fps 24
		//alignto b_idle
		loop
		//cmdlist lockfeet
	}

	$sequence r_turn_left {
		anim_r_idle_turn_left_90
		activity ACT_BB_R_TURN_LEFT 1
		alignto r_idle
		fps 40
		LZR
		loop
		//	TODO
		//ikrule lfoot footstep range 3 18 22 21 height $STANDARD_IK_HEIGHT$ usesequence
		//ikrule rfoot footstep range 1 4 13 18 height $STANDARD_IK_HEIGHT$ usesequence
	}

	//	PLACEHOLDER RUN UPPER REPLACE ME
	//	CRCJAX
	//	replace the two lines below with these to test
	$animation r_run_upper_run anim_r_run_upper weightlist UpperBodyRun alignto reference
	$animation r_run_upper_idle anim_r_run_upper_idle alignto r_run_upper_run weightlist UpperBodyRun

	//$animation r_run_upper_run anim_b_run_upper weightlist UpperBodyRun alignto reference
	//$animation r_run_upper_idle anim_b_run_upper_idle alignto r_run_upper_run weightlist UpperBodyRun

	$sequence r_run_upper {
		r_run_upper_run r_run_upper_run r_run_upper_run
		r_run_upper_run r_run_upper_idle r_run_upper_run
		r_run_upper_run r_run_upper_run r_run_upper_run
		blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
		weightlist UpperBodyRun
		x
		iklock lfoot 1 0 iklock rfoot 1 0
	}

	$sequence r_run {
		a_RunNW_IK a_RunN_IK a_RunNE_IK
		a_RunW_IK a_RunZero_IK a_RunE_IK
		a_RunSW_IK a_RunS_IK a_RunSE_IK
		blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
		addlayer r_run_upper
		ACT_BB_R_RUN 1
		{ event AE_BB_FOOTSTEP_SPLASH	6	"0" }
		{ event AE_BB_FOOTSTEP_SPLASH	15	"1" }
	}

	//	string 1 charge
	$sequence r_s1_charge "anim_r_s1_charge"{
		ACT_BB_R_C1_CHARGE 1
		alignto r_idle
		fps 20
	}

	//	string 1 charge run
	$sequence r_s1_charge_run "anim_r_s1_charge_run"{
		ACT_BB_R_C1_CHARGE_RUNNING 1
		alignto r_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRun
	}

	//	string 1 tiered attacks
	$animation a_r_s1_t1 "anim_r_s1_t1" frames 0 77
	$sequence	r_s1_t1 {
		a_r_s1_t1
		ACT_BB_R_C1_T1 1
		fps 54
		//alignto reference
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		walkframe 75	LX
		walkframe 77	LX
		{ event AE_CL_PLAYWEAPONSOUND				10	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				20	"Weapon_Blade.Reverse" }
	}

	$animation a_r_s1_t2 "anim_r_s1_t2" frames 0 77
	$sequence	r_s1_t2 {
		a_r_s1_t2
		ACT_BB_R_C1_T2 1
		fps 54
		alignto r_idle
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		walkframe 75	LX
		walkframe 77	LX
		{ event AE_CL_PLAYWEAPONSOUND				6	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			6	".B_Attack" }
	}

	$animation a_r_s1_t3 "anim_r_s1_t3" frames 0 62
	$sequence	r_s1_t3 {
		a_r_s1_t3
		ACT_BB_R_C1_T3 1
		fps 54
		alignto r_idle
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 62	LX
		{ event AE_CL_PLAYWEAPONSOUND				6	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			6	".B_Attack" }
	}

	//	string 2 charge
	$sequence r_s2_charge "anim_r_s2_charge"{
		ACT_BB_R_C2_CHARGE 1
		alignto r_s1_t1
		align r_s1_t1 y 67 60
		fps 20
	}

	//	string 2 tiered attacks
	$animation a_r_s2_t1 "anim_r_s2_t1" frames 0 67
	$sequence	r_s2_t1 {
		a_r_s2_t1
		ACT_BB_R_C2_T1 1
		fps 60
		alignto r_s1_t1
		align r_s1_t1 y 67 67
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 67	LX
		{ event AE_CL_PLAYWEAPONSOUND				10	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				25	"Weapon_Blade.Reverse" }
	}

	$animation a_r_s2_t2 "anim_r_s2_t2" frames 0 65
	$sequence	r_s2_t2 {
		a_r_s2_t2
		ACT_BB_R_C2_T2 1
		fps 60
		alignto r_s1_t1
		align r_s1_t1 y 67 65
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 65	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				10	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				25	"Weapon_Blade.Reverse" }
	}

	$animation a_r_s2_t3 "anim_r_s2_t3" frames 0 75
	$sequence	r_s2_t3 {
		a_r_s2_t3
		ACT_BB_R_C2_T3 1
		fps 60
		alignto r_s1_t3
		align r_s1_t1 y 67 65
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 75	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				10	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				25	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			25	".B_Attack" }
	}

	//	string 3 charge
	$sequence r_s3_charge "anim_r_s3_charge"{
		ACT_BB_R_C3_CHARGE 1
		alignto r_idle
		fps 20
	}

	//	string 3 tiered attacks
	$animation a_r_s3_t1 "anim_r_s3_t1" frames 0 72
	$sequence	r_s3_t1 {
		a_r_s3_t1
		ACT_BB_R_C3_T1 1
		fps 60
		alignto r_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 72	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				20	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			20	".B_Attack" }
	}

	$animation a_r_s3_t2 "anim_r_s3_t2" frames 0 75
	$sequence	r_s3_t2 {
		a_r_s3_t2
		ACT_BB_R_C3_T2 1
		fps 60
		alignto r_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 75	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				20	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				30	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			30	".B_Attack" }
	}


	$animation a_r_s3_t3 "anim_r_s3_t3" frames 0 90
	$sequence	r_s3_t3 {
		a_r_s3_t3
		ACT_BB_R_C3_T3 1
		fps 60
		alignto r_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		{ event AE_CL_PLAYCHARACTERSOUND			20	".B_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				30	"Weapon_Blade.Reverse" }
		{ event AE_SCREEN_SHAKE						40	"0.2 0.5 8.0" }
		{ event AE_CL_PLAYSOUND 					40 "Player_Shared.WallRun" }
		{ event AE_CL_PLAYSOUND 					38 "Player_Shared.Slide" }
		{ event AE_CL_CREATE_PARTICLE_EFFECT 		44 "player_shuffle follow_origin" }
		{ event AE_CL_CREATE_PARTICLE_EFFECT 		50 "player_shuffle follow_origin" }
		{ event AE_CL_CREATE_PARTICLE_EFFECT 		55 "player_shuffle follow_origin" }
	}

	//	string left charge
	$sequence r_left_charge "anim_r_left_charge"{
		ACT_BB_R_LEFT_CHARGE 1
		alignto r_idle
		fps 20
	}

	//	left charge run
	$sequence r_left_charge_run "anim_r_left_charge_run"{
		ACT_BB_R_LEFT_CHARGE_RUNNING 1
		//alignto r_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRun
	}

	//	left tiered attacks
	$animation a_r_left_t1 "anim_r_left_t1" frames 0 105
	$sequence	r_left_t1 {
		a_r_left_t1
		ACT_BB_R_LEFT_T1 1
		fps 80
		alignto r_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 100	LX LY
		walkframe 105	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				44	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				55	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				66	"Weapon_Blade.Reverse" }
	}

	$animation a_r_left_t2 "anim_r_left_t2" frames 0 77
	$sequence	r_left_t2 {
		a_r_left_t2
		ACT_BB_R_LEFT_T2 1
		fps 60
		alignto r_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 77	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				39	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			41	".B_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				51	"Weapon_Blade.Reverse" }
	}

	$animation a_r_left_t3 "anim_r_left_t3" frames 0 81
	$sequence	r_left_t3 {
		a_r_left_t3
		ACT_BB_R_LEFT_T3 1
		fps 60
		alignto r_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 81	LX LY
		{ event AE_CL_PLAYCHARACTERSOUND			30	".B_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				30	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				39	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				48	"Weapon_Blade.Reverse" }
	}


	//	string right charge
	$sequence r_right_charge "anim_r_right_charge"{
		ACT_BB_R_RIGHT_CHARGE 1
		alignto r_idle
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackMoveBlend
		fps 20
	}

	//	right charge run
	$sequence r_right_charge_run "anim_r_right_charge_run"{
		ACT_BB_R_RIGHT_CHARGE_RUNNING 1
		//alignto r_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRun
	}

	$animation a_r_right_t1 "anim_r_right_t1" frames 0 34
	$sequence	r_right_t1 {
		a_r_right_t1
		ACT_BB_R_RIGHT_T1 1
		fps 38
		alignto r_idle
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackMoveBlend
		{ event AE_CL_PLAYWEAPONSOUND				6	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYWEAPONSOUND				14	"Weapon_Blade.Reverse" }
	}

	$animation a_r_right_t2 "anim_r_right_t2" frames 0 19
	$sequence	r_right_t2 {
		a_r_right_t2
		ACT_BB_R_RIGHT_T2 1
		fps 38
		alignto r_idle
		fadein 0.05
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackMoveBlend
		{ event AE_CL_PLAYWEAPONSOUND				1	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			1	".B_Attack" }
	}

	$animation a_r_right_t3 "anim_r_right_t3" frames 0 81
	$sequence	r_right_t3 {
		a_r_right_t3
		ACT_BB_R_RIGHT_T3 1
		fps 70
		alignto r_idle
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 81	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				48	"Weapon_Blade.Reverse" }
		{ event AE_CL_PLAYCHARACTERSOUND			48	".B_Attack" }
	}

//====================================================
//
//	Pure HEAVY STANCE IDLE + RUN
//
//====================================================


	$sequence h_idle "anim_h_idle"{
		ACT_BB_H_IDLE 1
		fps 24
		//alignto reference
		loop
		//cmdlist lockfeet
	}

	$sequence h_turn_left {
		anim_h_idle_turn_left_90
		activity ACT_BB_H_TURN_LEFT 1
		alignto h_idle
		fps 40
		LZR
		loop
		//	TODO
		//ikrule lfoot footstep range 3 18 22 21 height $STANDARD_IK_HEIGHT$ usesequence
		//ikrule rfoot footstep range 1 4 13 18 height $STANDARD_IK_HEIGHT$ usesequence
	}

	//	PLACEHOLDER RUN UPPER REPLACE ME
	$animation h_run_uppeh_run anim_h_run_upper weightlist UpperBodyRun alignto reference
	$animation h_run_upper_idle anim_h_run_upper_idle alignto h_run_uppeh_run weightlist UpperBodyRun

	$sequence h_run_upper {
		h_run_uppeh_run h_run_uppeh_run h_run_uppeh_run
		h_run_uppeh_run h_run_upper_idle h_run_uppeh_run
		h_run_uppeh_run h_run_uppeh_run h_run_uppeh_run
		blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
		weightlist UpperBodyRun
		x
		iklock lfoot 1 0 iklock rfoot 1 0
	}

	$sequence h_run {
		a_RunNW_IK a_RunN_IK a_RunNE_IK
		a_RunW_IK a_RunZero_IK a_RunE_IK
		a_RunSW_IK a_RunS_IK a_RunSE_IK
		blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
		addlayer h_run_upper
		ACT_BB_H_RUN 1
		{ event AE_BB_FOOTSTEP_SPLASH	6	"0" }
		{ event AE_BB_FOOTSTEP_SPLASH	15	"1" }
	}

	//	string 1 charge
	$sequence h_s1_charge "anim_h_s1_charge"{
		ACT_BB_H_C1_CHARGE 1
		alignto h_idle
		fps 20
	}

	//	string 1 charge run
	$sequence h_s1_charge_run "anim_h_s1_charge_run"{
		ACT_BB_H_C1_CHARGE_RUNNING 1
		alignto h_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRunDualHands
	}

	//	string 1 tiered attacks
	$animation a_h_s1_t1 "anim_h_s1_t1" frames 0 89
	$sequence	h_s1_t1 {
		a_h_s1_t1
		ACT_BB_H_C1_T1 1
		fps 60
		//alignto reference
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		walkframe 80	LX
		walkframe 89	LX
		{ event AE_CL_PLAYWEAPONSOUND				30	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			30	".H_Attack" }
		{ event AE_SCREEN_SHAKE						35	"0.2 1.2 12.0" }
	}

	$animation a_h_s1_t2 "anim_h_s1_t2" frames 0 143
	$sequence	h_s1_t2 {
		a_h_s1_t2
		ACT_BB_H_C1_T2 1
		fps 60
		//alignto reference
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		walkframe 80	LX
		walkframe 90	LX
		walkframe 100	LX
		walkframe 110	LX
		walkframe 120	LX
		walkframe 130	LX
		walkframe 140	LX
		walkframe 143	LX
		{ event AE_CL_PLAYCHARACTERSOUND			30	".H_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				30	"Weapon_Blade.Heavy" }
		{ event AE_SCREEN_SHAKE						35	"0.2 1.2 12.0" }
		{ event AE_CL_PLAYWEAPONSOUND				48	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYWEAPONSOUND				64	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYWEAPONSOUND				82	"Weapon_Blade.Heavy" }
		{ event AE_SCREEN_SHAKE						85	"0.2 1.2 12.0" }
	}

	//	string 2 charge
	$sequence h_s2_charge "anim_h_s2_charge"{
		ACT_BB_H_C2_CHARGE 1
		alignto h_idle
		fps 20
	}

	//	string 2 tiered attacks
	$animation a_h_s2_t1 "anim_h_s2_t1" frames 0 63
	$sequence	h_s2_t1 {
		a_h_s2_t1
		ACT_BB_H_C2_T1 1
		fps 60
		align a_h_s1_t1 x 0 0
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 63	LX
		{ event AE_CL_PLAYWEAPONSOUND				20	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			20	".H_Attack" }
		{ event AE_SCREEN_SHAKE						22	"0.1 1.2 4.0" }
	}

	$animation a_h_s2_t2 "anim_h_s2_t2" frames 0 136
	$sequence	h_s2_t2 {
		a_h_s2_t2
		ACT_BB_H_C2_T2 1
		fps 60
		align a_h_s1_t2 x 0 0
		walkframe 5		LX
		walkframe 10	LX
		walkframe 20	LX
		walkframe 30	LX
		walkframe 40	LX
		walkframe 50	LX
		walkframe 60	LX
		walkframe 70	LX
		walkframe 80	LX
		walkframe 90	LX
		walkframe 100	LX
		walkframe 110	LX
		walkframe 120	LX
		walkframe 130	LX
		walkframe 136	LX
		{ event AE_CL_PLAYWEAPONSOUND				30	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			30	".H_Attack" }
		{ event AE_SCREEN_SHAKE						32	"0.1 1.2 4.0" }

		{ event AE_CL_PLAYWEAPONSOUND				90	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			90	".H_Attack" }
		{ event AE_SCREEN_SHAKE						92	"0.1 1.2 4.0" }
	}

	//	left charge
	$sequence h_left_charge "anim_h_left_charge"{
		ACT_BB_H_LEFT_CHARGE 1
		alignto h_idle
		fps 20
	}

	//	left charge run
	$sequence h_left_charge_run "anim_h_left_charge_run"{
		ACT_BB_H_LEFT_CHARGE_RUNNING 1
		//alignto h_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRunDualHands
	}

	//	left tiered attacks
	$animation a_h_left_t1 "anim_h_left_t1" frames 0 96
	$sequence	h_left_t1 {
		a_h_left_t1
		ACT_BB_H_LEFT_T1 1
		fps 60
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 96	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				25	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			25	".H_Attack" }
		{ event AE_SCREEN_SHAKE						30	"0.2 1.2 12.0" }
	}

	$animation a_h_left_t2 "anim_h_left_t2" frames 0 160
	$sequence	h_left_t2 {
		a_h_left_t2
		ACT_BB_H_LEFT_T2 1
		fps 60
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 100	LX LY
		walkframe 110	LX LY
		walkframe 120	LX LY
		walkframe 130	LX LY
		walkframe 140	LX LY
		walkframe 150	LX LY
		walkframe 160	LX LY

		{ event AE_CL_PLAYWEAPONSOUND				40	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			40	".H_Attack" }
		{ event AE_SCREEN_SHAKE						45	"0.2 1.2 12.0" }

		{ event AE_CL_PLAYWEAPONSOUND				89	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			89	".H_Attack" }
	}

	//	right charge
	$sequence h_right_charge "anim_h_right_charge"{
		ACT_BB_H_RIGHT_CHARGE 1
		alignto h_idle
		fps 20
	}

	//	right charge run
	$sequence h_right_charge_run "anim_h_right_charge_run"{
		ACT_BB_H_RIGHT_CHARGE_RUNNING 1
		//alignto h_idle
		fps 40
		iklock lfoot 1 0 iklock rfoot 1 0
		weightlist AttackChargeRunDualHands
	}

	//	right tiered attacks

	//	right tiered attacks
	$animation a_h_right_t1 "anim_h_right_t1" frames 0 86
	$sequence	h_right_t1 {
		a_h_right_t1
		ACT_BB_H_RIGHT_T1 1
		fps 65
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 86	LX LY

		{ event AE_CL_PLAYWEAPONSOUND				45	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			45	".H_Attack" }				{ event AE_SCREEN_SHAKE						50	"0.1 1.2 5.0" }
	}


	$animation a_h_right_t2 "anim_h_right_t2" frames 0 118
	$sequence	h_right_t2 {
		a_h_right_t2
		ACT_BB_H_RIGHT_T2 1
		fps 65
		walkframe 5		LX LY
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 40	LX LY
		walkframe 50	LX LY
		walkframe 60	LX LY
		walkframe 70	LX LY
		walkframe 80	LX LY
		walkframe 90	LX LY
		walkframe 100	LX LY
		walkframe 110	LX LY
		walkframe 118	LX LY
		{ event AE_CL_PLAYWEAPONSOUND				45	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			45	".H_Attack" }
		{ event AE_CL_PLAYWEAPONSOUND				60	"Weapon_Blade.Heavy" }
		{ event AE_CL_PLAYCHARACTERSOUND			60	".H_Attack" }
		{ event AE_SCREEN_SHAKE						50	"0.1 1.2 5.0" }
		{ event AE_SCREEN_SHAKE						65	"0.1 1.2 4.0" }
	}

//====================================================
//
//	Pure AIR STANCE IDLE + RUN
//
//====================================================

	//	the source file for female air idle is in female_shared
	//	these are shared for now until later we can do unique character air idles

	//	for now just copy the smds from folder to folder

	$sequence a_idle "anim_a_idle_center"{
		ACT_BB_A_IDLE 1
		fps 24
		alignto reference
		loop
	}

	$animation a_a_run_base anim_a_idle_center frame 0 1 loop X Y alignto reference
	$animation a_air_n anim_a_idle_forward frame 0 1 loop X Y alignto reference
	$animation a_air_s anim_a_idle_back frame 0 1 loop X Y alignto reference
	$animation a_air_w anim_a_idle_left frame 0 1 loop X Y alignto reference
	$animation a_air_e anim_a_idle_right frame 0 1 loop X Y alignto reference
	$sequence a_run {
		a_air_w a_air_n a_air_e
		a_air_w a_a_run_base a_air_e
		a_air_w a_air_s a_air_e
		blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
		ACT_BB_A_RUN 1
		alignto reference
	}

	//	string 1 tiered attacks
	$animation a_a_s1_t1 "anim_a_s1_t1" frames 0 48
	$sequence	a_s1_t1 {
		a_a_s1_t1
		ACT_BB_A_C1_T1 1
		fps 60
		walkframe 10	LX LY LZ
		walkframe 20	LX LY LZ
		walkframe 30	LX LY LZ
		walkframe 40	LX LY LZ
		walkframe 48	LX LY LZ
		{ event AE_CL_PLAYWEAPONSOUND				30	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			30	".B_Attack" }
	}

	$animation a_a_s1_land "anim_a_s1_land" frames 0 39
	$sequence	a_s1_land {
		a_a_s1_land
		ACT_BB_LAND_LEFT 1
		fps 40
		fadeout 0.6
		walkframe 10	LX LY
		walkframe 20	LX LY
		walkframe 30	LX LY
		walkframe 39	LX LY
		{ event AE_SCREEN_SHAKE						0	"0.1 1.0 10.0" }
		{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_slide_dust follow_attachment lfoot" }
		{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_slide_dust follow_attachment rfoot" }
		{ event AE_CL_PLAYSOUND 0 "Player_Shared.Attack_Land" }
	}

	$animation a_a_left_t1 "anim_a_left_t1" frames 0 48
	$sequence	a_left_t1 {
		a_a_left_t1
		ACT_BB_A_LEFT_T1 1
		fps 55
		walkframe 10	LX LY LZ
		walkframe 20	LX LY LZ
		walkframe 30	LX LY LZ
		walkframe 40	LX LY LZ
		walkframe 48	LX LY LZ
		{ event AE_CL_PLAYWEAPONSOUND				26	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			26	".B_Attack" }
	}

	$animation a_a_right_t1 "anim_a_right_t1" frames 0 48
	$sequence	a_right_t1 {
		a_a_right_t1
		ACT_BB_A_RIGHT_T1 1
		fps 55
		walkframe 10	LX LY LZ
		walkframe 20	LX LY LZ
		walkframe 30	LX LY LZ
		walkframe 40	LX LY LZ
		walkframe 48	LX LY LZ
		{ event AE_CL_PLAYWEAPONSOUND				17	"Weapon_Blade.Balanced" }
		{ event AE_CL_PLAYCHARACTERSOUND			17	".B_Attack" }
	}


	$sequence customize "anim_customize" loop FPS 30 activity ACT_BB_CUSTOMIZE 1