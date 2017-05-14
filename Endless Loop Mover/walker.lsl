// :SHOW:1
// :CATEGORY:Telepad
// :NAME:Endless Loop Mover
// :AUTHOR:Ferd Frederix
// :KEYWORDS:
// :CREATED:2015-08-05 09:54:56
// :EDITED:2017-03-11  11:22:29
// :ID:1084
// :NUM:1816
// :REV:2
// :WORLD:OpenSim
// :DESCRIPTION:
// Sit on this prim, it will move you to a destination and unseat you, optionally repeat forever.
// :CODE:
// Open Source CC-BY-NC
// Please keep open source Open!


integer _debug = FALSE; // print in chats what i s happening.
float RANGE = 96; // range it looks for people - if detected, will allow it to move
float TINTERVAL = 10;  // how often it looks - keep this large and the RANGE small
integer Endless = TRUE;
vector  OFFSET = <0,0,0>; // if you want the tour to ride higher or lower or to one side...
integer running = FALSE;
float SPEED = 1.0; // speed of vehicle  in meters per second

// Sit for the NPC
vector TARGET = <0,0,.7>; 
vector ROT = <0, 0, 0>; 
key av;

float INTERVAL = 0.5;   // how often we check
float TOLERANCE = 1;   // how close to get
 
vector startPos;    
list lCoordinate;
list lRotation ;
list lText;

string NOTECARD = "Route";        // the notecard for configuring

integer count = 0;
    
vector TargetLocation;
rotation TargetRotation;
   
     
Goto(float speed)
{
    if (_debug) 
        llOwnerSay("Looking at Target Location = " + (string) TargetLocation);

    vector ownPosition = llGetPos();    
    float dist = llVecDist(ownPosition, TargetLocation);
    
    float rate = dist / speed;
        
    rotation ownRotation = llGetRot();
 
    llSetKeyframedMotion(
            [(TargetLocation - ownPosition) + <0.0, 0.0, -.5> * TargetRotation,
            NormRot(TargetRotation/ownRotation), rate],
            []);
     
}

rotation NormRot(rotation Q)
{
    float MagQ = llSqrt(Q.x*Q.x + Q.y*Q.y +Q.z*Q.z + Q.s*Q.s);
 
    return
        <Q.x/MagQ, Q.y/MagQ, Q.z/MagQ, Q.s/MagQ>;
}

integer locationLength;

 
default
{
    on_rez(integer param)
    {
        llResetScript();
    }
    state_entry() 
    {       
        if (_debug) 
            llOwnerSay("Reset");

     
        rotation rot     = llEuler2Rot(ROT * DEG_TO_RAD);     // convert the degrees to radians, then convert that vector into a rotation, rot30x 
        llSitTarget(TARGET, rot); // where they sit
        
        // read the notecard
        string data = osGetNotecard(NOTECARD);
        list lLine = llParseString2List(data, ["\n"], []);
        integer i;
        integer j = llGetListLength(lLine);
        for (i = 0; i < j; i++)
        {
            string aLine = llList2String(lLine,i);
            
            list iList =  llParseString2List(aLine, ["|"], []);
            if (_debug )    llOwnerSay("Line = " + llDumpList2String(iList,":")); 

            vector TempLocation = (vector) llList2Vector(iList,1); 
            if (TempLocation != ZERO_VECTOR)
            {
                rotation Rot = (rotation) llList2String(iList,2);
                string text = llList2String(iList,3);
    
                if (_debug) llOwnerSay((string)TempLocation);
                    
                TempLocation += OFFSET;
                    
                lCoordinate += [TempLocation];
                    
                lRotation +=  [Rot];
                lText += [text];
                    
                locationLength = (llGetListLength(lCoordinate));
            } 
        }
        state paused;
    }

}

state paused {
    
    state_entry()
    {   
        if (_debug) llOwnerSay("Pause");

        if (!Endless) {

            av =  llAvatarOnSitTarget();
            if (av != NULL_KEY) {
                llStopAnimation("avatar_walk");
                llUnSit(av);
            }
        }
                            
        TargetLocation = llList2Vector(lCoordinate, 0);  // Look at 0th
        TargetRotation = llList2Rot(lRotation, 0);  // Look at 0th
        startPos = TargetLocation;  
        Goto(50);       // go fast
        
        count = 0;
        
                
        if (Endless)
            state moving;
    }
    
    changed(integer change)
    {
         if (change & CHANGED_LINK) 
         { 
            key av = llAvatarOnSitTarget();
            if (_debug) llOwnerSay("Sit by " + (string) av);
            
            if (av!= NULL_KEY) 
            {
                llRequestPermissions(av,PERMISSION_TRIGGER_ANIMATION);
            }
        }
        
        if (change & CHANGED_REGION_START)
        {
            llResetScript();
        }
    }   
    
    run_time_permissions(integer n)
    {
        if (n & PERMISSION_TRIGGER_ANIMATION) {
            
            llStopAnimation("sit");
            llStartAnimation("avatar_walk");
            state moving;
        }
    } 
}
 
 
state moving
{
    state_entry()
    {
        if (_debug) llOwnerSay("State Moving entered, is pointing to target " + (string) TargetLocation );

        count ++;
         
        TargetLocation = llList2Vector(lCoordinate, count);  // Look at nth
        TargetRotation = llList2Rot(lRotation, count);  // Look at nth
        string SpeakThis =  llList2String(lText, count); 
    
        if (llStringLength(SpeakThis))
            llSay(0,SpeakThis);
            
        Goto(SPEED);
        llSetTimerEvent(INTERVAL);
        llSensorRepeat("","",AGENT,RANGE,PI,TINTERVAL);
    }
    
    sensor(integer n)
    {
        if (! running++)
             llSetTimerEvent(INTERVAL);
    }
    
    no_sensor()
    {
        llSetTimerEvent(0);
        running = FALSE;
    }
    
    changed(integer change)
    {
         if (change & CHANGED_LINK) 
         { 
            av = llAvatarOnSitTarget();
            if (av == NULL_KEY) //evaluated as true if not NULL_KEY or invalid
            {
                state paused;
            } else {
                llRequestPermissions(av,PERMISSION_TRIGGER_ANIMATION);
            }
        }
        if (change & CHANGED_REGION_START)
        {
            llResetScript();
        }
        
        
    }    
     
    run_time_permissions(integer n)
    {
        if (n & PERMISSION_TRIGGER_ANIMATION) {
            
            llStopAnimation("sit");
            llStartAnimation("avatar_walk");
        }
    } 
    
    
    on_rez(integer param)
    {
        llResetScript();
    }
    
    timer()   
    {
         if (_debug) llOwnerSay("tick"); 
        if (llVecMag(llGetPos() - TargetLocation) <= TOLERANCE) {   
            if (_debug) llOwnerSay("At location: " + (string) llGetPos());

            count ++;
             
            if (count >= locationLength) {   
                 if (_debug) llOwnerSay("EOF"); 
                state paused;
                
            } else {
                TargetLocation = llList2Vector(lCoordinate, count);  // Look at nth
                TargetRotation = llList2Rot(lRotation, count);  // Look at nth
                
                Goto(SPEED);
                if (_debug) llOwnerSay("New Target: " + (string) TargetLocation); 
            }  
        }
    }    
    
    state_exit()
    {
        llSetTimerEvent(0);
    }  
}
 
