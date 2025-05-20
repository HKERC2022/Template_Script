
practice_mode_action = {
// this should be a local command
  private _computer = param [0,objnull,[objnull]];
  private _computerName = vehicleVarName  _computer;
  // for reset range
  _range = _computerName select [0, _computerName find "Computer"];  // RangeX 
  private _actionId = _computer addaction ["<t color='#0000ff'>Practice Mode: On</t>", {[vehicleVarname (_this select 0)] call practice_mode_switch},nil,6,false,false];
  while {true} do {
    waitUntil {!(missionNamespace GetVariable ["PracticeMode"+_range,true])};
    _computer setUserActionText [_actionId,"<t color = '#ff0000'>Practice Mode: Off</t>"];
    waitUntil {(missionNamespace GetVariable ["PracticeMode"+_range,false])};
    _computer setUserActionText [_actionId,"<t color = '#0000ff'>Practice Mode: On</t>"];
  };
};

practice_mode_switch = {
  private _computerName = param [0,"",[""]];
  _range = _computerName select [0, _computerName find "Computer"];  // RangeX 
  _range_occupy = _range + "Occupied";
  if (!(missionNamespace getVariable [_range_occupy,false])) then { 
    if (missionNamespace GetVariable ["PracticeMode"+_range,true]) then {
      missionNamespace SetVariable ["PracticeMode"+_range,false,true];
			[_range] remoteExec ["FR_Reset_Range_FaceDown",2];
    } else {
      if (!(missionNamespace GetVariable ["PracticeMode"+_range,false])) then {
        missionNamespace SetVariable ["PracticeMode"+_range,true,true];
				[_range] remoteExec ["FR_Reset_Range",2];
      };
    };
  };
};
