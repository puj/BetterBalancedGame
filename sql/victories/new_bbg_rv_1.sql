------------------------------------------------------------------------------
--	FILE:	 new_bbg_rv_1.sql
--	AUTHOR:  iElden, D. / Jack The Narrator
--	PURPOSE: Database modifications by new BBG
------------------------------------------------------------------------------
--==============================================================================================
--******				RV: FAST SETTINGS 	 			 ******
--==============================================================================================

UPDATE GlobalParameters SET Value='12' WHERE ResolutionType='RELIGION_SPREAD_ADJACENT_CITY_DISTANCE';