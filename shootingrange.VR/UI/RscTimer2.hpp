class RscTimer2 {
  idd = -1;
  onLoad = "uiNamespace setVariable ['RscTimerDisplay2', _this select 0];";
  duration = 1e+6;
  class Controls {
    class Timer : RscStructuredText {
      idc = 1078;
      text = ""; //--- ToDo: Localize;
      type = CT_STRUCTURED_TEXT;
      x = 55 * GUI_GRID_W + GUI_GRID_X;
      y = 0 * GUI_GRID_H + GUI_GRID_Y;
      w = 5 * GUI_GRID_W;
      h = 5 * GUI_GRID_H;
      class Attributes
        {
          font = "RobotoCondensed";
          color = "#ffffff";
          colorLink = "#D09B43";
          align = "left";
          shadow = 1;
        };
      style = ST_MULTI;
      linespacing = 0;
    };
  }
}
