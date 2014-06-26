//====================================================
//
//	Phalanx Animations
//
//====================================================


//	The name of the mdl we're going to export to
$modelname player/anim_phalanx.mdl

//	Import all the bones we need to refer to
$include "../../berimbau_sharedbones.qci"

//	Import ik rules and linking
$include "../ruleshierarchy.qci"

// shared ik setup
$include "../../../standardikchains.qci"

$pushd "../shared"
$include "../shared/shared_idle.qci"
$include "../shared/shared_walks_runs.qci"
$include "../shared/shared_hitreactions.qci"
$popd

$include "../../../shared_weightlists.qci"
$include "../../../attack_weightlists.qci"

//	Balanced Stance
$include "stance_balanced.qci"
$include "stance_reverse.qci"
$include "stance_heavy.qci"
$include "stance_air.qci"
$include "stance_sheathe.qci"


$sequence customize "anim_customize" loop FPS 30 activity ACT_BB_CUSTOMIZE 1