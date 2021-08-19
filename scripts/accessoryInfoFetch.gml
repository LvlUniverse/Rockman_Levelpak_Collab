/// accessoryInfoFetch(image, [page])
//procures name and description of a specific item or accessory
//returns accName, accDesc

//page 0 is accessories, page 1 is items
//page will be assumed to be 0 if none is specified

var pg;
if (argument_count > 1)
    pg = argument[1];
else
    pg = 0;
    
//default values
accName = "Undefined";
accDesc = "No description provided."

switch(argument[0] + (pg * 100))
{
    case ACC_EBalancer:
        accName = "Energy Balancer";
        accDesc = "If your weapon is full,#weapon energy will#refill the weapon that's#lowest on energy instead.";
        break;
    
    case 001:
        accName = "Energy Charger";
        break;
    
    case ACC_EConverter:
        accName = "Energy Converter";
        break;
    
    case 003:
        accName = "Normal Item";
        break;
    
    case ACC_SkullAmulet:
        accName = "Skull Amulet";
        break;
    
    case ACC_MetHelmet:
        accName = "Met Helmet";
        break;
    
    case ACC_ESaver:
        accName = "Energy Saver";
        break;
    
    case 007:
        accName = "Super E.Balancer";
        break;
    
    case ACC_Turret3:
        accName = "turret3";
        accDesc = "Increases shot limit#of the buster by 1.";
        break;
    
    case ACC_Flame3:
        accName = "flame3";
        accDesc = "Increases the size of#charged buster shots.";
        break;
    
    case ACC_Dab:
        accName = "Pogger";
        accDesc = "Allows use of a special#pose, by pressing DOWN#while standing still.";
        break;
}
