/// drawPlayer(playerID, costumeID, sheetX, sheetY, x, y, xscale, yscale, [hatID])
// draws the given player at the given position
// invokes drawCostume with the correct values
// sheetX, sheetY: coord (in 48x48 units) of the animation frame in the skin sheet.

var pid = argument[0],
    cid = argument[1],
    sheetX = argument[2],
    sheetY = argument[3],
    _x = floor(argument[4]),
    _y = floor(argument[5]),
    _xscale = argument[6],
    _yscale = argument[7];

var _inked = false;
var baseCol = c_white;
if (instance_exists(objMegaman))
{
    with (objMegaman)
    {
        if (inked && playerID == pid)
        {
            _inked = true;
            baseCol = c_ltgray;
        }
    }
}


if (!_inked)
{
    drawCostume(global.playerSprite[cid], sheetX, sheetY, _x, _y, _xscale, _yscale,
        baseCol, global.primaryCol[pid],
        global.secondaryCol[pid], global.outlineCol[pid], image_alpha, image_alpha, image_alpha, image_alpha);
}

// octone ink handling:

if (_inked)
{
    drawPlayerInk(pid, sheetX, sheetY, _x, _y, _xscale, _yscale);
}

//hat
if argument_count > 8
    drawHat(argument[8], sheetX, sheetY, _x, _y, _xscale, _yscale);
