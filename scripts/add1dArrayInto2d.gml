///add1dArrayInto2d(source, target, index)
//converts a 1d array into a row in a provided 2d array.

var s = argument0;
var array = argument1;
var i = argument2;

if !is_array(s) || !is_array(array)
{
    assert(false, "script add1dArrayInto2d was provided non-array");
    exit;
}

var stop = array_length_1d(s);
if stop == 0
{
    printErr("script add1dArrayInto2d was provided 0-length array");
    exit;
}

for (var p = 0; p < stop; p++)
    array[i, p] = s[p];

return(array);
