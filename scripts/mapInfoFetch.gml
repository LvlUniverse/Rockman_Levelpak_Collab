/// mapInfoFetch([roomID])
//procures info about available teleport locations
//if no room is provided, uses current room

var mid;
if (argument_count != 0)
    mid = argument[0];
else
    mid = room;

//option 0 is always back to hub unless otherwise specified
cpNames[0] = "Back to Hub";

switch(mid)
{
    default:
        useExit = true;
        break;
    
    case lvlCutMan:
    case lvlGutsMan:
        mapName = "Forsaken City";
        warpPointRoom = allocateArray(6, lvlCutMan);
        thumbImg = sprMapThumbTest;
    
        cpNames[1] = "Start";
        warpPointXs[1] = 128;
        warpPointYs[1] = 2064;
        
        cpNames[2] = "Crossing";
        warpPointXs[2] = 1440;
        warpPointYs[2] = 896;
        
        cpNames[3] = "Chasm";
        warpPointXs[3] = 2432;
        warpPointYs[3] = 864;
        
        cpNames[4] = "Contraption";
        warpPointXs[4] = 2432;
        warpPointYs[4] = 320;
        warpPointRoom[4] = lvlGutsMan;
        
        cpNames[5] = "Scrap Pit";
        warpPointXs[5] = 2944;
        warpPointYs[5] = 1104;
        warpPointRoom[5] = lvlGutsMan;
        break;
}
