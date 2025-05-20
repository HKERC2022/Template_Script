moving_target_action = {
// this should be a local command
  private _computer = param [0,objnull,[objnull]];
  private _computerName = vehicleVarName  _computer;
  // for reset range
  _range = _computerName select [0, _computerName find "Computer"];  // RangeX 
  private _actionId = _computer addaction ["<t color='#00ff00'>Target Moving: Moving</t>", {[vehiclevarname (_this select 0)] call moving_target_switch },nil,1,false,false];
  while {true} do {
    waitUntil {!(missionNamespace GetVariable [_range+"Moving",true])};
    _computer setUserActionText [_actionId,"<t color = '#ff0000'>Target Moving: Stoped</t>"];
    waitUntil {(missionNamespace GetVariable [_range+"Moving",false])};
    _computer setUserActionText [_actionId,"<t color='#00ff00'>Target Moving: Moving</t>"];
  };
};


moving_target_switch = {
  private _computerName = param [0,"",[""]];
  _range = _computerName select [0, _computerName find "Computer"];  // RangeX 
  _range_occupy = _range + "Occupied";
  if (!(missionNamespace getVariable [_range_occupy,false])) then { 
    if (missionNamespace GetVariable [_range+"Moving",true]) then {
      //stop moving
      missionNamespace SetVariable [_range+"Moving",false,true];
      [_range] remoteExec ["FR_StopMovingTarget",2];
    } else {
      if (!(missionNamespace GetVariable [_range+"Moving",false])) then {
      //start moving
        missionNamespace SetVariable [_range+"Moving",true,true];
        [_range] remoteExec ["FR_StartMovingTarget",2];
      };
    };
  };
};

