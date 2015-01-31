// SETUP
float MaxHeight = 9;
// END OF SETUP

vector MinPos;
vector MaxPos;
vector CurPos;

default
{
    state_entry()
    {
        CurPos = llGetPos();
        MinPos = llGetPos();
        MaxPos = (MinPos + <0,0,MaxHeight>);
        llSetPos(MinPos);
        llListen(1,"",NULL_KEY,"");
    }
    
    listen(integer channel, string name, key id, string message)
    {
        CurPos = llGetPos();
        if (message == "up")
        {
            if (CurPos.z < MaxPos.z)
            {
               llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_POSITION, CurPos + <0,0,0.05>]);
            }
        }
        else if (message == "down")
        {
            if (CurPos.z > MinPos.z)
            {
                llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_POSITION, CurPos + <0,0,-0.05>]);
            }
        }
    }
}