private ["_skin","_unitBag","_bagType","_bagMagazines","_bagWeapons","_array1","_array2"];
_skin = _this select 0;
_unitBag = unitBackpack player;
_bagType = typeOf _unitBag;
_bagWeapons = getWeaponCargo _unitBag;
_bagMagazines = getMagazineCargo _unitBag;

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has changed skins to %3",name player,getPlayerUID player,_skin];
	[] spawn {publicVariable "usageLogger";};
};

removeBackpack (vehicle player);
[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
sleep 0.3;

if(_bagType == "CZ_VestPouch_EP1" || _bagType == "DZ_LargeGunBag_EP1" || _bagType == "DZ_ALICE_Pack_EP1" || _bagType == "DZ_Assault_Pack_EP1" || _bagType == "DZ_Backpack_EP1" || _bagType == "DZ_British_ACU" || _bagType == "DZ_CivilBackpack_EP1" || _bagType == "DZ_Czech_Vest_Pouch" || _bagType == "DZ_Patrol_Pack_EP1" || _bagType == "DZ_TK_Assault_Pack_EP1" || _bagType == "DZ_GunBag_EP1" || _bagType == "DZ_CompactPack_EP1" || _bagType == "DZ_TerminalPack_EP1") then
{
	(vehicle player) addBackpack _bagType;
	sleep 0.1;

	_array1 = _bagWeapons select 0;
	_array2 = _bagWeapons select 1;
	for [{_i=0}, {_i < count _array1}, {_i=_i+1}] do
	{
		(unitBackpack player) addWeaponCargo [(_array1 select _i),(_array2 select _i)];
	}forEach ARRAY;
		
	_array1 = _bagMagazines select 0;
	_array2 = _bagMagazines select 1;
	for [{_i=0}, {_i < count _array1}, {_i=_i+1}] do
	{
		(unitBackpack player) addMagazineCargo [(_array1 select _i),(_array2 select _i)];
	}forEach ARRAY;
};
