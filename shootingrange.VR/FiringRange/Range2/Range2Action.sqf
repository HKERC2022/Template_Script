Range2Computer spawn practice_mode_action;

Range2Computer addaction ["Reset Target", {missionNamespace setVariable ["Range2Occupied",false,true];["Range2"] remoteExec ["FR_Reset_Range",2]}];
Range2Computer spawn moving_target_action;
Range2Computer addaction ["Time Attact (All)", {["Range2"] remoteExec ["TimeAttackAllTarget",2]}];
Range2Computer addaction ["Random Target (60s)", {["Range2",60] remoteExec ["RandomPop60",2]}];


