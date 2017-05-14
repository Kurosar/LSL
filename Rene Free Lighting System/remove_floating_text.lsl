// :SHOW:1
// :CATEGORY:Light
// :NAME:Rene Free Lighting System
// :AUTHOR:Rene10957 Resident
// :KEYWORDS: light,lamp,lighting light
// :CREATED:2015-06-11 14:41:54
// :EDITED:2016-03-30  20:29:28
// :ID:1079
// :NUM:1788
// :REV:1
// :WORLD:Opensim
// :DESCRIPTION:
// Removes floating text and then removes itself
// :CODE:
// :LICENSE: CC0 (Public Domain)

// Removes floating text and then removes itself

default
{
	state_entry()
	{
		llSetLinkPrimitiveParamsFast(LINK_SET, [PRIM_TEXT, "", ZERO_VECTOR, 0.0]);
		llRemoveInventory(llGetScriptName());
	}
}
