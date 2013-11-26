default
{
    state_entry()
    {
        llSensorRepeat("", NULL_KEY, AGENT, 5, PI, 1);
    }
 
    sensor(integer num_detected)
    {
        integer group_members;
        integer i;
        do
        {
            key id = llDetectedKey(i);
            if (llSameGroup(id))
            { 
                ++group_members;
            }
        }
        while (++i < num_detected);
        
        integer defenders = group_members;
        integer attackers = num_detected - group_members;
        llSay(0,"Attackers : "+(string)attackers);
        llSay(0,"Defenders : "+(string)defenders);
    }
}