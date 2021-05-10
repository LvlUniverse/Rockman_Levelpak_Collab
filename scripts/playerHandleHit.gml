/// playerHandleHit();
// While being hit
if (isHit)
{
    if accIsEnabled(ACC_MetHelmet)
        var hitTime = 10
    else
        var hitTime = 32;
    
    if (hitTimer >= hitTime)
    {
        isHit = false;
        hitTimer = 0;
        
        hitLock = lockPoolRelease(hitLock);
        
        if (iFrames != 0)
        {
            iFrames = 60 * (1 + (accIsEnabled(ACC_MetHelmet) * 0.5));
        }
    }
}
