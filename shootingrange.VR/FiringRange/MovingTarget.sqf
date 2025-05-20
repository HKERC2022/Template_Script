FR_CreateDummy = {
  _target = param [0,objnull,[objnull]];
  _initial_pos = position _target;
  _dummy = "C_Soldier_VR_F" createVehicle position _target;
  _dummy setVectorDir (VectorDir _target);
  _dummy allowdamage false;
  _dummy hideObjectGlobal true;
  _target attachTo [_dummy,[0,0,1]];
  _dummy setpos _initial_pos;
  _target setVariable ["dummy",_dummy];
  _target setVariable ["moving",true];
};

// Must use spawn, you don't want to clot up the server

FR_MoveTarget = {
  private _target = param [0,objnull,[objnull]];
  private _end_pos = param [1,[0,0,0],[[]]];
  private _speed = param [2,0,[0]];
  private _dummy = _target getVariable ["dummy",objnull];
  // give an ai to move
  _initial_pos = position _dummy;
   _distance = (position _dummy) vectorDistance (_end_pos);
  while {sleep 0.01;_distance >= 0.5 && (_target getVariable ["moving",true])} do {
    _direction = vectorNormalized (_end_pos vectorDiff (position _dummy));
    _dummy setvelocity ( _direction vectorMultiply _speed);
    _distance = (position _dummy) vectorDistance (_end_pos);
  };
};


FR_StopMovingTarget = {
  private _range = param [0,"",[""]];
  _targets = missionNamespace getVariable [_range+"Targets",[]];
  {
    _x setVariable ["moving",false];
  } foreach _targets;
};

FR_StartMovingTarget = {
  private _range = param [0,"",[""]];
  _targets = missionNamespace getVariable [_range+"Targets",[]];
  {
    _x setVariable ["moving",true];
  } foreach _targets;
};

