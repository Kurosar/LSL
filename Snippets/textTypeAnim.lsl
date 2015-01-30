string lastText;
float text_volume = .25;
vector text_color = <1,1,1>;
float text_speed = .02;

textTypeAnim(integer link, integer add, string text)
{
    string displayText;
    if(!add) lastText = "";
    else lastText += "\n";
    integer stringLength = llStringLength(text);
    integer i;
    if(text_speed < .09) llLoopSound("c614e951-e113-556a-67aa-caa6161197d9", text_volume);
    for(i = 0; i < stringLength; i++)
    {
        displayText = lastText + llGetSubString(text, 0, i);
        llSetLinkPrimitiveParamsFast(link, [PRIM_TEXT, displayText + "_", text_color, 1]);
        if(text_speed > .09) llPlaySound("c614e951-e113-556a-67aa-caa6161197d9", text_volume);
        if(text_speed > 0)
            llSleep(llFrand(text_speed));
    }
    llSetLinkPrimitiveParamsFast(link, [PRIM_TEXT, displayText, text_color, 1]);
    llStopSound();
    lastText = displayText;
}
