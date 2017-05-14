// :SHOW:1
// :CATEGORY:Radio
// :NAME:Top2000_Radio_Stations_Player
// :AUTHOR:Ferd Frederix
// :KEYWORDS:
// :CREATED:2013-12-14 13:33:32
// :EDITED:2017-03-11  11:22:37
// :ID:902
// :NUM:1558
// :REV:1.2
// :WORLD:Second Life, OpenSim
// :DESCRIPTION:
// This is a slave for remote pacels.  It listens for commands from the master controller.
// More information on this radio player is at http://www.outworldz.com/Secondlife/posts/streaming
// :CODE:

default {
    state_entry()
    {
        llListen(-95487,"","","");
    }
    listen(integer channel,string name, key id, string message)
    {
        llSetParcelMusicURL(message);
    }
}
