/// drawHat(hatID, sheetX, sheetY, x, y, xscale, yscale)
//well, it draws yer hat.

var hid = argument0,
    sheetX = floor(argument1),
    sheetY = floor(argument2),
    _x = floor(argument3),
    _y = floor(argument4),
    _xscale = argument5,
    _yscale = argument6;
    hoffX = 0;
    hoffY = 0;
    himgX = 0;
    himgY = 0;

//big dumb offset table
if sheetY <= 6
{
    if sheetY == 3
    {
        himgX = 2;
        himgY = 2;
    }
    switch(sheetX)
    {
        //walking
        case 3:
        case 5:
            hoffY = 2;
        case 4:
        case 6:
            hoffX = 2;
            if sheetY == 3
                hoffX = 5;
            break;
        
        //jumping
        case 7:
        case 8:
        case 9:
        case 10:
            hoffY = -4;
            if sheetY == 3
                hoffX = 1;
            break;
        
        //sliding
        //sliding has optional frames! aren't i so nice.
        case 12:
            himgX = 1;
        case 11:
            hoffX = -1;
            hoffY = 5;
            himgY = 3;
            break;
        
        //getting hit
        case 13:
            hoffY = -1;
            break;
        //mm1 stun
        case 14:
            hoffX = -1;
            hoffY = 4;
            break;
        
        //climbing
        case 15:
        case 16:
        case 17:
            if sheetY == 0
            {   //climbing while not shooting
                if sheetX == 16
                    _xscale = -_xscale;
                himgX = 1 + (sheetX == 17);
                break;
            }
            else if sheetY == 3
            {   //climbing while shooting up
                himgX = 3;
                if sheetX == 16
                    hoffX = 1;
            }
            else
            {   //climbing while doing other shooting
                himgX = 1;
                himgY = 1;
                hoffY = -2;
                if sheetY = 6
                    hoffX = 1;
            }
    }
    //leans into shooting
    if (sheetY != 0) && (sheetY != 3) && (sheetY != 6) && (sheetX <= 2)
        hoffX = 4;
}
else if sheetX = 12 && sheetY = 9    //dab
        hoffY = 1;
else if sheetY == 10
{//ddash anim
    hoffX = 2;
    hoffY = 3;
}
else if sheetY = 8
{
    //no hats for teleporting
    exit;
}
else if sheetY == 11
{
    //mm5 platform spinny animation
    himgY = 1;
    switch(sheetX)
    {
        case 0:
            //default
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            //turn to back
            himgX = sheetX - 1;
            break;
        case 5: //3
        case 6: //2
        case 7: //1
        case 8: //0
            //turn from back
            //recycles the prev 4 sprites, just flipped and reversed
            himgX = 8 - sheetX;
        case 9:
            _xscale = -_xscale;
            //default but flipped
            break;
    }
}
else if sheetY = 12
{
    switch(sheetX)
    {
        //jet bike uses default offsets
        
        //item4
        case 8:
            hoffX = 2;
            break;
        
        //hail breaker anim
        case 14:
            himgX = 1;
        case 12:
            himgY = 2;
        case 13:
            hoffY = -3;
            break;
        
        //1up
        case 15:
            himgX = 3;
            himgY = 3;
            break;
    }
}

var SquareSize = 48;

if hid < sprite_get_number(sprHats)
{   //static color hats
    draw_sprite_part_ext(sprHats, hid,
        1 + (floor(himgX) * (SquareSize + 3)),
        1 + (floor(himgY) * (SquareSize + 3)), SquareSize,
        SquareSize, round(_x) - ((24 + -hoffX) * _xscale),
        round(_y) - ((27 + -hoffY) * _yscale), _xscale, _yscale,
        c_white, true);
}
else
{   //changes color with mega hats
    hid -= sprite_get_number(sprHats);
    var col;
    col[0] = c_white;
    col[1] = global.primaryCol[0];
    col[2] = global.secondaryCol[0];
    col[3] = global.outlineCol[0];
    for (var i = 0; i < 4; i += 1)
    {
        draw_sprite_part_ext(sprHats2, (hid * 4) + i,
            1 + (floor(himgX) * (SquareSize + 3)),
            1 + (floor(himgY) * (SquareSize + 3)), SquareSize,
            SquareSize, round(_x) - ((24 + -hoffX) * _xscale),
            round(_y) - ((27 + -hoffY) * _yscale), _xscale, _yscale,
            col[i], 1);
    }
}
