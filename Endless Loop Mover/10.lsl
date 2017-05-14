// :SHOW:1
// :CATEGORY:Tour
// :NAME:Endless Loop Mover
// :AUTHOR:Ferd Frederix
// :KEYWORDS: Movement, Walking, Teleporting
// :CREATED:2013-09-06
// :EDITED:2015-08-05  10:12:51
// :ID:1084
// :NUM:1817
// :REV:1
// :WORLD:OpenSim
// :DESCRIPTION:
// Rez this from inventory to make a route.  Use the recorder to gather the route.
// :CODE:

// name this prim '10' without the double quotes.   You will use the prim #10 to establish a path of waypoints to follow.
// Rez a prim ad name it '10', or any other number without the double quotes, at a spot at the beginning of the ride.
// Mark the prim as 'Phantom'. The final gadget will pass through the #10 prim on its route.
// Put the following script in it. Take a copy of that prim back into inventory.
// Left-click and drag from inventory the '10' prim at a spot nearby, in the direction you want the object to travel.
// If you use shift-copy, move it slightly, then grab the one you r left behind!
//  The prim you shift copy will be in reverse order, as the original #10 moves, and leaves behind a copy.
//  You canm also just drag out a new one each time you need another waypoint.

// Each prim will rename itself to the largest number found +10, about 5 seconds after it rezzes.
// Since you started with prim #10, the second prim will rename itself as #20, the next will be 30, and so on.
// When finsihes, click the tour object


integer wanted = 0;
integer debugger = 1;

list prims;


debug(string message)
{
    if (debugger)
        llOwnerSay(message);
}

default
{
    state_entry()
    {
        llListen(300,"","","");
        wanted++;
        llRegionSay(300,"number");
        llSetTimerEvent(5.0);   // 5 seconds to hear from all prims
        llOwnerSay("Setting coordinates");
    }

    listen(integer channel,string name, key id, string message)
    {
        if (message == "die")
            llDie();
        
        else if (message =="where")
            llRegionSay(300,llGetObjectName() + "|" + (string) llGetPos() + "|" + (string)  llGetRot() + "|" + llGetObjectDesc());
            
        else if (message =="number")
            llRegionSay(300,llGetObjectName());
                        
        else if (wanted)
        {
            prims += (integer) message; // add to memory list                
        }
        
            
    }
    
    timer()
    {
        wanted = 0;
        prims = llListSort(prims,1,0);  // sort descending
        integer num = (integer) llList2Integer(prims,0); // get highest number
        llSetObjectName((string) (num + 10));  // leave room for more prims to be added
        llOwnerSay("Name set to " + llGetObjectName() + ".  You can add text to be spoken when the tour reaches this location by adding some text to the description of this object.");

        llSetTimerEvent(0);
    }

    on_rez(integer p)
    {
        llResetScript();
    }
}
