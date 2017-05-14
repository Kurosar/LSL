// :CATEGORY:XS Pet
// :NAME:XS Pet Robot
// :AUTHOR:Ferd Frederix
// :KEYWORDS: Pet,XS,breed,breedable,companion,Ozimal,Meeroo,Amaretto,critter,Fennux,Pets
// :CREATED:2013-09-06
// :EDITED:2014-01-30 12:24:20
// :ID:988
// :NUM:1433
// :REV:0.50
// :WORLD:Second Life, OpenSim
// :DESCRIPTION:
// XS Pet xs_debug

// :CODE:

// xs_debug

// The xs_debug script can be put into a pet or a prim nearby to see what is happening.
// If put into a prim nearby, xs_debug can only hear the chat back and forth as the animals communicate with food bowls and look for each other to have sex ( or find the home post).
// If put into the food bowl, it can hear any chat, as well as report on link messages inside the food bowl.
// When put inside a pet it gets very chatty, as it reports on the movement link messages as the pet tries to move.
// If you get anything that looks like pure gibberish, then check the encryption flag.
// The text that is output should look like this as an example :  and XS_PET^FOOD_CONSUME^765643-39463845-65432-8231484^24623^.....
// You can then look in the code and see what is going on that matches these strings, or email the output to fred@mitsi.com  and I can see that is happening.


// DEBUG:

// Here is a xs_debug dump of the pets being made:

// --------------------- PACKAGING the EGG--------------------
// an egg has been rezzed, this is what happens when you package it

// [11:15] Nut and Bolt whispers: Color: <0.00000, 1.00000, 0.00000>
// [11:15] Nut and Bolt whispers: Color: <0.00000, 0.00000, 1.00000>
// [11:15] Nut and Bolt whispers: Shine: None
// [11:15] Nut and Bolt whispers: Glow: 0%
// [11:15] Nut and Bolt whispers: Special: Normal
// [11:15] Nut and Bolt whispers: Generation: 0

// Now the egg has been packaged and unpacked, so there is a pet robot inside the pet robot and a new egg:
// UNPACKAGED NOW

// [11:15] Troubot: Troubot: LINK_AGE_START  : string: : key:
// [11:15] Troubot: Troubot:channel:ANIMAL_CHANNEL:XSPET^CONFIG^9d1a7863-ae14-c23f-e8e0-526685e2588c^<0.00000, 1.00000, 0.00000>^<0.00000, 0.00000, 1.00000>^2^0^0.000000^0^0^0^Troubot^0^Normal
// [11:15] Troubot: Troubot: LINK_TEXTURE  : string:<0.00000, 1.00000, 0.00000>^<0.00000, 0.00000, 1.00000>^2^0^0.000000^ : key:00000000-0000-0000-0000-000000000000
// [11:15] Troubot: Troubot: LINK_COLOR1  : string:<0.00000, 1.00000, 0.00000> : key:
// [11:15] Troubot: Troubot: LINK_COLOR2  : string:<0.00000, 0.00000, 1.00000> : key:
// [11:15] Troubot: Troubot: LINK_SEX  : string:2 : key:
// [11:15] Troubot: Troubot: LINK_SHINE  : string:0 : key:
// [11:15] Troubot: Troubot: LINK_GLOW  : string:0.000000 : key:
// [11:15] Troubot: Troubot: LINK_GEN  : string:0 : key:
// [11:15] Troubot: Troubot: LINK_MAGE  : string:0 : key:
// [11:15] Troubot: Troubot: LINK_SPECIAL  : string:Normal : key:
// [11:15] Troubot: Troubot: LINK_DAYTIME  : string: : key:
// [11:15] Troubot: Troubot: LINK_GET_AGE  : string: : key:
// [11:15] Troubot: Troubot: LINK_PUT_AGE  : string:0 : key:
// [11:15] Troubot: Troubot:channel:ANIMAL_CHANNEL:XSPET^HOME_LOCATION^<33.24266, 211.12510, 600.72560>^2
// [11:16] Troubot: xs_Debug is loaded into this item.
// [11:16] Troubot whispers: Color1: <0.00000, 1.00000, 0.00000>
// [11:16] Troubot whispers: Color2: <0.00000, 0.00000, 1.00000>
// [11:16] Troubot whispers: Shine: None
// [11:16] Troubot whispers: Glow: 0%
// [11:16] Troubot whispers: Special: Normal
// [11:16] Troubot whispers: Sex: Female
// [11:16] Troubot whispers: Color2: <0.00000, 0.00000, 1.00000>
// [11:16] Troubot whispers: Age: 0 days
// [11:16] Troubot whispers: Generation: 0

// Now I click the flag:

// [11:16] Home Flag: Setting Home Location
// [11:16] Troubot: Troubot: LINK_SET_HOME  : string:<33.24266, 211.12510, 600.72560>^10.000000 : key:

// At this point the pet starts moving:

// [11:16] Troubot: Troubot: ANIMATE_PRIM : string:stand : key:
// [11:16] Troubot: Troubot: ANIMATE_PRIM : string:wave : key:
// [11:16] Troubot: Troubot: ANIMATE_PRIM : string:stand : key:
// [11:16] Troubot: Troubot: LINK_SOUND  : string: : key:
// [11:16] Troubot: Troubot: ANIMATE_PRIM : string:left : key:
// ....
// ....

// Now we package the pet into a transport UFO

// [11:17] Troubot whispers: Looking for a Transport UFO...
// [11:17] Troubot: Troubot:channel:ANIMAL_CHANNEL:XSPET^CRATE_PONG^9d1a7863-ae14-c23f-e8e0-526685e2588c^0.280000
// [11:17] Troubot: Troubot:channel:ANIMAL_CHANNEL:XSPET^CRATE_PONG^9d1a7863-ae14-c23f-e8e0-526685e2588c^0.280000

// Now we un-package the pet into a transport UFO


// [11:17] Transport UFO:Troubot whispers: Color 1: <0.00000, 1.00000, 0.00000>
// [11:17] Transport UFO:Troubot whispers: Color 2: <0.00000, 0.00000, 1.00000>
// [11:17] Transport UFO:Troubot whispers: Shine: None
// [11:17] Transport UFO:Troubot whispers: Glow: 0%
// [11:17] Transport UFO:Troubot whispers: Special: Normal
// [11:17] Transport UFO:Troubot whispers: Sex: Female
// [11:17] Transport UFO:Troubot whispers: Age: 0 days
// [11:17] Transport UFO:Troubot whispers: Generation: 0
// [11:17] Troubot: Troubot: LINK_AGE_START  : string: : key:
// [11:17] Troubot: Troubot:channel:ANIMAL_CHANNEL:XSPET^CONFIG^a75001e9-4eae-e4f1-4728-be19cd7f5717^<0.00000, 1.00000, 0.00000>^<0.00000, 0.00000, 1.00000>^2^0^0.000000^0^0^0^Troubot^0^Normal
// [11:17] Troubot: Troubot: LINK_TEXTURE  : string:<0.00000, 1.00000, 0.00000>^<0.00000, 0.00000, 1.00000>^2^0^0.000000^ : key:00000000-0000-0000-0000-000000000000
// [11:17] Troubot: Troubot: LINK_COLOR1  : string:<0.00000, 1.00000, 0.00000> : key:
// [11:17] Troubot: Troubot: LINK_COLOR2  : string:<0.00000, 0.00000, 1.00000> : key:
// [11:17] Troubot: Troubot: LINK_SEX  : string:2 : key:
// [11:17] Troubot: Troubot: LINK_SHINE  : string:0 : key:
// [11:17] Troubot: Troubot: LINK_GLOW  : string:0.000000 : key:
// [11:17] Troubot: Troubot: LINK_GEN  : string:0 : key:
// [11:17] Troubot: Troubot: LINK_MAGE  : string:0 : key:
// [11:17] Troubot: Troubot: LINK_SPECIAL  : string:Normal : key:
// [11:17] Troubot: Troubot: LINK_DAYTIME  : string: : key:
// [11:17] Troubot: Troubot: LINK_GET_AGE  : string: : key:
// [11:17] Troubot: Troubot: LINK_PUT_AGE  : string:0 : key:
// [11:17] Troubot: Troubot:channel:ANIMAL_CHANNEL:XSPET^HOME_LOCATION^<33.24266, 211.12510, 600.72560>^10
// [11:17] Troubot: Troubot: LINK_SET_HOME  : string:<33.24266, 211.12510, 600.72560>^10.000000 : key:
// [11:17] Troubot: Troubot: ANIMATE_PRIM : string:stand : key:
// [11:17] Troubot: Troubot: ANIMATE_PRIM : string:wave : key:
// [11:17] Troubot: Troubot: ANIMATE_PRIM : string:stand : key:
// [11:17] Troubot: Troubot: LINK_SOUND  : string: : key:
// [11:17] Troubot: Troubot: ANIMATE_PRIM : string:left : key:
// [11:17] Troubot: Troubot: ANIMATE_PRIM : string:right : key:

// and off the pet walks....


// Pregnancy:

// [18:14]  male whispers: male gets a gleam in his eye.
// [18:14]  male: male: LINK_SEEK_FEMALE  : string:: key:
// [18:14]  female: female:channel:ANIMAL_CHANNEL:XSPET^MALE_BREED_CALL^c3c55ba1-b3f3-40e2-94ce-bb87dbe29d79
// [18:14]  female whispers: female blushes then bobs her head up and down.
// [18:14]  female: female: LINK_MALE_BREED_CALL  : string:: key:
// [18:14]  female: female: LINK_SIGNAL_ELIGIBLE : string:: key:
// [18:14]  male: male:channel:ANIMAL_CHANNEL:XSPET^FEMALE_ELIGIBLE^<16.44526, 99.32597, 21.14289>
// [18:14]  male: male: LINK_FEMALE_ELIGIBLE  : string:: key:000cd83a-667d-4ab2-a08c-03011718fcfd
// [18:14]  male: male: LINK_CALL_MALE  : string:: key:000cd83a-667d-4ab2-a08c-03011718fcfd
// [18:14]  female: female:channel:ANIMAL_CHANNEL:XSPET^MALE_ON_THE_WAY^000cd83a-667d-4ab2-a08c-03011718fcfd
// [18:14]  female: female: LINK_MALE_ON_THE_WAY  : string:: key:c3c55ba1-b3f3-40e2-94ce-bb87dbe29d79
// [18:14]  female: female: LINK_MOVER  : string:200.000000: key:
// [18:14]  male: male:channel:ANIMAL_CHANNEL:XSPET^FEMALE_LOC^c3c55ba1-b3f3-40e2-94ce-bb87dbe29d79^<16.70987, 100.10620, 21.28637>
// [18:14]  male: male: LINK_FEMALE_LOCATION  : string:<16.70987, 100.10620, 21.28637>
// [18:14]  male: male: ANIMATE_PRIM : string:wave: key:
// [18:16]  female: female:channel:API_CHANNEL:XSPet^c3c55ba1-b3f3-40e2-94ce-bb87dbe29d79^<0.00000, 0.00000, 1.00000>^<1.00000, 0.00000, 0.00000>^0^0.000000^Normal
// [18:16]  male: male: ANIMATE_PRIM : string:wave: key:
// [18:16]  male: male: LINK_RQST_BREED  : string:: key:
// [18:16]  male: male: LINK_CALL_MALE_INFO  : string:: key:000cd83a-667d-4ab2-a08c-03011718fcfd
// [18:16]  male: male: LINK_MALE_INFO  : string:: key:
// [18:16]  male: male: LINK_GET_AGE  : string:: key:
// [18:16]  female: female:channel:ANIMAL_CHANNEL:XSPET^MALE_INFO^000cd83a-667d-4ab2-a08c-03011718fcfd^<0.00000, 0.00000, 1.00000>^<1.00000, 0.00000, 0.00000>^0^0.000000^0^0
// [18:16]  male: male: LINK_PUT_AGE  : string:7: key:
// [18:16]  female: female: LINK_PREGNANT  : string:: key:
// [18:16]  male: male:channel:API_CHANNEL:I'm Pregnant!

// at this point the female is pregnant.If you touch it it will show in hovertext






// START OF COPIED file 'Global Constants.txt' from the Debug folder.  It has to be the same in all files
// If you change this in any script, change it in all of them, please. It works a lot better that way.

// This is code based on Version 0.50 01-30-2014
// For version history, see file revisions.txt
//
// LICENSE
/////////////////////////////////////////////////////////////////////
// This code is licensed as Creative Commons Attribution/NonCommercial/Share Alike
// See http://creativecommons.org/liceses/by-nc-sa/3.0/
// Noncommercial -- You may not use this work for commercial purposes, i.e., you cannot sell this script in any form, including derivatives.
// If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.
// This means that you cannot sell this or derivative code by itself, but you may share and use this code in any object or virtual world.
// You must attribute authorship in the original scripts to Ferd Frederix and Xundra Snowpaw, and leave this notice intact.
// You do not have to give back to the community any changes you make, however, code changes would be greatly appreciated!
//
// Exception: I am allowing this script to be used in an original build and sold with the build.
// You are not selling the script, you are selling the build. If you want to sell these scripts, write your own or use the original at http://code.google.com/p/xspets/
// Note: Xundra Snowpaw's license was 'New BSD' license and adding additional licenses is allowed.

// Based on code from Xundra Snowpaw
// New BSD License: http://www.opensource.org/licenses/bsd-license.php
// Copyright (c) 2010, Xundra Snowpaw
// All rights reserved.
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

//* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer
// in the documentationand/or other materials provided with the distribution.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
// BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
////////////////////////////////////////////////////////////////////

// DEBUG - lets you see and hear wtf is happening
integer debug = FALSE;        // set to TRUE TO hear a lot of chat


// This  section has a few tuneable items that MUST be changed for any new pet

// SECURITY
string  SECRET_PASSWORD = "top secret string";    // must use a password unique to any species of animal, when ENCRYPT= TRUE. Otherwise you will find Pet type A fucking pet type B.
integer SECRET_NUMBER = 99999;             		  // any number thats a secret, not necessary to change usually, this is used when pets are born and eggs are rezzed to establish a comm channel.
integer ENCRYPT = TRUE;                           // set to TRUE to encrypt all data, Some Opensim worlds prefer FALSE due to parsing bugs, TRUE is the most secure. If FALSE you MUST change the FOOD_CHANNEL and other channels for different pets. or they will literally fuck each other.

// if you add the UUID for your avatar here, you can change it later
// and other alts or friends can change it too, and all of you can work on these pets.
// If you leave it blank, only the creator of the root prim can work on these pets.
key YOUR_UUID = "";

// PET NAMES  - YOU MUST CHANGE THEM HERE AND IN THE ROOT PRIM OF THE OBJECT - THEY MUST MATCH EXACTLY
/////////////////////////
string MaleName = "Troubot";        // Must be the name of your animal
string FemaleName = "Troubot";        // The name of the female pet, if a different shape or prim count. Can be the same as the Male for pets like the robot that are unisex.
string Egg = "Nut and Bolt";      // was 'XS Egg', must be the name of your egg
string Crate = "Transport Spaceship";   // was XS-Cryocrate, must be the name of the crate you package pets in
string HomeObject = "Home Flag"; // was "XS Home Object", must be the name of your Home Post indicator
string EggCup = "Toolbox";      // was "XS Egg Cup", must be the name of your egg holder
// any other object names are 'do not cares'.

// NOTHING NEEDS TO BE CHANGED BELOW, BUT CAN BE CHANGED IF YOU DO IT EVERYWHERE

// misc tunables
float GROWTH_AMOUNT = 0.10; 			// 10% size increase each day for MaxAge days = 200% (double size after 7 days)
integer MaxAge = 7;              		// stop growing in seven days.  10% growth compounded daily means that your pet will be 194% larger ( 2x, basically) in 7 days.
integer UNITS_OF_FOOD = 168;     		// food bowl food qty, used by food bowl only
float secs_to_grow = 86400;      		// grow daily = 86400 seconds
float FOOD_BOWL_SCAN_INTERVAL = 1800.0;	// look for food every 3 hours
float fPregnancy = 172800.0; 			// how many seconds to lay an egg  = 2 days or 48 hours.
float MALE_TIMEOUT = 900.0 ;            // in seconds, female waits this long in one spot for a male to arrive
float SEX_WAIT = 10800.0;               // How often they desire sex = 3 hours
float fDaysToAdult = 7;     			// 7 days to become old enough to breed.
integer SECONDS_BETWEEN_FOOD_NORMAL = 14400;	// number of seconds to get hungry = 4 hours
integer SECONDS_BETWEEN_FOOD_HUNGRY = 3600;		// number of seconds before hunger count increases = 1 hour
integer MAXIMUM_HUNGER = 30;			// They die after a month with no food.


// I control versions by Subversion Source Code Control.  But the updater needs a version numbert in world.  
// This is the Protocol version.  If you change this, then all pets with a lower version will be updated by the updater
float VERSION = 0.50;            



// the leg sizes are safe to leave alone or set to 0 if you use a thin base prim, these are from the original Quail
float LegLength = 0.064;      // length of pet leg??? - not sure
float LegOffset = 0.052399;  // This is added to the Post Z to position the pet

// the following are global constants and do not need to be changed
// Prim animation linkmessages are sent by scripts on Link Message number 1
// The strings are the names of the animations that are recorded.
// No need to change them unless you want to change names of the animations when you run the prim animator, or you add additional link messages
// If your pet walks, you need to record these names and save them in the notecard
//
// Example:
// llMessageLinked(LINK_SET, LINK_ANIMATE, ANI_STAND, "");
// The above line will play the pre-recorded 'stand up' animation "stand" using the animator script.
// The following animations are used in the pet.  You can add your own.

string  ANI_STAND = "stand";             // default standing animation
string  ANI_WALKL   = "left";           // triggers Left foot and Right arm walk animation
string  ANI_WALKR   = "right";          // triggers Right foot and Left arm walk animation
string  ANI_SLEEP  = "sleep";           // Sleeping
string  ANI_WAVE = "wave";              // Calling for sex, needs help with food, etc.

// Channel assignments
// if you change any of these constants, change it everywhere and in the list in XS_Debug so it can print them
// If you turn encryption FALSE, you MUST change these between species of pets are they will fuck with each other. Literally.

integer FOOD_CHANNEL = -999191;
integer ANIMAL_CHANNEL = -999192;
integer EGG_CHANNEL = -999193;
integer HOME_CHANNEL = -999194;
integer BOX_CHANNEL = -999195;
integer ACC_CHANNEL = -999196;
integer UPDATE_CHANNEL = -999197;
integer API_CHANNEL = -999198;

// global link messages to control the animal, never any need to change these.
// They are exposed here so they will be the same everywhere.  This uses a bit of RAM, but who cares?

integer LINK_ANIMATE = 1;          // messages on num 1 are assumed to be directed at the prim animator.
integer DECREASE_FOOD = 100;       // used in the food bowl.
integer LINK_COLOR1_GET = 101;       // to xs_egg color plugin.
integer LINK_COLOR2_GET = 102;       // to xs_egg color plugin.
integer LINK_COLOR1_PUT = 103;       // to xs_egg color plugin.
integer LINK_COLOR2_PUT = 104;       // to xs_egg color plugin.integer LINK_AGE_START = 800;      // when pet is rezzed and secret_number is sent by brain to breeder, eater and infomatic get booted up
integer LINK_TEXTURE = 801;        // ask for a new texture, or paint a color
integer LINK_BREEDNAME = 802;      // the name of the pet texture from the texture server notecard
integer LINK_FOOD_CONSUME = 900;   // from movement to brain when close to food, brain then consumes a random amount up to 10000
integer LINK_FOODMINUS = 901;    // xs_brain  receives FOOD_CONSUME, decrement hunger (eat)
integer LINK_HUNGRY = 903;        // sent by eater (string)hunger_amount, checks each hour
integer LINK_HAMOUNT = 904;       // hunger_amount = (integer)str,m updates the hunger amount in scripts
integer LINK_SET_HOME = 910;      // loc ^ dist
integer LINK_MOVER = 911;         // tell mover to rest for str seconds
integer LINK_FOODIE_CLR = 920;    // clear all food_bowl_keys and contents
integer LINK_FOODIE = 921;        // send FOOD_LOCATION coordinates to movement
integer LINK_COLOR1 = 930;             // colour1
integer LINK_COLOR2 = 931;             // colour2
integer LINK_SEX = 932;                // sex
integer LINK_SHINE = 933;              // shine
integer LINK_GLOW = 934;               // glow
integer LINK_GEN = 935;                // generation
integer LINK_RESET_SIZE = 936;          // reset size to 1
integer LINK_MAGE = 940;                // xs_brain sends, xs_ager consumes, adds str to age, if older than 7 days, will grow the animal
integer LINK_DAYTIME = 941;             // xs_ager consumes, starts a timer of 86,400 seconds in xs_ager
integer LINK_GET_AGE = 942;             // get age from xs_ager and sent it on channel 943
integer LINK_PUT_AGE = 943;             // print age from xs_ager
integer LINK_PACKAGE = 950;             // look for a cryo_crate
integer LINK_SEEK_FEMALE = 960;         // MALE_BREED_CALL
integer LINK_MALE_BREED_CALL = 961;     // triggered by LINK_SEEK_FEMALE
integer LINK_SIGNAL_ELIGIBLE = 962;     // sent by female when hears LINK_MALE_BREED_CALL
integer LINK_FEMALE_ELIGIBLE = 963;     // sent when it hears in chat FEMALE_ELIGIBLE
integer LINK_CALL_MALE = 964;           // if LINK_FEMALE_ELIGIBLE && looking_for_female
integer LINK_MALE_ON_THE_WAY = 965;     // triggered by LINK_CALL_MALE
integer LINK_FEMALE_LOCATION = 966;     // female location, sends coordinates of a female
integer LINK_RQST_BREED  = 967;         // sent when close enough to male/female
integer LINK_CALL_MALE_INFO = 968;      // sent by xs_breeding, this line of code was in error in v.24 of xs_breeding see line 557 and 636 of xs_brain which make calls and also xs_breeding which receives LINK_MALE_INFO.
integer LINK_MALE_INFO = 969;           // Breeding failed, sent info
integer LINK_LAY_EGG = 970;             // Rez Object(Egg...
integer LINK_BREED_FAIL = 971;          // key = father, failed, timed out
integer LINK_PREGNANT = 972;            // chick is preggers
integer LINK_SOUND_OFF= 974;             // sound is off
integer LINK_SOUND_ON= 973;             // sound is on
integer LINK_SLEEPING = 990;            // close eyes
integer LINK_UNSLEEPING = 991;          // open eyes
integer LINK_SOUND = 1001;              // plays a sound if enabled
integer LINK_SPECIAL = 1010;            // xs_special, if str = "Normal", removes script
integer LINK_EFFECTS_ON = 2000;         // particle effects in the packager
integer LINK_PREGNANCY_TIME = 5000;    // in seconds as str
integer LINK_SLEEP = 7999;              // disable sleep by parameter
integer LINK_TIMER = 8000;              // scan for food bowl about every 1800 seconds
integer LINK_DIE = 9999;                // death

string Copyright = " (c)2014 by Ferd Frederix";    // You cannot change this line, but you can change the code that prints it!
// See License agreements above.
//  Attribution is required, as these files are copyrighted. 


DEBUG ( string msg){
    if (debug) {
        llOwnerSay(llGetScriptName() + ":" + msg);
    }
}



///////// end global Link constants ////////

// END OF COPIED CODE










// tunable numbers to help you debug:

// put any commands you want to ignore here, this reduces spam.

list ignore = [
    "left" ,     // animate prim
    "right",
    "stand",
    1001,        // this is LINK_SOUND
    "blink",
    "eye"
        ];


// You can leave the rest alone:

// this must match and channel you might have changed, this is rarely done.
// list to print name instead of number for listener channels
list channels = [
    "FOOD_CHANNEL" , -999191,
    "ANIMAL_CHANNEL" , -999192,
    "EGG_CHANNEL" , -999193,
    "HOME_CHANNEL" , -999194,
    "BOX_CHANNEL" , -999195,
    "ACC_CHANNEL" , -999196,
    "UPDATE_CHANNEL" , -999197,
    "API_CHANNEL", -999198
        ];



// list to print name instead of number of link messages. If you add a link message, it is a good idea to add it here, too
list messages = [
    " LINK_ANIMATE", 1,
    " DECREASE_FOOD", 100,
    " LINK_COLOR1_GET", 101, // 0.53 added these 4
    " LINK_COLOR2_GET", 102,
    " LINK_COLOR1_PUT", 103,    " LINK_AGE_START " , 800,
    " LINK_TEXTURE ", 801,
    " LINK_FOOD_CONSUME " , 900,
    " LINK_FOODMINUS " , 901,
    " LINK_HUNGRY " , 903,
    " LINK_HAMOUNT " , 904,
    " LINK_SET_HOME " , 910,
    " LINK_MOVER " , 911,
    " LINK_FOODIE_CLR " , 920,
    " LINK_FOODIE " , 921,
    " LINK_COLOR1 " , 930,
    " LINK_COLOR2 " , 931,
    " LINK_SEX " , 932,
    " LINK_SHINE " , 933,
    " LINK_GLOW " , 934,
    " LINK_GEN " , 935,
    " LINK_MAGE " , 940,
    " LINK_DAYTIME " , 941,
    " LINK_GET_AGE " , 942,
    " LINK_PUT_AGE " , 943,
    " LINK_PACKAGE " , 950,
    " LINK_SEEK_FEMALE " , 960,
    " LINK_MALE_BREED_CALL " , 961,
    " LINK_SIGNAL_ELIGIBLE"  , 962,
    " LINK_FEMALE_ELIGIBLE " , 963,
    " LINK_CALL_MALE " , 964,
    " LINK_MALE_ON_THE_WAY " , 965,
    " LINK_FEMALE_LOCATION " , 966,
    " LINK_CALL_MALE_INFO " , 968,
    " LINK_RQST_BREED ", 967,
    " LINK_MALE_INFO " , 969,
    " LINK_LAY_EGG " , 970,
    " LINK_BREED_FAIL " , 971,
    " LINK_PREGNANT " , 972,
    " LINK_SOUND_ON ", 973,
    " LINK_SOUND_OFF ", 974,
    " LINK_SLEEPING " , 990,
    " LINK_UNSLEEPING " , 991,
    " LINK_SOUND " , 1001,
    " LINK_SPECIAL " , 1010,
    " LINK_EFFECTS_ON", 2000,
    " LINK_PREGNANCY_TIME " , 5000,
    " LINK_SLEEP " , 7999,
    " LINK_TIMER " , 8000,
    " LINK_DIE " , 9999
        ];



// DON'T CHANGE THE FOLLOWING! (Unless you know what you are doing!)

integer XTEA_DELTA      = 0x9E3779B9; // (sqrt(5) - 1) * 2^31
integer xtea_num_rounds = 6;
list    xtea_key        = [0, 0, 0, 0];

integer hex2int(string hex) {
    if(llGetSubString(hex,0,1) == "0x")
        return (integer)hex;
    if(llGetSubString(hex,0,0) == "x")
        return (integer)("0"+hex);
    return(integer)("0x"+hex);
}


// Convers any string to a 32 char MD5 string and then to a list of
// 4 * 32 bit integers = 128 bit Key. MD5 ensures always a specific
// 128 bit key is generated for any string passed.
list xtea_key_from_string( string str )
{
    str = llMD5String(str,0); // Use Nonce = 0
    return [    hex2int(llGetSubString(  str,  0,  7)),
        hex2int(llGetSubString(  str,  8,  15)),
        hex2int(llGetSubString(  str,  16,  23)),
        hex2int(llGetSubString(  str,  24,  31))];
}

// Encipher two integers and return the result as a 12-byte string
// containing two base64-encoded integers.
string xtea_encipher( integer v0, integer v1 )
{
    integer num_rounds = xtea_num_rounds;
    integer sum = 0;
    do {
        // LSL does not have unsigned integers, so when shifting right we
        // have to mask out sign-extension bits.
        v0  += (((v1 << 4) ^ ((v1 >> 5) & 0x07FFFFFF)) + v1) ^ (sum + llList2Integer(xtea_key, sum & 3));
        sum +=  XTEA_DELTA;
        v1  += (((v0 << 4) ^ ((v0 >> 5) & 0x07FFFFFF)) + v0) ^ (sum + llList2Integer(xtea_key, (sum >> 11) & 3));

    } while( num_rounds = ~-num_rounds );
    //return only first 6 chars to remove "=="'s and compact encrypted text.
    return llGetSubString(llIntegerToBase64(v0),0,5) +
        llGetSubString(llIntegerToBase64(v1),0,5);
}

// Decipher two base64-encoded integers and return the FIRST 30 BITS of
// each as one 10-byte base64-encoded string.
string xtea_decipher( integer v0, integer v1 )
{
    integer num_rounds = xtea_num_rounds;
    integer sum = XTEA_DELTA*xtea_num_rounds;
    do {
        // LSL does not have unsigned integers, so when shifting right we
        // have to mask out sign-extension bits.
        v1  -= (((v0 << 4) ^ ((v0 >> 5) & 0x07FFFFFF)) + v0) ^ (sum + llList2Integer(xtea_key, (sum>>11) & 3));
        sum -= XTEA_DELTA;
        v0  -= (((v1 << 4) ^ ((v1 >> 5) & 0x07FFFFFF)) + v1) ^ (sum + llList2Integer(xtea_key, sum  & 3));
    } while ( num_rounds = ~-num_rounds );

    return llGetSubString(llIntegerToBase64(v0), 0, 4) +
        llGetSubString(llIntegerToBase64(v1), 0, 4);
}

// Encrypt a full string using XTEA.
string xtea_encrypt_string( string str ){
    if (! ENCRYPT)
        return str;

    // encode string
    str = llStringToBase64(str);
    // remove trailing =s so we can do our own 0 padding
    integer i = llSubStringIndex( str, "=" );
    if ( i != -1 )
        str = llDeleteSubString( str, i, -1 );

    // we don't want to process padding, so get length before adding it
    integer len = llStringLength(str);

    // zero pad
    str += "AAAAAAAAAA=";

    string result;
    i = 0;

    do {
        // encipher 30 (5*6) bits at a time.
        result += xtea_encipher(llBase64ToInteger(llGetSubString(str,   i, i + 4) + "A="), llBase64ToInteger(llGetSubString(str, i+5, i + 9) + "A="));
        i+=10;
    } while ( i < len );

    return result;
}

// Decrypt a full string using XTEA
string xtea_decrypt_string( string str ) {
    if (! ENCRYPT)
        return str;

    integer len = llStringLength(str);
    integer i=0;
    string result;
    //llOwnerSay(str);
    do {
        integer v0;
        integer v1;

        v0 = llBase64ToInteger(llGetSubString(str,   i, i + 5) + "==");
        i+= 6;
        v1 = llBase64ToInteger(llGetSubString(str,   i, i + 5) + "==");
        i+= 6;

        result += xtea_decipher(v0, v1);
    } while ( i < len );

    // Replace multiple trailing zeroes with a single one

    i = llStringLength(result) - 1;
    while ( llGetSubString(result, i - 1, i) == "AA" ){
        result = llDeleteSubString(result, i, i);
        i--;
    }
    i = llStringLength(result) - 1;
    //    while (llGetSubString(result, i, i + 1) == "A" ) {
    //        i--;
    //    }
    result = llGetSubString(result, 0, i+1);
    i = llStringLength(result);
    integer mod = i%4; //Depending on encoded length diffrent appends are needed
    if(mod == 1) result += "A==";
    else if(mod == 2 ) result += "==";
    else if(mod == 3) result += "=";

    return llBase64ToString(result);
}


///////////////// Main code bgins /////////////////

default
{
    state_entry()
    {
        xtea_key = xtea_key_from_string(SECRET_PASSWORD);
        llListen(FOOD_CHANNEL,"","","");
        llListen(ANIMAL_CHANNEL,"","","");
        llListen(HOME_CHANNEL,"","","");
        llListen(BOX_CHANNEL,"","","");
        llListen(ACC_CHANNEL,"","","");
        llListen(UPDATE_CHANNEL,"","","");
        llListen(EGG_CHANNEL,"","","");
        llListen(API_CHANNEL,"","","");
    }



    listen(integer channel,string name, key id, string message)
    {
        integer index = llListFindList(channels,[channel]);    // see if a valid channel
        string aname = "unkown";
        if (index >= 0)
        {
            aname =   llList2String(channels,index-1);
        }
        if (channel == API_CHANNEL || channel == HOME_CHANNEL)
            llOwnerSay(llGetObjectName() + ":channel:" + aname + ":" + message ); // API is not encrypted
        else
            llOwnerSay(llGetObjectName() + ":channel:" + aname + ":" + xtea_decrypt_string(message) );
    }


    link_message(integer sender_num, integer num, string str, key id)
    {
        integer index = llListFindList(ignore,[str]);    // see if a valid string
        if (index >= 0)
            return;

        index = llListFindList(ignore,[num]);    // see if a valid command
        if (index >= 0)
            return;


        index = llListFindList(messages,[num]);    // see if a valid channel
        string aname = "*unknown channel:" + (string) num + ", please update the list in xs_Debug";
        if (index >= 0)
        {
            aname =   llList2String(messages,index-1);
        }

        llOwnerSay(llGetObjectName() + ":" + aname + " : string:" + str + ": key:" + (string) id);

    }

    touch_start(integer total_number)
    {
        llSay(0, "xs_Debug is loaded into this item. Do not forget to remove it.");
    }

    on_rez(integer param)
    {
        llResetScript();
    }
}

