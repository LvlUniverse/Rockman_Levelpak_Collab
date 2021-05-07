/// freshSaveFile()
// resets all save-file-specific variables
// should be called at the start of a new game,
// or when returning to the main menu.
// When starting a new game, be sure to set the
// global.saveFile variable in order to save the game.

print("Fresh savefile created!");

global.saveFile = "";
global.difficulty = DIFF_NORMAL;

// in the example game, save files can be set to skip over levels
global.debugSkipStageMode = false;

global.bolts = 0;
global.eTanks = 0;
global.wTanks = 0;
global.mTanks = 0;

global.energyElements = 0;
global.elementsCollected = makeArray("");

global.equipmentOwned = makeArray(0, 1, 2, 3, 4, 5, 6, 7);
global.equipmentDisabled = allocateArray(sprite_get_number(sprEquipmentIcons));
global.equipmentHotbar = makeArray(0);   //just the energy balancer to start
global.equipmentActive = allocateArray(sprite_get_number(sprEquipmentIcons));
global.equipmentActive[0] = true;

//todo: replace these with equipment menu hooks
//---
global.chargeUpgrade = 0;
global.shotUpgrade = 0;
global.dropUpgrade = 0;
global.skullAmulet = 0;
global.sturdyHelmet = 0;
global.converter = 0;
global.energySaver = 0;
//---

global.gameTimer = 0;

for (var j = 0; j <= global.totalWeapons; j++)
{
    global.weaponLocked[j] = (j >= 12) * 2;
    global.weaponHotbar[j] = j;
}
