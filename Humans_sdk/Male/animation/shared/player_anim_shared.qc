//====================================================
//
//	Shared Animations
//
//====================================================


//	The name of the mdl we're going to export to
$modelname player/anim_shared.mdl

//	set variables for includes and sex
$definevariable SEX "male"
$definevariable ROOTINCLUDE "../../../"

//	Import all the bones we need to refer to
$include $ROOTINCLUDE$/$SEX$/berimbau_sharedbones.qci

//	Import ik rules and linking
$include $ROOTINCLUDE$/$SEX$/animation/ruleshierarchy.qci

// shared ik setup
$include $ROOTINCLUDE$/standardikchains.qci

//	Import body yaw pitch blenders
$include $ROOTINCLUDE$/body_poses_lean.qci

//	Import the shared weight lists
$include $ROOTINCLUDE$/shared_weightlists.qci


$include "shared_idle.qci"		
$include "shared_walks_runs.qci"
$include "shared_jump.qci"
$include "shared_hitreactions.qci"
$include "shared_hitreactions_upper.qci"
$include "shared_stumble.qci"
$include "shared_cm.qci"
$include "shared_attackerblockedreactions.qci"
$include "shared_parries.qci"
$include "shared_emotes.qci"
$include "shared_throws.qci"
$include "shared_deaths.qci"
$include "shared_knockdown.qci"
$include "shared_defense.qci"
$include "shared_mainmenu.qci"
$include "shared_landing.qci"
$include "shared_kick.qci"
$include "shared_throw_star.qci"
