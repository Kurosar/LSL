// CONFIG - YOU CAN EDIT //
string Name = "Capture Point A"; // Capture Point Name
float Time = 0.1; // Time for a %
vector BlueColor = <0.000, 0.502, 1.000>; // Blue Side Color
string BlueTeamName = "[BoTS]"; // Blue Team Name
vector RedColor = <255,0,0>; // Red Side Color
string RedTeamName = "Attackers"; // Red Team Name
vector NeutralColor = <255,255,255>; // Neutral Side Color

// INITIAL SETUP - DO NOT EDIT //
string OwnedBy = "NONE";
string AttackedBy = "NONE";
integer Progress = 0;
integer defenders = 0;
integer attackers = 0;


OwnedByRed()
{
    llSetText(Name + "\nCaptured by "+RedTeamName,RedColor,1);
    OwnedBy = "Red";
}

OwnedByBlue()
{
    llSetText(Name + "\nCaptured by "+BlueTeamName,BlueColor,1);
    OwnedBy = "Blue";
}

OwnedByNONE()
{
    llSetText(Name + "\nNeutral",NeutralColor,1);
    OwnedBy = "NONE";
    llSleep(1);
}

default
{
    state_entry()
    {
        Progress = 0;
        integer defenders = 0;
        integer attackers = 0;
        OwnedBy = "NONE";
        AttackedBy = "NONE";
        llSensorRepeat("", "", AGENT, 5, TWO_PI, 0.2); // active le scanner.
        OwnedByNONE();
    }

    sensor(integer total_number)
    {
        integer group_members;
        integer i;
        key id = llDetectedKey(i);
        do
        {
            key id = llDetectedKey(i);
            if (llSameGroup(id))
            {
                ++group_members;
            }
        }
        while (++i < total_number);

        defenders = group_members;
        attackers = total_number - group_members;

        integer sameGroup = llSameGroup(id);

        if (!sameGroup) { // ATTAQUANTS (if RED)
            if (OwnedBy == "Blue") {
                AttackedBy = "Red";
                if (defenders <= 0) {
                    llSetTimerEvent(Time/attackers);        }
                else {
                    llSetTimerEvent(0);
                    llSetText(Name + "\n" + (string)Progress + "%\nBlocked"+"\nSpeed x0",BlueColor,1);

                }
            }
            else if (OwnedBy == "NONE") {
                AttackedBy = "Red";
                OwnedBy = "Red";
                if (defenders <= 0) {
                    llSetTimerEvent(Time/attackers);
                }
                else {
                    llSetTimerEvent(0);
                    llSetText(Name + "\n" + (string)Progress + "%\nBlocked"+"\nSpeed x0",NeutralColor,1);
                }
            }
            else if (OwnedBy == "Red") {
                AttackedBy = "Red";
                if (defenders <= 0) {
                    if (Progress == 100) {
                        llSetTimerEvent(0);
                        OwnedByRed();
                    }
                    else {
                        llSetTimerEvent(Time/attackers);
                    }
                }
                else {
                    llSetTimerEvent(0);
                    llSetText(Name + "\n" + (string)Progress + "%\nBlocked"+"\nSpeed x0",RedColor,1);
                }
            }

        }

        else if (sameGroup) { // DEFENSEURS (if BLUE)
            if (OwnedBy == "Red") {
                AttackedBy = "Blue";
                if (attackers <= 0) {
                    llSetTimerEvent(Time/defenders);
                }
                else {
                    llSetTimerEvent(0);
                    llSetText(Name + "\n" + (string)Progress + "%\nBlocked"+"\nSpeed x0",RedColor,1);
                }
            }
            else if (OwnedBy == "NONE") {
                AttackedBy = "Blue";
                OwnedBy = "Blue";
                if (attackers <= 0) {
                    llSetTimerEvent(Time/defenders);
                }
                else {
                    llSetTimerEvent(0);
                    llSetText(Name + "\n" + (string)Progress + "%\nBlocked"+"\nSpeed x0",NeutralColor,1);
                }
            }
            else if (OwnedBy == "Blue") {
                AttackedBy = "Blue";
                if (attackers <= 0) {
                    if (Progress == 100) {
                        llSetTimerEvent(0);
                        OwnedByBlue();
                    }
                    else {
                        llSetTimerEvent(Time/defenders);
                    }
                }
                else {
                    llSetTimerEvent(0);
                    llSetText(Name + "\n" + (string)Progress + "%\nBlocked"+"\nSpeed x0",BlueColor,1);
                }
            }
        }
    }

    no_sensor()
    {
        llSetTimerEvent(0);
    }

    timer()
    {
        if (AttackedBy == "Red") {
            if (OwnedBy == "NONE") {
                if (Progress < 100) {
                    Progress++;
                    llSetText(Name + "\n" + (string)Progress + "%\nCapturing..."+"\nSpeed x" + (string)attackers,RedColor,1);
                }
                else if (Progress == 100) {
                    OwnedByRed();
                }
            }
            if (OwnedBy == "Red") {
                if (Progress < 100) {
                    Progress++;
                    llSetText(Name + "\n" + (string)Progress + "%\nCapturing..."+"\nSpeed x" + (string)attackers,RedColor,1);
                }
                else if (Progress == 100) {
                    OwnedByRed();
                }
            }
            if (OwnedBy == "Blue") {
                if (Progress == 0) {
                    OwnedByNONE();
                }
                else {
                    Progress--;
                    llSetText(Name + "\n" + (string)Progress + "%\nNeutralizing..."+"\nSpeed x" + (string)attackers,BlueColor,1);
                }
            }
        }
        else if (AttackedBy == "Blue") {
            if (OwnedBy == "NONE") {
                if (Progress < 100) {
                    Progress++;
                    llSetText(Name + "\n" + (string)Progress + "%\nCapturing..."+"\nSpeed x" + (string)defenders,BlueColor,1);
                }
                else if (Progress == 100){
                    OwnedByBlue();
                }
            }
            if (OwnedBy == "Blue") {
                if (Progress < 100) {
                    Progress++;
                    llSetText(Name + "\n" + (string)Progress + "%\nCapturing..."+"\nSpeed x" + (string)defenders,BlueColor,1);
                }
                else if (Progress == 100){
                    OwnedByBlue();
                }
            }
            if (OwnedBy == "Red") {
                if (Progress == 0) {
                    OwnedByNONE();
                }
                else {
                    Progress--;
                    llSetText(Name + "\n" + (string)Progress + "%\nNeutralizing..."+"\nSpeed x" + (string)defenders,RedColor,1);
                }

            }
        }
    }
}

