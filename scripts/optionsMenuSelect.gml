/// optionsMenuSelect(var, min, max, [sfx])
//this code was getting copied dozens of times in the options menu code, so i outsourced it

var sfx, ret;
if argument_count > 3
    sfx = argument[3];
else
    sfx = sfxTextBox;

if argument[2] - argument[1] <= 1
    ret = !argument[0];
else
    ret = clamp(argument[0] + xdir, argument[1], argument[2]);

if ret != argument[0]
    playSFX(sfx);
return(ret);
