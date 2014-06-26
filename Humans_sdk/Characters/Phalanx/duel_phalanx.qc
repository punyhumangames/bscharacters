/*
==============================================================================

duel_phalanx

==============================================================================
*/


$modelname "player\characters\phalanx\phalanx.mdl"
$cdmaterials "models\phalanx"
$model duel_phalanx "duel_phalanx.smd" {
	//	source-req'd flex controllers
	$include "../../bodyrules_xsi.qci"
}

$sequence idle duel_phalanx_idle.smd

$eyeposition 0 0 70

$texturegroup skinfamilies
{
	{ "phalanx" }
	{ "dragoon" }
	{ "cavalier" }
}

$surfaceprop "flesh"
$bbox -13 -13 0  13 13 72
$mostlyopaque

$include "../../character_extras.qci"
$include "../../male/extras_male.qci"
$include "phalanx_extras.qci"

$include "../../Male/animation/ruleshierarchy.qci"
$include "../../Male/animation/hitbox.qci"

$includemodel player/anim_shared.mdl
$includemodel player/anim_phalanx.mdl

$pushd "../../Male"
$include "../../Male/ragdoll.qci"
$popd

