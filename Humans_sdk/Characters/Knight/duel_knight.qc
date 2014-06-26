/*
==============================================================================

duel_knight

==============================================================================
*/


$modelname "player/characters/knight/knight.mdl"
$cdmaterials "models\knight"
$model duel_knight "duel_knight.smd" {
	//	source-req'd flex controllers
	$include "../../bodyrules_xsi.qci"
}

$sequence idle duel_knight_idle.smd

$eyeposition 0 0 70

$texturegroup skinfamilies
{
	{ "knight" "knight" }
	{ "knight2" "knight_w" }
	{ "knight3" "whiteknight" }
	{ "knight4" "riotcop" }
}

$surfaceprop "flesh"
$bbox -13 -13 0  13 13 72
$mostlyopaque

$include "../../character_extras.qci"
$include "../../male/extras_male.qci"
$include "knight_extras.qci"

$include "../../Male/animation/ruleshierarchy.qci"
$include "../../Male/animation/hitbox.qci"

$includemodel player/anim_shared.mdl
$includemodel player/anim_judgement.mdl

$pushd "../../Male/"
$include "../../Male/ragdoll.qci"
$popd
