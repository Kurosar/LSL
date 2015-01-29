// Create notecard in inventory, one name per line (use legacy secondlife name (withouth the "resident extension")

// VARIABLES (DO NOT EDIT)
string cardname;
integer gLine = 0;
key gQueryID;
string avname;
integer open;

default
{
    state_entry()
    {
        cardname = llGetInventoryName(INVENTORY_NOTECARD,0);
    }

    touch_start(integer total_number)
    {
        gLine = 0; // Reset Line Count
        avname = llGetUsername(llDetectedKey(0));
        gQueryID = llGetNotecardLine(cardname, gLine);
    }
    
    changed(integer change)
    {
        if (change & CHANGED_INVENTORY)
        {
            llResetScript();
        }
    }

    dataserver(key query_id, string data)
    {
        if (query_id == gQueryID){
            if (data != EOF){ 
                if (data == avname){
                    gLine = 0;
                    llSay(0,"Access"); // ACCESS                  
                }
                else{ 
                    ++gLine; 
                    gQueryID = llGetNotecardLine(cardname, gLine);
                }
            }
            else llSay(0,"Denied"); // DENIED
        }
    }
}