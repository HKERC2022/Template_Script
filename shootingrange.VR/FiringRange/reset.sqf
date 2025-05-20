FR_Reset_Range = {
  private _range = param [0,[""],[""]];
  private _targets = missionNamespace getVariable [_range+"Targets", []];
  {
    _x setVariable ["Hitted",false];
    _x animate ["terc",0];
  } foreach _targets;
};

FR_Reset_Range_FaceDown = {
  private _range = param [0,[""],[""]];
  private _targets = missionNamespace getVariable [_range+"Targets", []];
  {
    _x setVariable ["Hitted",false];
    _x animate ["terc",1];
  } foreach _targets;
};
