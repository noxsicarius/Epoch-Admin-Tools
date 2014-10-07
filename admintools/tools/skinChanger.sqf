private ["_skin","_unitBag","_bagType","_bagMagazines","_bagWeapons","_array1","_array2","_backPackZ"];
_skin = _this select 0;
_unitBag = unitBackpack player;
_bagType = (typeOf _unitBag);
_backPackZ = ["CZ_VestPouch_EP1","DZ_LargeGunBag_EP1","DZ_ALICE_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Backpack_EP1",
		"DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Czech_Vest_Pouch","DZ_Patrol_Pack_EP1","DZ_TK_Assault_Pack_EP1",
		"DZ_GunBag_EP1","DZ_CompactPack_EP1","DZ_TerminalPack_EP1"];
// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has changed skins to %3",name player,getPlayerUID player,_skin];
	[] spawn {publicVariable "usageLogger";};
};

/*/ check if player has a backpack, 1st ;^) /*/
if(_bagType !="") then {
	_bagWeapons = getWeaponCargo _unitBag;
	_bagMagazines = getMagazineCargo _unitBag;
	removeBackpack (vehicle player);
	[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
	sleep 0.3;
	
	if(_bagType in _backPackZ) then
	{
		(vehicle player) addBackpack _bagType;
		sleep 0.1;
	
		_array1 = _bagWeapons select 0;
		_array2 = _bagWeapons select 1;
	
		
		{
			(unitBackpack player) addWeaponCargo [(_array1 select _forEachIndex),(_array2 select _forEachIndex)];
		}forEach _array1;
			
		_array1 = _bagMagazines select 0;
		_array2 = _bagMagazines select 1;
	
		{
			(unitBackpack player) addMagazineCargo [(_array1 select _forEachIndex),(_array2 select _forEachIndex)];
		}forEach _array1;
	};
} else {
	[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
	sleep 0.3;
};
