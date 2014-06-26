/*
==============================================================================

duel_knight

==============================================================================
*/


$modelname "player/characters/knight/knight.mdl"
$cdmaterials "models\knight"
$sequence idle duel_knight_idle.smd

//start eye/face data
$eyeposition 0 0 70

// head controllers
$attachment "eyes" "ValveBiped.Bip01_Head1" -0.0454 -3.2682 67.3843 absolute
$attachment "mouth" "ValveBiped.Bip01_Head1" 0.80 -5.50 0.10 rotate 0 -80 -90
$attachment "chest" "ValveBiped.Bip01_Spine2" 5.00 4.00 0.00 rotate 0 90 90

//Jigglebones

$jigglebone "j1" //upper-back hair
{  
	is_flexible
	{
		yaw_stiffness 800
		yaw_damping 15
		length 10
		yaw_constraint -15 30
		pitch_stiffness 200
		pitch_damping 21
		pitch_constraint -10 10
		angle_constraint 30
		tip_mass 12000
	}

}
$jigglebone "j2" //lower-back hair
{
	is_flexible
	{
		yaw_stiffness 800
		yaw_damping 15
		length 10
		yaw_constraint -15 30
		pitch_stiffness 200
		pitch_damping 21
		pitch_constraint -10 10
		angle_constraint 30
		tip_mass 12000 
	}


}
$jigglebone "j3b" //hair braid
{
	is_flexible
	{
		yaw_stiffness 200
		yaw_damping 6
		length 20
		yaw_constraint -35 90
		pitch_stiffness 200
		pitch_damping 6
		pitch_constraint -10 90
		tip_mass 6500
	}
}
$jigglebone "j4b" //hair braid
{
	is_flexible
	{
		yaw_stiffness 200
		yaw_damping 6
		length 20
		yaw_constraint -35 90
		pitch_stiffness 200
		pitch_damping 6
		pitch_constraint -90 10
		tip_mass 6500 
	}
}
$jigglebone "j5" //hanging armor
{
	is_rigid
	{
		length 20
		pitch_constraint 0 0
		yaw_constraint -1 15
		angle_constraint 15
		tip_mass 12000 
	}
}

$model duel_knight "duel_knight_j.smd"{

	$include "../../bodyrules_xsi.qci"
}

$texturegroup skinfamilies
{
	{ "knight" "knight" }
	{ "knight2" "knight_w" }
	{ "knight3" "whiteknight" }
}

$surfaceprop "flesh"
$bbox -13 -13 0  13 13 72
$mostlyopaque

$unlockdefinebones

$include "../../Male/berimbau_sharedbones.qci"


$include "../../Male/animation/ruleshierarchy.qci"
$include "../../Male/animation/berimbau_attachments.qci"
$include "../../Male/animation/hitbox.qci"

$includemodel player/anim_shared.mdl
$includemodel player/anim_judgement.mdl

$pushd "../../Male/"
$include "../../Male/ragdoll.qci"
$popd
