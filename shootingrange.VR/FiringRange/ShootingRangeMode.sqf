// This should be on server side
TimeAttackAllTarget = {
  private _range = param [0,"",[""]];
  private _targets =+ (missionNamespace getvariable [_range+"Targets",[]]);
  private _occupied_var = _range + "Occupied";
  // check occupy
  if (missionNamespace getVariable [_occupied_var,false]) exitWith { [format ["%1 is occupied",_range]] remoteExec ["systemchat"] };
  // prepare and reset
  [_range,3] call FiringRangeCountDown;
  // start
  {_x animate ["terc",0]} foreach _targets;
  _start_time = time;
  [[_start_time],"Timer",_range] remoteExec ["ERC_Timer",0,true]; //Change it to execute everyone  
  
  while {sleep 0.01;(count _targets > 0) && (missionNamespace getVariable [_occupied_var,false])} do {
    {
      if (_x getVariable ["Hitted",false]) then {
        _targets deleteAt _foreachindex;
      };
    } foreach _targets;

  };
  //finish
  [_range,!(missionNamespace getVariable [_occupied_var,false])] call FiringRangeTerminate;
};

TimeAttackSingleTarget = {
  private _range = param [0,"",[""]];
  private _targets =+ (missionNamespace getvariable [_range+"Targets",[]]);
  private _occupied_var = _range + "Occupied";
  // check occupy
  if (missionNamespace getVariable [_occupied_var,false]) exitWith { [format ["%1 is occupied",_range]] remoteExec ["systemchat"] };
  [_range,3] call FiringRangeCountDown;
  // start
  _start_time = time;
  [[_start_time],"Timer",_range] remoteExec ["ERC_Timer",0]; //Change it to execute everyone  
  // main loop 
  _targets = _targets call BIS_fnc_arrayShuffle;
  {
		if (!(missionNamespace getVariable [_occupied_var,false])) exitWith {};
		_x setVariable ["Hitted",false];
    _x animate ["terc",0];
    waituntil {_x getVariable ["Hitted",false] || !(missionNamespace getVariable [_occupied_var,false]);};
		
  } foreach _targets; 
  //finish
  [_range,!(missionNamespace getVariable [_occupied_var,false])] call FiringRangeTerminate;
};

RandomPop60 = {
  private _range = param [0,"",[""]];
	private _length = param [1,0,[0]];
  private _targets =+ (missionNamespace getvariable [_range+"Targets",[]]);
  private _occupied_var = _range + "Occupied";
  // check occupy
  if (missionNamespace getVariable [_occupied_var,false]) exitWith { [format ["%1 is occupied",_range]] remoteExec ["systemchat"] };
  missionNamespace setVariable [_occupied_var,true,true];
  missionNamespace SetVariable ["PracticeMode"+_range,false,true];
  [_range] call FR_Reset_Range_FaceDown;
  [_range,"Ready",false] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
	sleep 3;
  [_range,"Start!!",false] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
  // start
	_start_time = time;
  [[_start_time,_length],"CountDown",_range] remoteExec ["ERC_Timer",0]; //Change it to execute everyone  
	_score = 0;
	//generate first target
	_c_target = [0,count _targets - 1] call BIS_fnc_randomInt; 
	_target =	_targets select _c_target;
	_target setVariable ["Hitted",false];
	_target animate ["terc",0];
	while {sleep 0.01; (time - _start_time) <= _length && missionNamespace getVariable [_occupied_var,false]} do {
  // main loop
		if (_target getVariable ["Hitted",false]) then { 
			sleep 1;
			_target setVariable ["Hitted",false];
			_c_target = [0,count _targets - 1] call BIS_fnc_randomInt; 
			_target =	_targets select _c_target;
			_target setVariable ["Hitted",false];
			_score = _score + 1;
			_target animate ["terc",0];
		};
	};
  //finish
  [_range,!(missionNamespace getVariable [_occupied_var,false]),_score] call FiringRangeTerminate_Score;
};


FiringRangeCountDown = {
  private _range = param [0,"",[""]];
  private _countdown = param [1,3,[0]];
  private _occupied_var = _range + "Occupied";
  missionNamespace setVariable [_occupied_var,true,true];
  missionNamespace SetVariable ["PracticeMode"+_range,false,true];
  [_range,"Ready",false] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
	sleep 1;
  [_range] call FR_Reset_Range_FaceDown;
  // countdown 3 second
  [[time,_countdown],"CountDown",_range] remoteExec ["ERC_Timer",0]; //Change it to execute everyone  
  sleep 3; 
  [_range,"Start!!",false] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
  sleep 1;
};

FiringRangeTerminate = {
  private _range = param [0,"",[""]];
	private _terminate = param [1,true,[true]];
  private _occupied_var = _range + "Occupied";
  missionNamespace setVariable [_occupied_var,false,true];
  [_range] remoteExec ["StopTimer",0]; 
	if (_terminate) then {
		[_range, "Terminated" ,true] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
	} else {
		[_range, format ["%1 final time is: %2", _range,time - _start_time,endl],true] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
	};
};

FiringRangeTerminate_Score = {
  private _range = param [0,"",[""]];
	private _terminate = param [1,true,[true]];
	private _score = param [2,0,[0]];
  private _occupied_var = _range + "Occupied";
  missionNamespace setVariable [_occupied_var,false,true];
  [_range] remoteExec ["StopTimer",0]; 
	if (_terminate) then {
		[_range, "Terminated" ,true] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
	} else {
		[_range, format ["%1 final Score: %2",_range,_score],true] remoteExec ["ERC_Write_Value",0]; //Change it to execute everyone  
	};
};


