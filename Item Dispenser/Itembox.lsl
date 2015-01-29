// Setup
string itemName = "Test Item"; // Name of the stored item
integer itemNumber = 10; // Number of items inside the box

// Variables (DO NOT EDIT BELLOW THIS LINE)
integer scriptReady = FALSE;

refreshText()
{
    llSetText(itemName +"\n"+ (string)itemNumber, <255,255,255>, 1);
}


default
{
    state_entry()
    {
        if (llGetInventoryNumber(INVENTORY_OBJECT) > 1) {
            llOwnerSay("ERROR : There are more than one object inside the inventory.");
            scriptReady = FALSE;
        }
        else if (llGetInventoryNumber(INVENTORY_OBJECT) == 0) {
            llOwnerSay("ERROR : There is no object inside the inventory.");
            scriptReady = FALSE;
        }
        else {
            llOwnerSay("Box of "+itemName+" ready. ("+(string)itemNumber+" Units)");
            refreshText();
            scriptReady = TRUE;
        }
    }

    touch_start(integer num_detected)
    {
        if (scriptReady) {
            if (itemNumber > 0) {
                itemNumber--;
                llGiveInventory(llDetectedKey(0), llGetInventoryName(INVENTORY_OBJECT, 0));
                refreshText();
            }
            else {
                llInstantMessage(llDetectedKey(0), "That box is empty. ("+(string)itemNumber+" Units)");
            }
        }
        else llResetScript();
    }

    changed(integer change)
    {
        if(change & (CHANGED_INVENTORY)) llResetScript();
    }
}