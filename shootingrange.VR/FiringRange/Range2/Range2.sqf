Range2Targets = [];
{
  if ("Range2Target" in vehiclevarname _x) then {
    Range2Targets pushback _x;
  };
} foreach RangeTargets;
missionNamespace setVariable ["Range2Occupied",false,true];
// Only set this with range2, it can be set to other thing on different situation
missionNamespace setVariable ["Range2Moving",false,true];
// Define special target
// Have to define that the target should be moving

[Range2Target] call FR_CreateDummy; 
[Range2Target_1] call FR_CreateDummy;
// has to be hard code because you want to set it in the editor and set the location in here
// Modify the belowing to config the target movement
Target1Move = {
  while {sleep 0.1;true} do {
    while {sleep 0.01;(missionNamespace GetVariable ["Range2Moving",true])} do {
      [Range2Target, position Range2TargetStart,1] call FR_MoveTarget;
      [Range2Target, position Range2TargetEnd,1] call FR_MoveTarget;
    };
  };
};
Target2Move = {
  while {sleep 0.1;true} do {
    while {sleep 0.01;(missionNamespace GetVariable ["Range2Moving",true])} do {
      [Range2Target_1, position Range2Target_1Start,1] call FR_MoveTarget;
      [Range2Target_1, position Range2Target_1End,1] call FR_MoveTarget;
    };
  };
};

[] spawn Target1Move;
[] spawn Target2Move;
