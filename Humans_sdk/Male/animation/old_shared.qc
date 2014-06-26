
//	The name of the mdl we're going to export to
$modelname player/player_anim_shared.mdl

//	Import all the bones we need to refer to
$include "../berimbau_sharedbones.qci"

//	Import all the weight scripts
$include "ruleshierarchy.qci"

//	Import body yaw pitch blenders
$include "../../body_poses_lean.qci"

//====================================================
//
//	LOWER BODY MOVEMENT ANIMATION
//
//====================================================

	//-----------------
	//	Idles
	//-----------------

		$sequence Idle_lower "anim_b_idle" loop FPS 30 activity ACT_IDLE 1

	//-----------------
	//	Run
	//-----------------

		$animation a_RunS RunS startloop 0 LX LY alignto Idle_lower rotateto -180
		$animation a_RunSE RunSE startloop 0 LX LY alignto Idle_lower rotateto -135
		$animation a_RunE RunE startloop 0 LX LY alignto Idle_lower rotateto -90
		$animation a_RunNE RunNE startloop 0 LX LY alignto Idle_lower rotateto -45
		$animation a_RunN RunN startloop 0 LX LY alignto Idle_lower rotateto 0
		$animation a_RunNW RunNW startloop 0 LX LY alignto Idle_lower rotateto 45
		$animation a_RunW RunW startloop 0 LX LY alignto Idle_lower rotateto 90
		$animation a_RunSW RunSW startloop 0 LX LY alignto Idle_lower rotateto 135
		$animation a_RunZero "anim_b_idle" 

		$sequence Run_lower {
			a_RunNW a_RunN a_RunNE 
			a_RunW a_RunZero a_RunE 
			a_RunSW a_RunS a_RunSE 
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
			ACT_RUN 1
			{ event 7001 14 "lfoot" }
			{ event 7001 5 "rfoot" }
			//{ event AE_CL_CREATE_PARTICLE_EFFECT 14 "player_slide_dust follow_attachment lfoot" }	
			//{ event AE_CL_CREATE_PARTICLE_EFFECT 5 "player_slide_dust follow_attachment rfoot" }			
		}

	
	//-----------------
	//	Walk
	//-----------------

		$animation a_WalkS anim_bb_walk_s startloop 0 LX LY loop alignto Idle_lower rotateto -180 fps 40 	alignto Idle_Lower
		$animation a_WalkSE anim_bb_walk_s startloop 0 LX LY loop alignto Idle_lower rotateto -135 fps 40 	alignto Idle_Lower
		$animation a_WalkE anim_bb_walk_e startloop 0 LX LY loop alignto Idle_lower rotateto -90 fps 40 	alignto Idle_Lower
		$animation a_WalkNE anim_bb_walk_n startloop 0 LX LY loop alignto Idle_lower rotateto -45 fps 40 	alignto Idle_Lower
		$animation a_WalkN anim_bb_walk_n startloop 0 LX LY loop alignto Idle_lower rotateto 0 fps 40 		alignto Idle_Lower
		$animation a_WalkNW anim_bb_walk_n startloop 0 LX LY loop alignto Idle_lower rotateto 45 fps 40 	alignto Idle_Lower
		$animation a_WalkW anim_bb_walk_w startloop 0 LX LY loop alignto Idle_lower rotateto 90 fps 40 		alignto Idle_Lower
		$animation a_WalkSW anim_bb_walk_s startloop 0 LX LY loop alignto Idle_lower rotateto 135 fps 40 	alignto Idle_Lower
		$animation a_walkZero "anim_bb_walk_idle"  alignto Idle_lower loop fps 40

		$sequence walk_lower {
			a_walkNW a_walkN a_walkNE 
			a_walkW a_walkZero a_walkE 
			a_walkSW a_walkS a_walkSE 
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
			ACT_WALK 1
			{ event 7002 15 "lfoot" }
			{ event 7002 4 "lfoot" }
		}

$sequence reference	"anim_ref" {
	ACT_BB_REF 1
}

$include "berimbau_macros.qci"

	//-----------------------
	//	BALANCED STANCE IDLE + RUN
	//-----------------------	
$sequence b_idle "anim_b_idle"{
	ACT_BB_B_IDLE 1
	fps 24
	alignto Idle_Lower
	loop
}
$animation a_b_RunZero "anim_b_idle" 
$animation a_b_idle_base anim_b_idle frame 0 0
$animation a_b_run_base anim_b_run_gesture frame 0 11 loop
$sequence b_run_body "anim_b_run_movement" {	
	weightlist UpperbodyBlend 	
	loop
	//hidden
}
$sequence b_run_mod "RunN" { 
	X Y rotateto 0 
	alignto reference 
	weightlist SlowerUpperbodyBlend 
	worldspaceblend a_b_run_base 
	//weightlist HipsUpperbodyReplace 
	//hidden 
} 
$sequence b_run { 
	a_RunNW a_RunN a_RunNE 
	a_RunW a_b_run_base a_RunE 
	a_RunSW a_RunS a_RunSE 
	blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
	addlayer b_run_mod 	
	addlayer b_run_body
	ACT_BB_B_RUN 1
}

$sequence b_block "anim_b_block"{ 
	ACT_BB_B_BLOCK 1
	fps 40
	alignto Idle_Lower
}

$sequence b_block_blocked "anim_b_block_blocked"{ 
	ACT_BB_B_BLOCK_BLOCKED 1
	fps 40
	alignto Idle_Lower
	snap
	X Y
	//loop
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_forward_riposte "anim_b_block_forward_riposte"{ 
	ACT_BB_B_BLOCK_FORWARD_RIPOSTE 1
	fps 42
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

/*
$sequence b_block_blocked2 "anim_b_block_blocked2"{ 
	frames 0 30
	ACT_BB_B_BLOCK_BLOCKED 1
	fps 40
	alignto Idle_Lower
	snap
	X Y
	loop
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_blocked3 "anim_b_block_blocked3"{ 
	frames 0 30
	ACT_BB_B_BLOCK_BLOCKED 1
	fps 10
	alignto Idle_Lower
	snap
	X Y
	loop
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}
*/

$sequence b_block_weak_left "anim_b_block_weak_left"{ 
	ACT_BB_B_BLOCK_WEAK_LEFT 1
	fps 26
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_weak_right "anim_b_block_weak_right"{ 
	ACT_BB_B_BLOCK_WEAK_RIGHT 1
	fps 26
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}


$sequence b_block_left "anim_b_block_left"{ 
	ACT_BB_B_BLOCK_LEFT 1
	fps 40
	{ event AE_CL_PLAYSOUND 0 "Blade.Block.Left" }
	//alignto Idle_Lower
	//loop
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_left_weak "anim_b_block_left_weak"{ 
	ACT_BB_B_BLOCK_LEFT_WEAK 1
	fps 42
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_left_riposte "anim_b_block_left_riposte"{ 
	ACT_BB_B_BLOCK_LEFT_RIPOSTE 1
	fps 42
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_right "anim_b_block_right"{ 
	ACT_BB_B_BLOCK_RIGHT 1
	fps 40
	{ event AE_CL_PLAYSOUND 0 "Blade.Block.Right" }
	//alignto Idle_Lower
	//loop
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_right_weak "anim_b_block_right_weak"{ 
	ACT_BB_B_BLOCK_RIGHT_WEAK 1
	fps 42
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence b_block_right_riposte "anim_b_block_right_riposte"{ 
	ACT_BB_B_BLOCK_RIGHT_RIPOSTE 1
	fps 42
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

	//-----------------------
	//	HEAVY STANCE IDLE + RUN
	//-----------------------
$sequence h_idle "anim_h_idle"{
	ACT_BB_H_IDLE 1
	fps 16
	alignto Idle_Lower
	loop
}
$animation a_h_RunZero "anim_h_idle" 
$animation a_h_idle_base anim_h_idle frame 0 0 
$animation a_h_run_base anim_h_run_gesture frame 0 0

$sequence h_run_mod "RunN" { 
	ACT_BB_H_RUN_UPPER 1
	X Y rotateto 0 
	alignto Idle_Lower 
	//weightlist UpperbodyBlend 
	worldspaceblend a_h_run_base 
	weightlist UpperbodyBlendNoHead
} 

$sequence h_run_upper "anim_h_run_gesture"{
	alignto reference
	//iklock lhand 0 1 iklock rhand 0 1 		
	weightlist SlowUpperbodyArmsReplace 		
}

$sequence h_run { 
	a_RunNW a_RunN a_RunNE 
	a_RunW a_h_run_base a_RunE 
	a_RunSW a_RunS a_RunSE 
	blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
	//addlayer h_run_upper 
	ACT_BB_H_RUN 1
	//iklock lhand 0 1 iklock rhand 0 1 		
}

$sequence h_block "anim_h_block"{ 
	ACT_BB_H_BLOCK 1
	fps 50
	alignto Idle_Lower
	//loop		
}

$sequence h_block_left "anim_h_block_left"{ 
	ACT_BB_H_BLOCK_LEFT 1
	fps 50
	//alignto Idle_Lower
	//loop
	{ event AE_CL_PLAYSOUND 0 "Blade.Block.Left" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}

$sequence h_block_right "anim_h_block_right"{ 
	ACT_BB_H_BLOCK_RIGHT 1
	fps 50
	//alignto Idle_Lower
	//loop
	{ event AE_CL_PLAYSOUND 0 "Blade.Block.Right" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}


$sequence h_block_forward_riposte "anim_h_block_forward_riposte"{ 
	ACT_BB_H_BLOCK_FORWARD_RIPOSTE 1
	fps 42
	alignto Idle_Lower
	snap
	X Y
	//loop
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }		
}


	//-----------------------
	//	REVERSE STANCE IDLE + RUN
	//-----------------------
$sequence reverse_compare "anim_r_idle_2" frame 0 1
	
$animation reverse_sword_anim "anim_reverse_sword"{
	subtract reverse_compare 0
}

$sequence reverse_sword "reverse_sword_anim"{
	frame 0 0
	delta
}


$sequence r_idle "anim_r_idle"{
	ACT_BB_R_IDLE 1
	frame 0 55
	fps 60
	loop
	//alignto Idle_Lower
	addlayer reverse_sword
}
$sequence r_idle_2 "anim_r_idle"{
//	ACT_BB_R_IDLE 1
	fps 26
	loop
	alignto Idle_Lower
}
$animation a_r_RunZero "anim_r_idle" 
$animation a_r_ridle_base anim_r_idle frame 0 0
$animation a_r_run_base anim_r_run_gesture frame 0 0

$sequence r_run { 
	a_RunNW a_RunN a_RunNE 
	a_RunW a_r_run_base a_RunE 
	a_RunSW a_RunS a_RunSE 
	blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
	//addlayer r_run_mod 
	addlayer reverse_sword	
	ACT_BB_R_RUN 1
}

$sequence r_run_mod anim_r_run_gesture { 
	ACT_BB_R_RUN_UPPER 1
	worldspaceblend a_r_run_base 
	weightlist UpperbodyBlendReverse 
	addlayer reverse_sword			
} 

$sequence r_block "anim_r_block"{ 
	ACT_BB_R_BLOCK 1
	fps 50
	alignto reference
	addlayer reverse_sword	
//	alignto Idle_Lower
//	loop
}

$sequence r_block_left "anim_r_block_left"{ 
	ACT_BB_R_BLOCK_LEFT 1
	fps 50
	frame 0 0
	alignto reference
	addlayer reverse_sword	
//	alignto Idle_Lower
//	loop
	{ event AE_CL_PLAYSOUND 0 "Blade.Block.Left" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }	
}

$sequence r_block_right "anim_r_block_right"{ 
	ACT_BB_R_BLOCK_RIGHT 1
	fps 50
	alignto reference
	addlayer reverse_sword	
//	alignto Idle_Lower
//	loop
	{ event AE_CL_PLAYSOUND 0 "Blade.Block.Right" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_block_dust follow_attachment rfoot" }	
}

	//-----------------------
	//	SHEATHED STANCE IDLE + RUN
	//-----------------------
$sequence s_idle "anim_bb_walk_idle"{
	ACT_BB_S_IDLE 1
	fps 50
	alignto Idle_Lower
	loop
}
$animation a_s_RunZero "anim_s_idle" 
$animation a_s_ridle_base anim_s_idle frame 0 0
$animation a_s_run_base anim_s_run_gesture frame 0 0
$sequence s_run_mod "RunN" { 
	X Y rotateto 0 
	alignto reference 
	weightlist UpperbodyBlend 
	worldspaceblend a_s_run_base 
	//weightlist HipsUpperbodyReplace 
	hidden 
} 
$sequence s_run { 
	a_RunNW a_RunN a_RunNE 
	a_RunW a_s_run_base a_RunE 
	a_RunSW a_RunS a_RunSE 
	blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
	addlayer s_run_mod 
	ACT_BB_S_RUN 1
}



	//-----------------
	//	Combat Manuever Moves
	//-----------------
$animation a_dash_forward anim_forward_dash frame 25 75
$sequence dash_forward a_dash_forward  {
	fps 105
	//fadein 0.0
	fadeout 0.2	
	ACT_BB_DASH_N 1

	walkframe 5		LX
	walkframe 15	LX
	walkframe 19	LX
	walkframe 25	LX
	walkframe 31	LX
	walkframe 37	LX
	walkframe 50	LX
	
	{ event AE_CL_PLAYCHARACTERSOUND			0	".Dash" }
	{ event AE_CL_PLAYSOUND						0	"Player_Shared.Dash_Forward_FX" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 10 "player_dash_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 10 "player_dash_dust follow_attachment rfoot" }
	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 20 "player_dash_dust follow_attachment rfoot" }	
	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 40 "player_slide_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 40 "player_slide_dust follow_attachment rfoot" }
}

$sequence roll_forward "anim_roll_forward" {
	X Y
	fps 140
	fadeout .7	
	ACT_BB_EVADE_N 1
	//{ event AE_CL_PLAYCHARACTERSOUND			0	".Roll" }
	{ event AE_CL_PLAYSOUND						0	"Player_Shared.Roll_Forward_FX" }	
}

$sequence roll_backward "anim_backflip" {
	frames 10 43
	Y
	fps 40
	fadeout .7	
	ACT_BB_EVADE_S 1
	walkframe 7		LX
	walkframe 20	LX
	walkframe 23	LX	
	walkframe 26	LX
	walkframe 28	LX
	walkframe 30	LX
	walkframe 32	LX
	/*
	walkframe 38	LX
	walkframe 43	LX	
	*/
	{ event AE_CL_PLAYCHARACTERSOUND			10	".Roll" }
	{ event AE_CL_PLAYMOVESOUND 10 "Player_Shared.Shuffle" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 10 "player_dash_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 10 "player_dash_dust follow_attachment rfoot" }
}


$sequence roll_right "anim_roll_right" {
	X
	fps 100
	fadeout .7	
	ACT_BB_EVADE_E 1
	walkframe 12	LY
	walkframe 21	LY
	walkframe 34	LY
	walkframe 43	LY
	walkframe 50	LY
	walkframe 55	LY
	walkframe 62	LY
	walkframe 66	LY
	walkframe 74	LY
	//{ event AE_CL_PLAYCHARACTERSOUND			20	".Roll" }
	{ event AE_CL_PLAYCHARACTERSOUND			33	".Roll_FX" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 20 "player_dash_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 20 "player_dash_dust follow_attachment rfoot" }	
}


$sequence roll_left "anim_roll_left" {
	X
	fps 100
	fadeout .7	
	ACT_BB_EVADE_W 1
	alignto roll_right
	
	walkframe 12	LY
	walkframe 21	LY
	walkframe 34	LY
	walkframe 43	LY
	walkframe 50	LY
	walkframe 55	LY
	walkframe 62	LY
	walkframe 66	LY
	walkframe 74	LY
	
	//{ event AE_CL_PLAYCHARACTERSOUND			20	".Roll" }
	{ event AE_CL_PLAYCHARACTERSOUND			33	".Roll_FX" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 20 "player_dash_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 20 "player_dash_dust follow_attachment rfoot" }	
}

$sequence b_shuffle_forward "anim_b_shuffle_forward" frames 6 23 {
	Y
	fps 38
	fadeout 0.1
	snap
	ACT_BB_B_SHUFFLE_FORWARD 1
	walkframe 1		LX
	walkframe 6		LX
	walkframe 15	LX
	walkframe 17	LX
	//{ event AE_CL_PLAYCHARACTERSOUND			0	".Roll" }	
	{ event AE_CL_PLAYMOVESOUND 0 "Player_Shared.Shuffle" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_shuffle follow_origin" }		
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 6 "player_dash_dust follow_attachment lfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 6 "player_dash_dust follow_attachment rfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 18 "player_dash_dust follow_attachment lfoot" }	
	//{ event AE_CL_CREATE_PARTICLE_EFFECT 18 "player_dash_dust follow_attachment rfoot" }	
}

$sequence b_shuffle_back "anim_b_shuffle_back" frames 5 23 {
	Y
	fps 38
	fadeout 0.1
	snap
	ACT_BB_B_SHUFFLE_BACK 1
	walkframe 1		LX
	walkframe 7		LX
	walkframe 15	LX
	walkframe 17	LX
	{ event AE_CL_PLAYMOVESOUND 0 "Player_Shared.Shuffle" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_shuffle follow_origin" }		
}

$sequence b_shuffle_left "anim_b_shuffle_left" frames 5 23 {
	X
	fps 38
	fadeout 0.1
	snap	
	ACT_BB_B_SHUFFLE_LEFT 1
	walkframe 1		LY
	walkframe 5		LY
	walkframe 7		LY
	walkframe 11	LY
	walkframe 15	LY
	walkframe 17	LY
	{ event AE_CL_PLAYMOVESOUND 0 "Player_Shared.Shuffle" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_shuffle follow_origin" }		
	//{ event AE_CL_PLAYCHARACTERSOUND			5	".Roll" }	
}

$sequence b_shuffle_right "anim_b_shuffle_right" frames 5 23 {
	X
	fps 38
	fadeout 0.1
	snap
	ACT_BB_B_SHUFFLE_RIGHT 1
	walkframe 1		LY
	walkframe 6		LY
	walkframe 15	LY
	walkframe 17	LY
	{ event AE_CL_PLAYMOVESOUND 0 "Player_Shared.Shuffle" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_shuffle follow_origin" }		
	//{ event AE_CL_PLAYCHARACTERSOUND			0	".Roll" }		
}




//  taunts and bows

$sequence flourish_bow_basic "anim_bow4" {
	ACT_BB_BOW1 1 	
	fps 25
	frames 0 40
	fadeout 1.0
	//{ event AE_CL_PLAYSOUND						1	"Weapon_Blade.Whistle" }		
	{ event AE_CL_PLAYSOUND						5	"Weapon_Blade.Whistle" }		
}

$sequence flourish_balanced "anim_b_flourish" {
	ACT_BB_B_FLOURISH 1 
	alignto b_idle	
	fps 65	
	{ event AE_CL_PLAYSOUND			0	"Weapon_Blade.Whistle"}	
	{ event AE_CL_PLAYSOUND			10	"Weapon_Blade.Whistle"}	
	{ event AE_CL_PLAYSOUND			30	"Weapon_Blade.Whistle"}	
}

$sequence flourish_heavy "anim_h_flourish" {
	ACT_BB_H_FLOURISH 1 
	alignto h_idle	
	fps 25	
	{ event AE_CL_PLAYSOUND			5	"Weapon_Blade.Whistle"}	
	{ event AE_CL_PLAYSOUND			10	"Weapon_Blade.Whistle"}			
}

$sequence flourish_reverse "anim_r_flourish" {
	ACT_BB_R_FLOURISH 1 
	alignto r_idle	
	fps 40	
	{ event AE_CL_PLAYSOUND			0	"Weapon_Blade.Whistle"}	
	{ event AE_CL_PLAYSOUND			7	"Weapon_Blade.Whistle"}		
}

$sequence taunt_reverse  "anim_r_taunt" {
	ACT_BB_R_TAUNT 1 
	frames 0 140
	alignto idle_lower
	fps 60		
	fadeout 0.4	
}

$sequence taunt_balanced  "anim_b_taunt" {
	ACT_BB_B_TAUNT 1 
	frames 0 101
	alignto b_idle	
	fps 70			
	fadeout 0.4
}

$sequence taunt_heavy  "anim_h_taunt" {
	ACT_BB_H_TAUNT 1 
	frames 0 150
	alignto h_idle	
	fps 70	
	fadeout 0.4		
}

$sequence h_jump "anim_jump"{
	ACT_BB_H_JUMP 1
	frames 0 84
	alignto h_idle	
	fps 60	
	fadeout 0.4	
}

$sequence jump {
	anim_jump
	ACT_BB_JUMP 1
	frames 0 94
	alignto h_idle	
	X Y Z
	fps 80	
}

$sequence balanced_jump {
	anim_balanced_jump
	ACT_BB_BALANCED_JUMP 1
	frames 0 94
	alignto b_idle	
	X Y Z
	fps 70	
}

$sequence jump_legs {
	anim_jump
	ACT_BB_JUMP_LEGS 1	
	alignto h_idle	
	frames 70 70
	weightlist LowerbodyReplace
	fps 80	
}

$animation a_jump_land_zero anim_balanced_land frames 0 0

$sequence jump_land {
	anim_balanced_land
	subtract a_jump_land_zero 0
	iklock lfoot 1 0
	iklock rfoot 1 0
	delta
	ACT_BB_JUMP_LAND 1	
	alignto b_idle	
	fps 70	
}



/*
//$sequence flourish_bow_lower "anim_bow_lower" ACT_BB_BOW1 1 fps 80
$sequence flourish_bow_alt "anim_bow_alt" ACT_BB_BOW2 1 fps 24

$sequence flourish_taunt_beckon "anim_taunt_beckon" ACT_BB_TAUNT1 1 fps 70
$sequence flourish_taunt_relax "anim_taunt_relax" ACT_BB_TAUNT1 1 fps 50
$sequence flourish_taunt_kneel "anim_taunt_kneel" ACT_BB_TAUNT2 1 fps 24
*/


//	sheathing
$sequence sheathing "anim_sheathing" {
	ACT_BB_SHEATHING 1 
	fps 110
	{ event AE_CL_PLAYSOUND	20	"Player_Shared.Sheathing_Slide" }	
	{ event AE_CL_PLAYSOUND	70	"Player_Shared.Sheathing_Slam" }	
}

//	unsheathing
$sequence unsheathing "anim_unsheathing" {
	ACT_BB_UNSHEATHING 1 
	fps 200
	{ event AE_CL_PLAYSOUND	50	"Player_Shared.Unsheathe_Draw" }	
	{ event AE_CL_CREATE_SWORD_EFFECT 40 "tracer_effect follow_attachment anim_attachment_S" }	
}


$sequence wallflip_back "anim_wallflip_back" {
	alignto b_idle
	frames 0 60
	fps 40
	ACT_BB_WALLFLIP_BACK 1
	walkframe 7		LX LY
	walkframe 20	LX LY
	walkframe 23	LX LY
	walkframe 26	LX LY
	walkframe 28	LX LY
	walkframe 30	LX LY
	walkframe 32	LX LY
	walkframe 38	LX LY
	walkframe 48	LX LY
	walkframe 58	LX LY
	walkframe 59	LX LY
	
	{ event 7001 0 "lfoot" }
	{ event 7001 6 "rfoot" }	
	{ event 7001 12 "lfoot" }	
	{ event 7001 45 "rfoot" }		
	{ event 7001 50 "lfoot" }
	{ event AE_CL_PLAYCHARACTERSOUND			10	".B_Attack" }
	{ event AE_CL_PLAYMOVESOUND 10 "Player_Shared.Shuffle_Slow" }	
	{ event AE_CL_PLAYSOUND 0 "Player_Shared.WallRun" }
	{ event AE_CL_PLAYSOUND 9 "Player_Shared.WallRun" }
	{ event AE_CL_PLAYSOUND 15 "Player_Shared.WallRun" }
	{ event AE_CL_PLAYSOUND 45 "Player_Shared.WallRun_Land" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 6 "player_dash_dust follow_attachment rfoot" }		
	{ event AE_CL_CREATE_PARTICLE_EFFECT 12 "player_dash_dust follow_attachment lfoot" }	
	{ event AE_CL_CREATE_PARTICLE_EFFECT 45 "player_dash_dust follow_attachment rfoot" }		
	{ event AE_CL_CREATE_PARTICLE_EFFECT 50 "player_dash_dust follow_attachment lfoot" }	
}



$include berimbau_attacks.qci