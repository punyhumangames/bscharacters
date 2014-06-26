//====================================================
//
//	Female Shared Animations
//
//====================================================


//	The name of the mdl we're going to export to
$modelname player/female_anim_shared.mdl

//	set variables for includes and sex
$definevariable SEX "female"
$definevariable ROOTINCLUDE "../../../"

//	Import all the bones we need to refer to
$include $ROOTINCLUDE$/$SEX$/berimbau_sharedbones.qci

//	Import ik rules and linking
$include $ROOTINCLUDE$/$SEX$/animation/ruleshierarchy.qci

// shared ik setup
$include $ROOTINCLUDE$/fstandardikchains.qci

//	Import body yaw pitch blenders
$include $ROOTINCLUDE$/body_poses_lean.qci

//	Import the shared weight lists
$include $ROOTINCLUDE$/shared_weightlists.qci

$definevariable REFSEX "male"
$definevariable ANIMSHARED "/animation/shared"

$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_idle.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_walks_runs.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_jump.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_hitreactions.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_hitreactions_upper.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_stumble.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_throws.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_parries.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_knockdown.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_throw_star.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_defense.qci
$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_cm.qci

//$include $ROOTINCLUDE$$REFSEX$$ANIMSHARED$/shared_emotes.qci

$sequence flourish_bow_basic "anim_bow4" {
	ACT_BB_BOW1 1
	fps 25
	//alignto reference
	frames 0 30
	fadeout 1.0
	{ event AE_CL_PLAYSOUND						5	"Weapon_Blade.Whistle" }
}

$sequence hack_delete_me anim_b_hack_delete_me

$sequence kiss  "anim_kiss" {
	ACT_BB_B_FLOURISH 1
	alignto hack_delete_me
	fps 20
	{ event AE_CL_CREATE_PARTICLE_EFFECT 	13 	"ber_event_valentine_kiss follow_attachment mouth" }
	{ event AE_CL_PLAYSOUND					5	"events.valentine2" }
}

/*
$sequence taunt_reverse  "anim_r_taunt" {
	ACT_BB_R_TAUNT 1
	frames 0 140
	alignto reference
	fps 60
	fadeout 0.4
}

$sequence taunt_balanced  "anim_b_taunt" {
	ACT_BB_B_TAUNT 1
	frames 0 101
	alignto reference
	fps 70
	fadeout 0.4
}

$sequence taunt_heavy  "anim_h_taunt" {
	ACT_BB_H_TAUNT 1
	frames 0 150
	alignto reference
	fps 70
	fadeout 0.4
}
*/

//-----------------
//	Sit Anims
//-----------------

$sequence sit_down  "anim_sit_down" {
	ACT_BB_SIT_DOWN 1
	alignto reference
	LX LY
	fps 40
}

$sequence sit_idle  "anim_sit_idle" {
	ACT_BB_SIT_IDLE 1
	alignto reference
	fps 20
}

$sequence sit_up  "anim_sit_up" {
	ACT_BB_SIT_UP 1
	alignto reference
	LX LY
	fps 40
}


//-----------------
//	Landing Partials
//-----------------

$sequence landing_left "anim_landing_left" {
	ACT_BB_LAND_LEFT 1
	fps 18
	weightlist AttackLandBlend
	{ event AE_SCREEN_SHAKE						0	"0.1 1.0 20.0" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_slide_dust follow_attachment lfoot" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_slide_dust follow_attachment rfoot" }
	{ event AE_CL_PLAYSOUND 0 "Player_Shared.Attack_Land" }
}

$sequence landing_right "anim_landing_right" {
	ACT_BB_LAND_RIGHT 1
	fps 18
	weightlist AttackLandBlend
	{ event AE_SCREEN_SHAKE						0	"0.1 1.0 20.0" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_slide_dust follow_attachment lfoot" }
	{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "player_slide_dust follow_attachment rfoot" }
	{ event AE_CL_PLAYSOUND 0 "Player_Shared.Attack_Land" }
}

//-----------------
//	Spray (part of unfinished emotes qci)
//-----------------

$sequence spray  "anim_spray03" {
	ACT_BB_SPRAY 1
	frames 0 36
	alignto reference
	fps 30
}