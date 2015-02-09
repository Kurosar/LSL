string phpurl = "http://localhost/php2mysql.php"; // Where is your lsl2mysql.php ?
string Securekey = "Lu4LGYu4RLtvR3mP"; // This is your secret key (Some basic security to block random people from hacking your url)

Send()
{
	string url = phpurl+"?"
	+ "Uuid=" + llEscapeURL(llGetKey())
	+ "&Objectname=" + llEscapeURL(llGetObjectName())
	+ "&Type=" + llEscapeURL((string)Type)
	+ "&Securekey=" + llEscapeURL(Securekey)
	+ "&Method=" + "add";

	if (debug) llSay(0,"Sent : "+(url));
	llHTTPRequest(url, [], "");
}

default
{
	state_entry()
	{
		Send();
	}
}