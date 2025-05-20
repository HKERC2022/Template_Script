Range1Targets = [];
{
  if ("Range1Target" in vehiclevarname _x) then {
    Range1Targets pushback _x;
  };
} foreach RangeTargets;
missionNamespace setVariable ["Range1Occupied",false,true];
