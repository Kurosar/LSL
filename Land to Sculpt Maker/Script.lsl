// :SHOW:
// :CATEGORY:Terrain
// :NAME:Land to Sculpt Maker
// :AUTHOR:Unknown
// :KEYWORDS:
// :CREATED:2016-01-23 15:14:38
// :EDITED:2016-01-23  14:14:38
// :ID:1098
// :NUM:1883
// :REV:1
// :WORLD:Opensim
// :DESCRIPTION:
// Makes a 32 X 32 sculpt fo the the terrain under the prim.  
// :CODE:
string int2hex(integer x)
{
    string hex="0123456789ABCDEF";
    return llGetSubString(hex, (x >> 4), (x >> 4)) +
           llGetSubString(hex, x & 0xF, x & 0xF);
}
default
{
    on_rez(integer mm)
    {
        llResetScript();
    }
    state_entry()
    {
        llOwnerSay("Script running");
    }
    touch_end(integer touched)
    {
        if (llDetectedKey(0) == llGetOwner())
        {
            llOwnerSay("Starting...");
            float mapX = 0.0;
            float mapY = 0.0;
            float mapZ = 0.0;
            integer x = 0;
            integer y = 0;
            integer z = 0;
            integer offsetX = 0;
            integer offsetY = 0;
            string colorX = "";            
            string colorY = "";            
            string colorZ = "";            
            string draw = osSetPenSize("", 1);
            vector pos = llGetPos();
            for (; y < 64; y++)
            {
                draw = osMovePen(draw, 0, y);
                offsetX = 0;
                if (y == 63) offsetY = 1;                            
                for (x = 0; x < 64; x++)
                {
                    if (x == 63) offsetX = 1;
                    mapX = ((float)x + offsetX) / 2.0 - 16.0;
                    mapY = ((float)y + offsetY) / 2.0 - 16.0;
                    mapZ = llGround(<mapX, mapY, 0.0>);
                    if (mapZ > (pos.z + 16.0)) z = 255;
                    else if (mapZ < (pos.z - 16.0)) z = 0;
                         else { z = llRound((mapZ - (pos.z - 16.0)) * 8.0); }
                    if (x == 63) colorX = "FF";
                    else colorX = int2hex(x * 4);
                    if (y == 63) colorY = "FF";
                    else colorY = int2hex(y * 4);
                    if (z == 256) colorZ = "FF";
                    else colorZ = int2hex(z);
                    draw = osSetPenColor(draw, "FF" + colorX + colorY + colorZ);
                    draw = osDrawLine(draw, x, y, x + 1, y);
                }
            }
            osSetDynamicTextureDataBlendFace("", "vector", draw, "width:64,height:64", FALSE, 2, 0, 255, 1);
            llSetPrimitiveParams([PRIM_SIZE, <32.0, 32.0, 32.0>, PRIM_TYPE, PRIM_TYPE_SCULPT, llGetTexture(1),PRIM_SCULPT_TYPE_PLANE | PRIM_SCULPT_FLAG_INVERT]);
            state done;
        }
    }
}
state done
{
    state_entry()
    {
        llSetClickAction(CLICK_ACTION_NONE);
        llOwnerSay("Done.");
        //llRemoveInventory(llGetScriptName());
    }
}
