/*
==============================================================================

pure

==============================================================================
*/


$modelname "player\characters\Pure\pure.mdl"
$cdmaterials "models\pure"
$model pure "pure.smd" {
	//	source-req'd flex controllers
	$include "../../bodyrules_xsi.qci"
}

$sequence idle pure_idle.smd

$eyeposition 0 0 70

$texturegroup skinfamilies
{
	{ "pure_extra" }
	{ "crow" }
	{ "pure_extra02" }
}

$surfaceprop "flesh"
$bbox -13 -13 0  13 13 72
$mostlyopaque

$include "../../character_extras.qci"
$include "../../female/extras_female.qci"
$include "pure_extras.qci"


$include "../../Female/animation/ruleshierarchy.qci"
$include "../../Male/animation/hitbox.qci"

$pushd "../../Female"
$include "../../Female/ragdoll.qci"
$popd

$includemodel player/female_anim_shared.mdl
$includemodel player/anim_pure.mdl
