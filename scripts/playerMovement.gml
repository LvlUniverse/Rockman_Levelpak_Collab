if (!instance_exists(vehicle))
{
    if (ycoll * gravDir > 0)
    {
        if (playLandSound > 2 && !isHit && !climbing)
        {
            if (global.jumpSound)
            {
                playSFX(sfxLandClassic);
            }
            else
            {
                playSFX(sfxLand);
            }
        }
    }
}

// Stop movement at section borders (horizontal)
var xdis = x - (view_xview + ((view_wview * 0.5)));
var xpos = (view_wview * 0.5)-6;

if (abs(xdis) > xpos)
{
    if ((xdis >= 0 && (!place_meeting(x, y, objSectionArrowRight) || global.lockTransition))
        || (xdis < 0 && (!place_meeting(x, y, objSectionArrowLeft) || global.lockTransition)))
    {
        x = view_xview + (view_wview * 0.5) + xpos * sign(xdis);
        xspeed = 0;
        
        if (position_meeting(x,y,objSolid) && blockCollision)
        {
            global.playerHealth[playerID] = 0;
        }
    }
}


// stop movement at section borders (vertical)
var ydis = y - (view_yview + (view_hview * 0.5));
var ypos = (view_hview * 0.5) + 32;

if (ydis * gravDir < -ypos)
{
    y = view_yview + (view_hview * 0.5) + ypos * sign(ydis);
}
else if (dieToPit)
{
    if (ydis * gravDir > ypos - 16)
    {
        if ((gravDir >= 0 && !position_meeting(x, y - 8, objSectionArrowDown))
            || (gravDir < 0 && !place_meeting(x, y + 8, objSectionArrowUp)))
        {
            //death / damage to pits
            if instance_exists(objPitSaver)
            {
                //reduced damage if you got knocked in
                var dmg = instance_nearest(x, y, objPitSaver).contactDamage / ((iFrames > 0) + 1);
                var frc = instance_nearest(x, y, objPitSaver).ejectForce;
                if global.playerHealth[playerID] <= dmg
                {
                    global.playerHealth[playerID] = 0;
                    deathByPit = true;
                    exit;
                }
                else
                {
                    //do damage, even if player is in hitstun
                    global.playerHealth[playerID] -= dmg;
                    iFrames = max(iFrames, 48);
                    playSFX(sfxHit);
                    //eject with speed
                    yspeed = -frc * gravDir;
                    canMinJump = false;
                    //remove item4
                    if instance_exists(vehicle) && vehicle.object_index = objItem4
                    {
                        with(vehicle)
                            event_user(10);
                    }
                }
            }
            else
            {
                global.playerHealth[playerID] = 0;
                deathByPit = true;
            }
        }
    }
}

// Handling of masks to make sure nothing breaks
if (!isSlide && (mask_index == firstSlideMask || mask_index == secondSlideMask))
{
    mask_index = mskMegaman;
}
