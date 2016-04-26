integer mod(integer x, integer m)
{
    return (x % m + m) % m;
}

default
{
    state_entry()
    {
        llSay(0, (string)mod(11,5));
    }
}
