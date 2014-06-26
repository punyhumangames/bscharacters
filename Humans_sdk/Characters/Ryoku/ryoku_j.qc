/*
==============================================================================

ryoku

==============================================================================
*/


$modelname "player/characters/ryoku/ryoku.mdl"
$sequence idle ryoku_idle.smd

//start eye/face data
$eyeposition 0 0 70

// head controllers
$attachment "eyes" "ValveBiped.Bip01_Head1" -0.0454 -3.2682 67.3843 absolute
$attachment "mouth" "ValveBiped.Bip01_Head1" 0.80 -5.50 0.10 rotate 0 -80 -90
$attachment "chest" "ValveBiped.Bip01_Spine2" 5.00 4.00 0.00 rotate 0 90 90

//Jigglebones
$jigglebone "j_1a"
{
	is_flexible
	{
		yaw_stiffness 200
		yaw_damping 6
		length 20
		pitch_stiffness 200
		pitch_damping 6
		angle_constraint 80
		tip_mass 6500
		pitch_constraint 0 80
	}
}
$jigglebone "j_2a"
{
	is_flexible
	{
		yaw_stiffness 200
		yaw_damping 6
		length 20
		pitch_stiffness 200
		pitch_damping 6
		angle_constraint 80
		tip_mass 6500
		pitch_constraint 0 80
	}
}
$jigglebone "j_3a"
{
	is_flexible
	{
		yaw_stiffness 200
		yaw_damping 6
		length 20
		pitch_stiffness 200
		pitch_damping 6
		angle_constraint 80
		tip_mass 6500
		pitch_constraint 0 80
	}
}

$model ryoku "ryoku_j.smd"{
	$include "../../bodyrules_xsi.qci"
}

$texturegroup skinfamilies
{
	{ "ryoku" "ryoku" }
	{ "ryoku2" "ryoku2" }
	{ "ryoku3" "ryokuRedBlack" }
}

$surfaceprop "flesh"
$bbox -13 -13 0  13 13 72
$mostlyopaque
$unlockdefinebones

$include "../../Male/animation/berimbau_attachments.qci"

$include "../../Male/berimbau_sharedbones.qci"

$includemodel player/anim_shared.mdl

$includemodel player/anim_ryoku.mdl

$include "../../Male/animation/ruleshierarchy.qci"

$include "../../Male/animation/hitbox.qci"


$pushd "../../Male/"
$include "../../Male/ragdoll.qci"
$popd
$cdmaterials "models\ryoku"