// :SHOW:1
// :CATEGORY:NPC
// :NAME:All In One NPC Recorder and Player
// :AUTHOR:Ferd Frederix
// :KEYWORDS:
// :CREATED:2015-07-17 13:16:51
<<<<<<< HEAD
// :EDITED:2016-07-10  09:24:25
=======
>>>>>>> f0df6f03553fbf82e10f35590fcf71af838ab4be
// :ID:27
// :NUM:1811
// :REV:1
// :WORLD:Opensim
// :DESCRIPTION:
// Sample touch to trigger a NPC script
// :CODE:

default
{
	state_entry() {
		llSetText("Click to make the NPC say hello",<1,1,1>,1.0);
	}

	touch_start(integer total_number)
	{
		llMessageLinked(LINK_ROOT, 0, "@say=Hello there, " + llDetectedName(0), "");
	}
}
