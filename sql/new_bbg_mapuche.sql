------------------------------------------------------------------------------
--	FILE:	 new_bbg_mapuche.sql
--	AUTHOR:  iElden, D. / Jack The Narrator
--	PURPOSE: Database Civilization related modifications by new BBG
------------------------------------------------------------------------------
--==============================================================================================
--******									MAPUCHE									   ******
--==============================================================================================
-- Delete Base Initial Requirement
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_CIVILIZATION_MAPUCHE_TOQUI' AND ModifierId='TRAIT_TOQUI_COMBAT_BONUS_VS_GOLDEN_AGE_CIV';

INSERT OR IGNORE INTO Requirements
	(RequirementId , RequirementType)
	VALUES
	('REQUIRES_OPPONENT_IS_GOLDEN_AGE_REQUIREMENTS' , 		'REQUIREMENT_REQUIREMENTSET_IS_MET');	
	
INSERT OR IGNORE INTO RequirementArguments
	(RequirementId , Name, Value)
	VALUES
	('REQUIRES_OPPONENT_IS_GOLDEN_AGE_REQUIREMENTS' , 		'RequirementSetId', 'OPPONENT_IS_IN_GOLDEN_AGE_REQUIREMENTS');	

INSERT OR IGNORE INTO RequirementSets
	(RequirementSetId , RequirementSetType)
	VALUES
	('MAPUCHE_TRAIT_REQUIREMENTS' , 		'REQUIREMENTSET_TEST_ALL');	
	
INSERT OR IGNORE INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
	VALUES
	('MAPUCHE_TRAIT_REQUIREMENTS' , 		'REQUIRES_OPPONENT_IS_GOLDEN_AGE_REQUIREMENTS');	
	
INSERT OR IGNORE INTO Modifiers
	(ModifierId , ModifierType, Permanent)
	VALUES
	('TRAIT_TOQUI_COMBAT_BONUS_ABILITY_VS_GOLDEN_AGE_CIV' ,'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 1);	
	
INSERT OR IGNORE INTO Modifiers
	(ModifierId , ModifierType, SubjectRequirementSetId)
	VALUES
	('MOD_ABILITY_MAPUCHE' ,'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'MAPUCHE_TRAIT_REQUIREMENTS');	
	
INSERT OR IGNORE INTO ModifierArguments
	(ModifierId , Name, Value, Extra,     SecondExtra)
	VALUES
	('TRAIT_TOQUI_COMBAT_BONUS_ABILITY_VS_GOLDEN_AGE_CIV' ,'AbilityType',	'ABILITY_TRAIT_MAPUCHE', NULL, NULL),
	('MOD_ABILITY_MAPUCHE' ,'Amount',	5, NULL, NULL);

INSERT OR IGNORE INTO Types
	(Type , Kind)
	VALUES
	('ABILITY_TRAIT_MAPUCHE' ,'KIND_ABILITY');	

INSERT OR IGNORE INTO TypeTags
	(Type , Tag)
	VALUES
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_RECON'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_MELEE'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_RANGED'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_SIEGE'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_HEAVY_CAVALRY'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_RANGED_CAVALRY'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_LIGHT_CAVALRY'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_ANTI_CAVALRY'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_HEAVY_CHARIOT'),	
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_LIGHT_CHARIOT'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_NAVAL_MELEE'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_NAVAL_RANGED'),
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_NAVAL_RAIDER'),		
	('ABILITY_TRAIT_MAPUCHE' ,'CLASS_AIRCRAFT');	

INSERT OR IGNORE INTO UnitAbilities
	(UnitAbilityType , Name, Description, Inactive)
	VALUES
	('ABILITY_TRAIT_MAPUCHE' ,'LOC_ABILITY_TRAIT_MAPUCHE_NAME', 'LOC_ABILITY_TRAIT_MAPUCHE_DESCRIPTION', 1);		

INSERT OR IGNORE INTO UnitAbilityModifiers
	(UnitAbilityType , ModifierId)
	VALUES
	('ABILITY_TRAIT_MAPUCHE' ,'MOD_ABILITY_MAPUCHE');	

INSERT OR IGNORE INTO TraitModifiers
	(TraitType, ModifierId)
	VALUES
	('TRAIT_CIVILIZATION_MAPUCHE_TOQUI' ,'TRAIT_TOQUI_COMBAT_BONUS_ABILITY_VS_GOLDEN_AGE_CIV');	