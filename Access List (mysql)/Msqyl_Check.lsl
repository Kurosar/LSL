string phpurl = "http://localhost/php2mysql.php"; // Where is your lsl2mysql.php ?

key id;

Send()
{
    string url = phpurl+"?"
    + "uuid=" + llEscapeURL(id)
    + "&acces=" + llEscapeURL(llGetObjectName());
    llHTTPRequest(url, [], "");
}

default
{
    touch_start(integer number)
    {
        id = llDetectedKey(0);
        Send();
    }

    http_response(key request_id, integer status, list metadata, string body)
    {
        if (body == "TRUE")
        {
            llSay(0,"AUTORISE");
        }
        else if (body == "FALSE")
        {
            llSay(0,"REFUSE");
        }
    }    
}