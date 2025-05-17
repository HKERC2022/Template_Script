//Set tag

addMissionEventHandler ['HandleDisconnect',{
	[(_this select 0)] spawn {
		sleep 0.1;
		deleteVehicle (_this select 0);
	};
}];

