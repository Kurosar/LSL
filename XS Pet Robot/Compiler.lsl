// :CATEGORY:XS Pet
// :NAME:XS Pet Robot
// :AUTHOR:Ferd Frederix
// :KEYWORDS: Pet,XS,breed,breedable,companion,Ozimal,Meeroo,Amaretto,critter,Fennux,Pets
// :CREATED:2013-09-06
// :EDITED:2014-01-30 12:24:21
// :ID:988
// :NUM:1457
// :REV:0.50
// :WORLD:Second Life, OpenSim
// :DESCRIPTION:
// XS Pet Compiler
// :CODE:

// Author: Ferd Frederix
// This prim animator compiler is a very useful and easy to use script for Second Life and OpenSim. Setup is very simple. Just drop the two script into the object, click the object, and give your animation a name. Move all the prims around, and click Record. When done, click the Compile button. It writes fast, optimized code for you.

// Downloaded from : http://www.outworldz.com/cgi/freescripts.plx?ID=1691

// This program is free software; you can redistribute it and/or modify it.
// Additional Licenes may apply that prevent you from selling this code
// and these licenses may require you to publish any changes you make on request.
//
// There are literally thousands of hours of work in these scripts. Please respect
// the creators wishes and Copyright law and follow their license requirements.
//
// License information included herein must be included in any script you give out or use.
// Licenses may also be included in the script or comments by the original author, in which case
// the authors license must be followed, and  their licenses override any licenses outlined in this header.
//
// You cannot attach a license to any of these scripts to make any license more or less restrictive.
//
// All scripts by avatar Ferd Frederix, unless stated otherwise in the script, are licensed as Creative Commons By Attribution and Non-Commercial.
// Commercial use is NOT allowed - no resale of my scripts in any form.  
// This means you cannot sell my scripts but you can give them away if they are FREE.  
// Scripts by Ferd Frederix may be sold when included in a new object that actually uses these scripts. Putting my script in a prim and selling it on marketplace does not constitute a build.
// For any reuse or distribution, you must make clear to others the license terms of my works. This is done by leaving headers intact.
// See http://creativecommons.org/licenses/by-nc/3.0/ for more details and the actual license agreement.
// You must leave any author credits and any headers intact in any script you use or publish.
///////////////////////////////////////////////////////////////////////////////////////////////////
// If you don't like these restrictions and licenses, then don't use these scripts.
//////////////////////// ORIGINAL AUTHORS CODE BEGINS ////////////////////////////////////////////
// This script produces optimized LSL code that can be triggered by link messages.   
// fred@mitsi.com
// 3-7-2012
// Rev B, added a missing } at the end of multiple recordings.


// Author: Ferd Frederix
// Based on an excellent script by Allen Firethorn
// This is free software, it is not for sale at any price


// Tunable stuff:
integer OpenSim = FALSE;    // Set to FALSE for Second Life to save memory
string fast="Fast";        // Set this to an empty string if you don't want to use the fast animation
integer debug = FALSE;      // set to TRUE to see stuff inside as it runs

list animations;      // holds a list of all animation names
list receivedData;    // the data from the main program
integer STRIDE = 5;    // size of the data packets in receivedData
integer currentLine;  // the line we are processing

// Link messages
integer CLEAR = -234756;
integer DATA = -234757;
integer COMPILE = -234758;
integer DIE = -234759;

DEBUG(string msg)
{
    if (debug) llOwnerSay("// " + msg);
}

// speak without the name of the prim in the way
SayCode (string story){
    llOwnerSay (story);
    llSleep(0.1);

}

default {

    link_message(integer sender_num,integer num, string msg, key id)    {

        if (num == DIE && msg =="die")  // clear
        {
            llOwnerSay("Compiler has been removed");
            if (! debug) {
                llRemoveInventory(llGetScriptName());
            }
        }

        if (num == CLEAR)  // clear
        {
            animations = [];
            receivedData = [];
            currentLine = 0;
            llOwnerSay("Compiler Ready");
        }
        else if (num == DATA)  // data
        {
            // data formatted like this:
            //  name|primnum|vector Pos|rotation rot|vector size
            // test1|2|<0.026306,-0.150208,0.191069>|<-0.000008,0.956309,-0.292356,0.000000>|<0.074010,0.074010,0.074010>
            list primList = llParseString2List(msg,["|"],[]);
            string name = llList2String(primList,0);

            receivedData += name;
            receivedData += (float) llList2String(primList,1);    // prim Number or ms to sleep
            receivedData += (vector) llList2String(primList,2);     // pos
            receivedData += (rotation) llList2String(primList,3);        // rot
            receivedData += (vector) llList2String(primList,4);     // size

            // Store the name of the animation if it is not already stored
            integer i = llListFindList(animations, [name]);

            if( i < 0 ){
                DEBUG("Adding Animation named " + name);
                animations += name;
            }

            currentLine++;
        }
        else if (num == COMPILE) // finish, compile it
        {

            //DEBUG("Animations:" + llDumpList2String(animations,":"));
            //DEBUG("Length:" + ((string) llGetListLength(animations)));
            //DEBUG("history:" + llDumpList2String(receivedData,":"));
            //DEBUG("Length:" + ((string) llGetListLength(receivedData)));


            string code;
            integer i;

            llOwnerSay("Compiler processing " + (string)currentLine + " prim movements and " + (string) llGetListLength(animations) + " animations");

            llOwnerSay("Copy everything below this line and paste it into a new script\n");

            string oldname = llGetObjectName ();
            llSetObjectName ("Compiler");

            vector scale = llGetScale();
            SayCode("// Prim animation compiler //\n"
                + "// Ferd Frederix - http://www.outworldz.com\n"
                + "integer playbackchannel = 1; // The default llMessageLinked number\n"
                + "rotation calcChildRot(rotation rdeltaRot){\n"
                + "\tif (llGetAttached())\n"
                + "\t\treturn rdeltaRot/llGetLocalRot();\n"
                + "\telse\n"
                + "\t\treturn rdeltaRot/llGetRootRotation();\n"
                + "}\n"
                + "vector originalScale = "
                + (string) scale
                + ";"
                );



            // Go through each animation and create a function for each one
            for(i = 0; i < llGetListLength(animations); i++){
                integer j;
                string animationName = llList2String(animations, i);

                //DEBUG("Processing " + animationName);

                SayCode(animationName
                    + "(){\n"
                    + "\tvector currentSize = llGetScale();\n"
                    + "\tfloat scaleby = currentSize.x/originalScale.x;\n"
                    );



                //Read through the list and print out the instructions for this animation
                integer count = llGetListLength(receivedData);
                for(j=0; j < count; j += STRIDE)
                {
                    string name = llList2String(receivedData,j);
                    float primNum = (float) llList2String(receivedData,j+1);

                    //DEBUG("name: " + name + " Prim Num: " + primNum);
                    if( name == animationName){
                        if(primNum > 1){        // not a root prim or sleep
                            SayCode( "\tllSetLinkPrimitiveParams"
                                + fast
                                + "("
                                + (string) ((integer)primNum)
                                + ", [PRIM_POSITION, "
                                + (string) llList2Vector(receivedData,j+2)
                                + "*scaleby, "
                                + "PRIM_ROTATION,calcChildRot("
                                + (string) llList2Rot(receivedData,j+3)
                                + "), "
                                + "PRIM_SIZE, "
                                + (string) llList2Vector(receivedData,j+4)
                                + "*scaleby]);"
                                );
                        } else {
                                SayCode("\tllSleep("
                                    +(string)(primNum*-1) // negative numbers are sleep times
                                +");"
                                );
                        }
                    } // if name
                }  // for j
                SayCode ("\n}");
            } // for animations

            SayCode (
                "\n\n"
                    + "default{\n"
                );
            if (!OpenSim)
                SayCode("\tstate_entry(){\n"
                    +"\t\tllSetMemoryLimit(llGetUsedMemory() + 512);\n"
                + "\t\t}");

            code = "\n\tlink_message(integer sender_num, integer num, string message, key id){\n"+
                "\t\tif(num == playbackchannel){\n";
            for(i=0; i<llGetListLength(animations);i++){
                code+="\t\t\tif(message == \""+llList2String(animations,i)+"\"){\n"+
                    "\t\t\t\t"+llList2String(animations,i)+"();\n"+
                    "\t\t\t}\n";
            }
            code += "\t\t}\n"+
                "\t}\n}";
            SayCode(code);

            SayCode("//  Done!  Copy everything above to a new script, and Search/Replace the time stamp and Compiler: on the left to be blank");
            llSetObjectName (oldname);

        }
    }


}




