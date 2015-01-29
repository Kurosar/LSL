// Setup
string phpurl = "http://localhost/lslbridge.php"; // Where is your lslbridge.php ?
string securekey = "Lu4LGYu4RLtvR3mP"; // This is your secret key (Some basic security to block random people from hacking your url)
float timerdelay = 10; // It will send informations to the server every x seconds
integer debug = FALSE; // This will enable debug mode in chat
integer clearoninit = TRUE; // This will send a clear command to the php script on script init

// Variables (Do not change)
integer AVATARS;
string REGIONNAME;
float DIL;
string SERVER;
float FPS;

chartAdd()
{ 
    string url = phpurl+"?"
    + "time=" + llEscapeURL((string)llGetUnixTime())
    + "&avatars=" + llEscapeURL((string)AVATARS)
    + "&regionname=" + llEscapeURL((string)REGIONNAME)
    + "&dil=" + llEscapeURL((string)DIL)
    + "&server=" + llEscapeURL((string)SERVER)
    + "&fps=" + llEscapeURL((string)FPS)
    + "&securekey=" + llEscapeURL(securekey)
    + "&method=" + "add";

    if (debug) llSay(0,"Sent : "+(url));
    llHTTPRequest(url, [], "");
}

chartClear()
{
    string url = phpurl+"?"
    + "time=" + llEscapeURL("FALSE")
    + "&avatars=" + llEscapeURL("FALSE")
    + "&regionname=" + llEscapeURL((string)REGIONNAME)
    + "&dil=" + llEscapeURL("FALSE")
    + "&server=" + llEscapeURL("FALSE")
    + "&fps=" + llEscapeURL("FALSE")
    + "&securekey=" + llEscapeURL(securekey)
    + "&method=" + "clear";

    if (debug) llSay(0,"Sent : "+(url));
    llHTTPRequest(url, [], "");
}

default
{
    state_entry()
    {
        // To avoid lag at each timer tick
        REGIONNAME = llGetRegionName();
        SERVER = llGetSimulatorHostname();
        
        // We clear the sim folder if clearoninit is TRUE
        if (clearoninit) chartClear();
        
        // Initiating the timer
        llSetTimerEvent(timerdelay);
    }
    
    timer()
    {
        // We get some fresh data to update
        AVATARS = llGetRegionAgentCount();
        DIL = llGetRegionTimeDilation();
        FPS = llFloor(llGetRegionFPS());

        // We send the new datas to the php script
        chartAdd();
    }
    http_response(key request_id, integer status, list metadata, string body)
    {
        if (debug) llOwnerSay(body);
    }
}
