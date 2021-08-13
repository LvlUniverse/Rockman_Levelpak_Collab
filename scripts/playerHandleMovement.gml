/// playerHandleMovement();

if (!playerIsLocked(PL_LOCK_TURN))
{
    if (xDir != 0)
    {
        image_xscale = sign(xDir);
    }
}

// Movement (includes initializing sidestep while on the ground)
if (!playerIsLocked(PL_LOCK_MOVE))
{
    if (ground && !playerIsLocked(PL_LOCK_GROUND))
    {
        //inuni mod: test for icy objects
        var icePlat = false;
        with(objSolidEntity)
        {
            if isIcy && place_meeting(x, y - other.gravDir, other)
                && !place_meeting(x, y + other.gravDir, other)
            {
                icePlat = true;
                break;
            }
        }
        //default code resumes here
        if (xDir == image_xscale) // Walk on the ground
        {
            if (stepTimer < stepFrames)
            {
                if stepTimer == 0
                    shiftObject(xDir, 0, true);
                stepTimer += 1;
            }
            else
            {
                if (place_meeting(x, y + gravDir, objOil)) // Oil
                {
                    xspeed = oilWalk * xDir;
                }
                else if icePlat || place_meeting(x, y + gravDir, objIce)
                    || (instance_exists(statusObject) && statusObject.statusOnIce)// Ice
                {
                    if (xspeed * image_xscale < walkSpeed)
                    {
                        xspeed += iceDec * xDir;
                    }
                }
                else // Normal
                {
                    xspeed = walkSpeed * xDir;
                }
            }
        }
        else
        {
            stepTimer = max(--stepTimer, 0);
            if (xspeed != 0)
            {
                if icePlat || (place_meeting(x, y + gravDir, objIce)
                    || (instance_exists(statusObject) && statusObject.statusOnIce)) // Ice physics
                {
                    xspeed -= min(abs(xspeed), iceDec) * sign(xspeed);
                }
                else // Normal physics
                    xspeed = 0;
            }
        }
    }
    else // Move in the air
    {
        if (!playerIsLocked(PL_LOCK_AERIAL))
        {
            if (!dashJumped)
            {
                xspeed = walkSpeed * xDir;
            }
            else
            {
                xspeed = slideSpeed * xDir;
            }
            if !instance_exists(objNekoClaw)    //hack to keep walking aiming sprites from being used
                stepTimer = stepFrames;
            else
                stepTimer = 0;
        }
    }
}
