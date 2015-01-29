
default
{
    state_entry()
    {
        llListen(0,"",NULL_KEY,"");
    }
    listen(integer channel, string name, key id, string message)
    {
        integer index = llSubStringIndex(llToLower(message),"poke");
        if(index != -1) {
            if (id != llGetOwner()) {
                if (llGetDisplayName(id) != "")
                llSay(0,llGetDisplayName(llGetOwner())+" poked "+llGetDisplayName(id)+".");
            }
        }
    }
}