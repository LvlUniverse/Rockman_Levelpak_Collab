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
    case 000:
        accName = "Energy Balancer";
        accDesc = "If your weapon is full,#weapon energy will#refill the weapon that's#lowest on energy instead.";
        break;
    
    case 001:
        accName = "Energy Charger";
        break;
    
    case 002:
        accName = "Energy Converter";
        break;
    
    case 003:
        accName = "Normal Item";
        break;
    
    case 004:
        accName = "Skull Amulet";
        break;
    
    case 005:
        accName = "Met Helmet";
        break;
    
    case 006:
        accName = "Energy Saver";
        break;
    
    case 007:
        accName = "Super E.Balancer";
        break;
}
