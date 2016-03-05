if(isNil "EAT_returnPlayer") exitWith {cutText ["No return player available", "PLAIN DOWN"];};

(EAT_returnPlayer select 0) setPos (EAT_returnPlayer select 1);

EAT_returnPlayer = nil;