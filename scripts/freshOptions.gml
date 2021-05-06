/// freshOptions()
// resets all options-specific variables to their default value

//sound
global.musicvolume = 80;
global.soundvolume = 100;

//"display"
global.showControllerOverlay = false;
global.vsync = 0;
global.healthEffect = 0;
global.damagePopup = 0;
global.chargeBar = 0;
global.showFPS = 0;
global.familyFriendlyText = false;
global.escapeBehavior = 1;
global.showControllerOverlay = false;
global.showHUDWeaponIcon = true;

//accessibility
global.showMovingText = true;
global.showColoredTextOverlays = false;
global.coloredTextOverlaysRed = 0;
global.coloredTextOverlaysGreen = 170;
global.coloredTextOverlaysBlue = 255;
global.coloredTextOverlaysOpacity = 120;
global.doFlashing = true;

//game style
global.mmColor = 0;
global.pickupGraphics = 0;
global.deathEffect = 0;
global.jumpSound = 0;
global.teleportSound = 0;

global.playerSpriteMax = 4;
for (i = 0; i < global.playerSpriteMax; i += 1)
{
    global.playerSprite[i] = sprRockman;
}
global.playerSprite[1] = sprProtoman;
global.playerSprite[2] = sprBass;
global.playerSprite[3] = sprRoll;

//controls
for (i = 0; i < 4; i += 1)
{
    global.leftKey[i] = vk_left;
    global.rightKey[i] = vk_right;
    global.upKey[i] = vk_up;
    global.downKey[i] = vk_down;
    global.jumpKey[i] = ord('Z');
    global.shootKey[i] = ord('X');
    global.slideKey[i] = ord('C');
    global.pauseKey[i] = vk_space;
    global.weaponSwitchLeftKey[i] = ord('A');
    global.weaponSwitchRightKey[i] = ord('S');
    
    global.joystick_jumpKey[i] = gp_face1;
    global.joystick_shootKey[i] = gp_face3;
    global.joystick_slideKey[i] = gp_face4;
    global.joystick_pauseKey[i] = gp_start;
    global.joystick_weaponSwitchLeftKey[i] = gp_shoulderlb;
    global.joystick_weaponSwitchRightKey[i] = gp_shoulderrb;
}

global.leftKey[1] = vk_numpad4;
global.rightKey[1] = vk_numpad6;
global.upKey[1] = vk_numpad8;
global.downKey[1] = vk_numpad2;
global.jumpKey[1] = vk_numpad5;
global.shootKey[1] = vk_numpad0;
global.slideKey[1] = vk_numpad3;
global.pauseKey[1] = vk_enter;
global.weaponSwitchLeftKey[1] = vk_numpad7;
global.weaponSwitchRightKey[1] = vk_numpad9;
