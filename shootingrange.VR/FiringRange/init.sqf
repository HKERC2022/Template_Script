#include "reset.sqf"
#include "practice.sqf"
#include "ShootingRangeMode.sqf"
#include "MovingTarget.sqf"
#include "Computer\init.sqf"
if (isServer) then {
  RangeTargets = []; 
  {
    if ("NoPop" in typeOf _x) then {
      _x addEventHandler ["HandleDamage", {
        _target = _this select 0;
        _target animate ["terc",1];
        _target setVariable ["Hitted",true];
        [_target] spawn practice_mode; 
        0;
      }];
      RangeTargets pushback _x;
    };
  } foreach allMissionObjects "all";
  #include "RangesPreprocess.sqf"
};

if (hasInterface) then {
  #include "playerinit.sqf"
};
