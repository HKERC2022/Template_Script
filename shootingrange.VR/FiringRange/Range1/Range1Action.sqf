Range1Computer spawn practice_mode_action;

Range1Computer addaction ["Reset Target", {missionNamespace setVariable ["Range1Occupied",false,true];["Range1"] remoteExec ["FR_Reset_Range",2]}];
Range1Computer addaction ["Time Attact (All)", {["Range1"] remoteExec ["TimeAttackAllTarget",2]}];
Range1Computer addaction ["Time Attack (Single)",{["Range1"] remoteExec ["TimeAttackSingleTarget",2]}];
