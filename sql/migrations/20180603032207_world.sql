DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180603032207');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180603032207');
-- Add your query below.


-- Conditions used by the script.
INSERT INTO `conditions` VALUES (121, 46, 0, 0, 0, 0, 1); -- Target is NOT alive.
INSERT INTO `conditions` VALUES (6300, 36, 5862, 0, 0, 0, 1); -- Map event not active.
INSERT INTO `conditions` VALUES (6301, 47, 5862, 121, 0, 0, 0); -- Map event targets all dead.
INSERT INTO `conditions` VALUES (6302, -2, 6300, 6301, 0, 0, 0); -- Map event not active OR Map event targets all dead.
INSERT INTO `conditions` VALUES (6303, 25, 3, 60, 0, 0, 0); -- Escort check source, target, distance.

-- Scarlet Cavaliers.
DELETE FROM `creature_ai_events` WHERE `creature_id`=1836;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (183601, 1836, 0, 2, 0, 100, 0, 15, 1, 0, 0, 183601, 0, 0, 'Scarlet Cavalier - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (183602, 1836, 0, 31, 0, 100, 0, 5862, 1, 0, 0, 183602, 0, 0, 'Scarlet Cavalier - Start Attacking Taelan on Received Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=183601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (183601, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Flee');
DELETE FROM `creature_ai_scripts` WHERE `id`=183602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (183602, 0, 26, 0, 0, 0, 0, 5862, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Start Attacking Taelan');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (183602, 0, 15, 18812, 2, 0, 0, 5862, 0, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Taelan Fordring - Cast Knockdown on Scarlet Cavalier');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (18360, 'Western Plaguelands - Scarlet Cavalier', 15284, 100, 1, 0, 0, 0, 15, 20, 12, 15, 0, 16856, 100, 1, 0, 0, 0, 10, 15, 7, 15, 0, 6253, 100, 1, 0, 0, 0, 10, 15, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spells_template`=18360, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=1836;

-- Highlord Taelan Fordring
DELETE FROM `creature_ai_events` WHERE `creature_id`=1842;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (184201, 1842, 0, 1, 1, 100, 0, 120000, 120000, 0, 0, 184201, 0, 0, 'Highlord Taelan Fordring - Reset Faction if In Dreams not started within 2 minutes');
DELETE FROM `creature_ai_scripts` WHERE `id`=184201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (184201, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Taelan Fordring - Reset Faction');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (18420, 'Western Plaguelands - Highlord Taelan Fordring', 14518, 100, 1, 0, 0, 0, 7, 9, 7, 9, 0, 18819, 100, 1, 0, 0, 0, 5, 10, 5, 10, 0, 633, 100, 15, 0, 80, 0, 5, 10, 3600, 3600, 0, 15493, 100, 15, 0, 80, 0, 6, 8, 5, 10, 0, 17232, 100, 0, 0, 0, 32, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spells_template`=18420, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=1842;

-- Escort waypoints for quest In Dreams.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 0, 2942.58, -1390.09, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 1, 2932.78, -1410.25, 165.944, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 2, 2916.99, -1402.3, 165.943, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 3, 2924.7, -1385.35, 160.842, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 4, 2946.74, -1396.5, 160.842, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 5, 2953.64, -1382.87, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 6, 2943.68, -1377.89, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 7, 2935.46, -1392.21, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 8, 2919.78, -1384.81, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 9, 2914.8, -1395.94, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 10, 2933.86, -1405.78, 150.522, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 11, 2914.82, -1440.87, 150.53, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 12, 2912.2, -1456.48, 147.838, 15000, 184212, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 13, 2912.93, -1479.4, 146.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 14, 2900.28, -1498.01, 146.37, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 15, 2865.91, -1500.93, 146.68, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 16, 2844.72, -1487.04, 146.42, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 17, 2819.31, -1491.86, 145.81, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 18, 2792.61, -1520.39, 144.55, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 19, 2757.79, -1569.68, 131.52, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 20, 2769.52, -1596.14, 129.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 21, 2778.17, -1613.23, 129.02, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 22, 2757.44, -1639.58, 128.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 23, 2716.17, -1696.23, 126.19, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 24, 2690.42, -1732.32, 116.56, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 25, 2691.29, -1775.22, 101.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 26, 2693.15, -1807.26, 86.69, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 27, 2703.28, -1829.88, 76.36, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 28, 2696.32, -1860.54, 67.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 29, 2688.9, -1882.01, 66.37, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 30, 2672.41, -1902.02, 65.57, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES (1842, 31, 2672.41, -1902.02, 65.57, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0);

-- Waypoint scripts.
DELETE FROM `creature_movement_scripts` WHERE `id`=184212;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (184212, 2, 35, 0, 0, 0, 0, 5944, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Face Escort Player');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (184212, 2, 0, 0, 0, 0, 0, 5944, 0, 21, 0, 7315, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (184212, 6, 0, 0, 0, 0, 0, 5944, 0, 21, 0, 7316, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Say Emote Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (184212, 6, 1, 22, 0, 0, 0, 5944, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Emote Shout');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (184212, 10, 24, 2402, 1, 0, 0, 5944, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Mount');

-- Emotes when turning in quest Scarlet Subterfuge.
UPDATE `quest_template` SET `CompleteEmote`=25, `OfferRewardEmote1`=6, `CompleteScript`=5862 WHERE `entry`=5862;

-- Emotes for texts used by the Scarler Cavaliers.
UPDATE `broadcast_text` SET `EmoteId0`=6 WHERE `ID`=7319;
UPDATE `broadcast_text` SET `EmoteId0`=5 WHERE `ID`=7320;
UPDATE `broadcast_text` SET `EmoteId0`=6 WHERE `ID`=7321;
UPDATE `broadcast_text` SET `EmoteId0`=6 WHERE `ID`=7322;
UPDATE `broadcast_text` SET `EmoteId0`=6 WHERE `ID`=7323;

-- Scripts for the Scarler Cavaliers called after Scarlet Subterfuge is turned in.
DELETE FROM `event_scripts` WHERE `id`=48188;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48188, 0, 35, 0, 0, 0, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Turn to Highlord Taelan Fordring');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7319, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48188, 2, 63, 5862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Add Self to Scarlet Subterfuge Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48188, 3, 3, 2, 2000, 2, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 1.5, 0, 0, -1, 0, 'Scarlet Cavalier - Move to Highlord Taelan Fordring');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48188, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7320, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Say Text 2');
DELETE FROM `event_scripts` WHERE `id`=48190;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48190, 0, 35, 0, 0, 0, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Turn to Highlord Taelan Fordring');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7321, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48190, 2, 63, 5862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Add Self to Scarlet Subterfuge Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48190, 3, 3, 2, 2000, 2, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 1.5, 0, 0, -1, 0, 'Scarlet Cavalier - Move to Highlord Taelan Fordring');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48190, 5, 28, 8, 0, 0, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Kneel');
DELETE FROM `event_scripts` WHERE `id`=52005;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (52005, 0, 35, 0, 0, 0, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Turn to Highlord Taelan Fordring');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (52005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7322, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (52005, 2, 63, 5862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Add Self to Scarlet Subterfuge Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (52005, 3, 3, 2, 2000, 2, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 1.5, 0, 0, -1, 0, 'Scarlet Cavalier - Move to Highlord Taelan Fordring');
DELETE FROM `event_scripts` WHERE `id`=49594;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (49594, 0, 35, 0, 0, 0, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Turn to Highlord Taelan Fordring');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (49594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7323, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (49594, 2, 63, 5862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Cavalier - Add Self to Scarlet Subterfuge Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (49594, 3, 3, 2, 2000, 2, 0, 1842, 20, 8, 0, 0, 0, 0, 0, 1.5, 0, 0, -1, 0, 'Scarlet Cavalier - Move to Highlord Taelan Fordring');

-- Texts used by Taelan Fordring.
UPDATE `broadcast_text` SET `Type`=1, `EmoteId0`=15 WHERE `ID`=7318;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=7315;

-- Knockdown 18812
-- Turn in script for quest Scarlet Subterfuge.
DELETE FROM `quest_end_scripts` WHERE `id`=5862;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 0, 39, 48190, 0, 0, 0, 48190, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 118, 'Scarlet Subterfuge: Start Script on Scarlet Cavalier 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 0, 39, 48188, 0, 0, 0, 48188, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 118, 'Scarlet Subterfuge: Start Script on Scarlet Cavalier 2');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 0, 39, 49594, 0, 0, 0, 49594, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 118, 'Scarlet Subterfuge: Start Script on Scarlet Cavalier 3');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 0, 39, 52005, 0, 0, 0, 52005, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 118, 'Scarlet Subterfuge: Start Script on Scarlet Cavalier 4');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 0, 61, 5862, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Start Map Event');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring - Remove Quest Giver Flag');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 1, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring -  Kneel');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 13, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring - Stand Up');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7318, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring - Say Text 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 13, 22, 290, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring - Change Faction');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 13, 15, 18810, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring - Cast Taelan\'s Suffering');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 13, 66, 5862, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Send Map Event to Scarlet Cavaliers');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 13, 69, 5862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6302, 5862, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Set Condition for Map Event');

-- Script when event after turning in Scarlet Subterfuge is completed.
DELETE FROM `event_scripts` WHERE `id`=5862;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring - Add Quest Giver Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5862, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Subterfuge: Highlord Taelan Fordring - Set Phase to 1');

-- Start script for quest In Dreams.
DELETE FROM `quest_start_scripts` WHERE `id`=5944;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5944, 0, 61, 5944, 1200, 0, 0, 0, 0, 0, 0, 0, 0, 33, 5944, 0, 0, 0, 0, 0, 'In Dreams: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5944, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1842, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5944, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Highlord Taelan Fordring - Set Phase to 2');

-- Script when In Dreams fails.
DELETE FROM `event_scripts` WHERE `id`=5944;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams Failed: Fail Quest In Dreams MISSING CMD');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams Failed: Highlord Taelan Fordring - Respawn MISSING CMD');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
