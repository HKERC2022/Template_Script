practice_mode = {
  private _target = _this select 0;
  private _targetName = vehicleVarname _target;
  private _range = (_targetName) select [0,_targetName find "Target"]; //RangeX
  if (missionNamespace getVariable ["PracticeMode"+_range,true]) then {
    sleep 1;
    _target animate ["terc",0];
  };
};


