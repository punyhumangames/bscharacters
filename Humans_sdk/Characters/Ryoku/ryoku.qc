/*
==============================================================================

ryoku

==============================================================================
*/


$modelname "player/characters/ryoku/ryoku.mdl"
$cdmaterials "models\ryoku"
$model ryoku "ryoku.smd" {
	//	source-req'd flex controllers
	$include "../../bodyrules_xsi.qci"
}

$sequence idle ryoku_idle.smd

$eyeposition 0 0 70

$texturegroup skinfamilies
{
	{ "ryoku" "ryoku" "ryoku_extra" }
	{ "ryoku2" "ryoku2" "ryoku_extra2" }
	{ "ryoku3" "ryokuRedBlack" "ryoku_extra2" }
}

$surfaceprop "flesh"
$bbox -13 -13 0  13 13 72
$mostlyopaque

$include "../../character_extras.qci"
$include "../../male/extras_male.qci"
$include "ryoku_extras.qci"

$include "../../Male/animation/ruleshierarchy.qci"
$include "../../Male/animation/hitbox.qci"

$includemodel player/anim_shared.mdl
$includemodel player/anim_ryoku.mdl

$pushd "../../Male/"
$include "../../Male/ragdoll.qci"
$popd