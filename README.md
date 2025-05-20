# Script Template

This is an arma 3 mission script template for HKERC

There is no standard `mission.sqm`. It is just for an example. Make your own mission.sqm before using the script.

The template will build on top of minimal. That means all the template should have the minimal funciton. Remove those funciton manually if you don't need it.

Remeber to config the `description.ext` to fit your mission 

## Minimal Template

Minimum function and script. Just make it work. This include the respawn with last death loadout function and delete the corspe from disconnect player.

## Shooting Range 

This is a example scenario for shooting range. It works for multiplayer.

Shooting Range and Timer UI. Put your target in the eden editor first with "NoPop" variation. You can find it on [Arma 3 wiki](https://community.bistudio.com/wiki/Arma_3:_CfgPatches_CfgVehicles). The Target name **Must** be `RangeXTarget_N`. E.g. Range1Target_1, Range2Target_2. The Computer name Must be `RangeXComputer`. Modify the `FiringRange\RangeX.sqf` and `FiringRange\RangeXAction.sqf` to compile with your own scenario. The timer UI only up to two Ranges, add addional timer and adjust the position for more ranges. There is no limit on target and timerUI it's just your computer resources. 
