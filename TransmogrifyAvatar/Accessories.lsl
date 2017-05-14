// :CATEGORY:Transmogrify
// :NAME:TransmogrifyAvatar
// :AUTHOR:Ferd Frederix
// :CREATED:2013-09-08
// :EDITED:2014-01-01 12:18:57
// :ID:921
// :NUM:1321
// :REV:1
// :WORLD:Second Life
// :DESCRIPTION:
// for anything you wear
// :CODE:
// Transmogrifyer script
// License: CC-BY. Please do not remove the copyright or this notice
// Author: Ferd Frederix

// For all your worn accessories (not the pet)
// makes accessories like shoes and hair disappear when you fly.

integer ownerchannel;
integer listener;

setlisten()
{
    if (listener)  {
        llListenRemove(listener);
    }
    listener = llListen(ownerchannel,"","","");
}


hide_show( float alpha)
{
    integer j = llGetNumberOfPrims();
    integer k = 2; // do it twice to get rid of lost packets
    while (k--)
    {       
        integer i;
        for ( i = 0; i <= j; i++) {
            llSetLinkAlpha(i,alpha, ALL_SIDES);
        }
    }
}


default
{
    state_entry()
    {
        ownerchannel = (integer)("0xF" + llGetSubString( (string)llGetOwner(), 0, 6 ));
        hide_show(0);    // 0 = invisible
        setlisten();
    }

    
    on_rez(integer param)
    {
        hide_show(1); // 1= visible
        setlisten();
    }
    
    changed(integer what)
    {
        // no reset needed, we just need to re-establish a listener
        if (what & CHANGED_REGION)
            setlisten();
        
        if(what & CHANGED_OWNER)
            llResetScript();
    }
    
    listen(integer channel, string name, key id, string msg)
    {    
        if (msg == "pet") {
            hide_show(0);
        } else if (msg == "avatar") {
            hide_show(1);
        }
    }
}
