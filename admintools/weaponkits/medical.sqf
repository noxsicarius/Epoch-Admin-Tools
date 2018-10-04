private "_bloodbag";

	if(dayz_classicBloodBagSystem) then {_bloodbag = "ItemBloodbag";}else{_bloodbag = "bloodBagONEG";};

	{
		player addMagazine _x;
	} count ["ItemMorphine","ItemEpinephrine","ItemAntibiotic","ItemPainkiller","ItemSodaPepsi","FoodBeefCooked","ItemBandage","ItemBandage",_bloodbag];
