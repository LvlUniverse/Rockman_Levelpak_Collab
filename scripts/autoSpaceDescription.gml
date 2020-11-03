/// autoSpaceDescription(text);
//Automatically spaces a block of text for use in the help menu.
var desc = argument[0];
var h = 0;
var recentSpace = 0;
//Go through every character in the text
for (var c = 0; c < string_length(desc); c++;)
{
    //track the last space we passed
    if string_char_at(desc, c) == " "
        recentSpace = c;
    
    //track how far we are into the line
    h++;
    if string_char_at(desc, c) == "#"
        h = 0;
    //and break it up if it's too long
    if (h > 24)
    {
        c = recentSpace + 1;
        desc = string_insert("#", desc, c);
        //print("Added line break at position " + string(c));
        h = 0;
    }
}

return(desc);
