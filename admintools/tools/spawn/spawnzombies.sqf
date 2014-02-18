  //         ["zZombie_Base", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", 	   //
 // "z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3"] //
// Malory's Zombie Spawn Script

private["_malz"];
"zZombie_Base" createUnit [[(getpos player select 0), (getpos player select 1), 50], _malz];
[_malz] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";