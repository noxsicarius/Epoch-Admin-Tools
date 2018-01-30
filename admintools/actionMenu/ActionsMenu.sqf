/*
	If you wish to disable options simply place a // infront of the menu you wish to disable.
*/

_pathtoscripts = "admintools\actionMenu\";
_EXECscript1 = 'player execVM "'+_pathtoscripts+'%1"';
_EXECscript3 = '["%1"] execVM "admintools\actionMenu\movements.sqf"';
_EXECscript4 = '[%1] execVM "admintools\actionMenu\contactAdmin.sqf"';

ActionMenu = [["",true],["-- Action Menu --", [], "", -5, [["expression", ""]], "1", "0"]];

if(EAT_isAdmin) then {

	/*
		This menu is for the Admins or Mods listed in the Epoch Admin Tools.
		To make this menu the same as what normal players get put a // in front of the fun menu
		and then remove the // from infront of the movement menu below.
	*/
	
	ActionMenu = ActionMenu + [["Action Menu >>", [], "#USER:ActionsMenu", -5, [["expression", ""]], "1", "1"]];
	ActionMenu = ActionMenu + [["Set View Distance >>", [], "#USER:SetViewDistanceMenu", -5, [["expression", ""]], "1", "1"]];
	ActionMenu = ActionMenu + [["Movement Menu >>",[],"#USER:MovementMenu", -5,[["expression",""]],"1","1"]];
	ActionMenu = ActionMenu + [["Server Rules", [], "", -5, [["expression", format[_EXECscript1,"serverRules.sqf"]]], "1", "1"]];
	ActionMenu = ActionMenu + [["", [], "", -5, [["expression", ""]], "1", "0"],["Exit", [20], "", -5, [["expression", ""]], "1", "1"]];

} else {
	// This menu is for normal players only. If you have an admin listed, they will use the menu above.

	ActionMenu = ActionMenu + [["Action Menu >>", [], "#USER:ActionsMenu", -5, [["expression", ""]], "1", "1"]];
	if(EAT_AllowMovementMenu) then {ActionMenu = ActionMenu + [["Movement Menu >>",[],"#USER:MovementMenu", -5,[["expression",""]],"1","1"]];};
	ActionMenu = ActionMenu + [["Server Rules", [], "", -5, [["expression", format[_EXECscript1,"serverRules.sqf"]]], "1", "1"]];
	if(EAT_AllowViewDistance) then {ActionMenu = ActionMenu + [["Set View Distance >>", [], "#USER:SetViewDistanceMenu", -5, [["expression", ""]], "1", "1"]];};
	if(EAT_AllowToggleTerrain) then {ActionMenu = ActionMenu + [["Turn Grass On/Off", [],"", -5, [["expression", format[_EXECscript1,"PlayerGrassToggle.sqf"]]], "1", "1"]];};
	if(EAT_AllowContactAdmin) then {ActionMenu = ActionMenu + [["Contact an Admin", [], "", -5, [["expression", format[_EXECscript4,false]]], "1", "1"]];};
	if(EAT_AllowContactAdmin) then {ActionMenu = ActionMenu + [["Cancel Admin Ticket", [], "", -5, [["expression", format[_EXECscript4,true]]], "1", "1"]];};
	ActionMenu = ActionMenu + [["", [], "", -5, [["expression", ""]], "1", "0"],["Exit", [20], "", -5, [["expression", ""]], "1", "1"]];
};

ActionsMenu = [["",true],["-- Action Menu --", [], "", -5, [["expression", ""]], "1", "0"]];
if(EAT_AllowBuildBike) then {ActionsMenu = ActionsMenu + [["Build Bike", [], "", -5, [["expression", format[_EXECscript1,"deployBike.sqf"]]], "1", "1"]];};
if(EAT_AllowBuildMozzie) then {ActionsMenu = ActionsMenu + [["Build Mozzie", [],  "", -5, [["expression", format[_EXECscript1,"deployMozzie.sqf"]]], "1", "1"]];};
if(EAT_AllowPackBike) then {ActionsMenu = ActionsMenu + [["Pack Bike", [], "", -5, [["expression", format[_EXECscript1,"packBike.sqf"]]], "1", "1"]];};
if(EAT_AllowPackMozzie) then {ActionsMenu = ActionsMenu + [["Pack Mozzie", [], "", -5, [["expression", format[_EXECscript1,"packMozzie.sqf"]]], "1", "1"]];};
if(EAT_AllowFlipVehicle) then {ActionsMenu = ActionsMenu + [["Flip Vehicle", [], "", -5, [["expression", 'player execVM "admintools\tools\flipVehicle.sqf"']], "1", "1"]];};
if(EAT_AllowSuicide) then {ActionsMenu = ActionsMenu + [["Suicide", [], "", -5, [["expression", format[_EXECscript1,"suicide.sqf"]]], "1", "1"]];};
ActionsMenu = ActionsMenu + [["", [], "", -5, [["expression", ""]], "1", "0"], ["Exit", [20], "", -5, [["expression", ""]], "1", "1"]];

MovementMenu =
[
	["",true],
	["-- Movement Menu --", [], "", -5, [["expression", ""]], "1", "0"],
	["Dance1",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingDuoIvan"]]],"1","1"],
	["Dance2",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingDuoStefan"]]],"1","1"],
	["Dance3",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingStefan"]]],"1","1"],
	["Boxing",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_idle68boxing"]]],"1","1"],
	["Karate",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exerciseKata"]]],"1","1"],
	["Pushups",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exercisePushup"]]],"1","1"],
	["Squat",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exercisekneeBendA"]]],"1","1"],
	["HandStand",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];

SetViewDistanceMenu =
[
	["",true],
	["-- View Distance Menu --", [], "", -5, [["expression", ""]], "1", "0"],
	["1000 Meters", [], "", -5, [["expression", format["setViewDistance 1000;"]]], "1", "1"],
	["1500 Meters", [], "", -5, [["expression", format["setViewDistance 1500;"]]], "1", "1"],
	["2000 Meters", [], "", -5, [["expression", format["setViewDistance 2000;"]]], "1", "1"],
	["2500 Meters", [], "", -5, [["expression", format["setViewDistance 2500;"]]], "1", "1"],
	["3000 Meters", [], "", -5, [["expression", format["setViewDistance 3000;"]]], "1", "1"],
	["3500 Meters", [], "", -5, [["expression", format["setViewDistance 3500;"]]], "1", "1"],
	["4000 Meters", [], "", -5, [["expression", format["setViewDistance 4000;"]]], "1", "1"],
	["4500 Meters", [], "", -5, [["expression", format["setViewDistance 4500;"]]], "1", "1"],
	["5000 Meters", [], "", -5, [["expression", format["setViewDistance 5000;"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:ActionMenu";
