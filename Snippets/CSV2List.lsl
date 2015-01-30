string mystring = "un,deux,trois";
list mylist = llCSV2List(mystring); // ["un","deux","trois"];

default
{
    state_entry()
    {
       llSay(0, llList2String(mylist,0) ); // "un"
       llSay(0, llList2String(mylist,1) ); // "deux"
       llSay(0, llList2String(mylist,2) ); // "trois"
   }
}