Spawn_ERC_Timer = {
  private _start_time = param [0,0,[0]];
  private _range = param [1,"",[""]];
  _elapsed = 0;
  _timerDisplay = uiNamespace getVariable ["RscTimerDisplay"+_range,""]; 
  _timerctrl = _timerDisplay DisplayCtrl 1078; 
  missionNamespace setVariable ["Timer"+_range+"Running",true];
  _running = true;
  while {sleep 0.01; _running} do {
    _elapsed = time - _start_time;
    _timerctrl ctrlSetText format ["Range %1 Timer: %2",_range,(_elapsed)];
    _running = missionNamespace getVariable ["Timer"+_range+"Running",true];
  };
  missionNamespace setVariable ["Timer"+_range+"Running",false];
  _timerDisplay closeDisplay 1;
};

Spawn_ERC_CountDown = {
  private _server_time = param [0,0,[0]];
  private _end = param [1,0,[0]];
  private _range = param [2,"",[""]];
  _end_time = _server_time + _end;
  _timerDisplay = uiNamespace getVariable ["RscTimerDisplay"+_range,""]; 
  _timerctrl = _timerDisplay DisplayCtrl 1078;
	missionNamespace setVariable ["Timer"+_range+"Running",true];
  _running = true;
  _elapsed = _end;
  while {sleep 0.01; _running && _elapsed > 0} do {
    _elapsed = _end_time - time;
    _timerctrl ctrlSetText format ["Range %1 Count Down: %2",_range,(_elapsed)];
    _running = missionNamespace getVariable ["Timer"+_range+"Running",true];
  };
  _timerDisplay closeDisplay 1;
  missionNamespace setVariable ["Timer"+_range+"Running",false];
};

ERC_Write_Value = {
  private _range = param [0,"",[""]];
  private _value = param [1,"",[""]];
  private _disappear = param [2,true,[true]];
  _range_number = _range select [5, count _range]; 
  ("RscTimerLayer"+_range_number call BIS_fnc_rscLayer) cutRsc ["RscTimer"+_range_number, "PLAIN"];
  _timerDisplay = uiNamespace getVariable ["RscTimerDisplay"+_range_number,""]; 
  _timerctrl = _timerDisplay DisplayCtrl 1078;
  _timerctrl ctrlSetText _value;
  if (_disappear) then {
    sleep 10;
    _timerDisplay closeDisplay 1;
  };
  
};

ERC_Timer = {
  // Count Down: [[_server_time, _count down from], "CountDown", "Rangex"]
  // Timer: [[_current_time],"Timer","Rangex"]
  private _argument = param [0,[],[[]]];
  private _timertype = param [1,"",[""]];
  private _range = param [2,"",[""]];
	private _range_number = _range select [5];
	("RscTimerLayer"+_range_number call BIS_fnc_rscLayer) cutRsc ["RscTimer"+_range_number, "PLAIN"];
	if (_timertype == "CountDown") then {
		[_argument select 0, _argument select 1, _range_number] spawn Spawn_ERC_CountDown;
	};
	if (_timertype == "Timer") then {
		[_argument select 0, _range_number] spawn Spawn_ERC_Timer;
	};
};

StopTimer = {
  private _range = param [0,"",[""]];
  _range_number = _range select [5,count _range];
  missionNamespace setVariable ["Timer"+_range_number+"Running",false];
};

