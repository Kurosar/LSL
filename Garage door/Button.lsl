default
{
    state_entry()
    {
        llSetPrimitiveParams([ PRIM_TYPE, PRIM_TYPE_BOX, 0, <0.0, 1.0, 0.0>, 0.0, ZERO_VECTOR, <0.0, 1.0, 0.0>, ZERO_VECTOR, PRIM_SIZE, <0.500000, 0.293449, 0.010000>, PRIM_TEXTURE, 0, "89556747-24cb-43ed-920b-47caed15465f", <1.0, 1.0, 0.0>, ZERO_VECTOR, 0.0, PRIM_TEXTURE, 1, "89556747-24cb-43ed-920b-47caed15465f", <1.0, 1.0, 0.0>, ZERO_VECTOR, 0.0, PRIM_TEXTURE, 2, "a20acac5-6159-b2e5-2c03-66ee3b7c11b0", <1.0, 1.0, 0.0>, ZERO_VECTOR, 1.570796, PRIM_TEXTURE, 3, "89556747-24cb-43ed-920b-47caed15465f", <1.0, 1.0, 0.0>, ZERO_VECTOR, 0.0, PRIM_TEXTURE, 4, "bf38879b-0a32-3524-da4f-a6f4d2d39659", <1.0, 1.0, 0.0>, ZERO_VECTOR, 1.570796, PRIM_TEXTURE, 5, "89556747-24cb-43ed-920b-47caed15465f", <1.0, 1.0, 0.0>, ZERO_VECTOR, 0.0]);
    }

    touch(integer num_detected)
    {

        integer face = llDetectedTouchFace(0);
        if (face == 4)
        {
            llSay(1,"up");
            llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_FULLBRIGHT, 4,TRUE]);
        }
        else if (face == 2)
        {
            llSay(1,"down");
            llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_FULLBRIGHT, 2,TRUE]);
        }
    }
    touch_end(integer total_number)
    {
        llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_FULLBRIGHT, 4,FALSE]);
        llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_FULLBRIGHT, 2,FALSE]);
        llStopSound();
        llTriggerSound("92a5aa0f-abfa-6b93-2554-e32f6891d0db",1);
    }

    touch_start(integer total_number)
    {
        llTriggerSound("850cb75c-0309-286c-8284-5eb88a96313d",1);
        integer face = llDetectedTouchFace(0);
        if (face == 4)
        {
            llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_FULLBRIGHT, 4,TRUE]);
            llLoopSound("c6737aba-3e0f-3803-5463-e1bfe068a15a",1);
        }
        else if (face == 2)
        {
            llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_FULLBRIGHT, 2,TRUE]);
            llLoopSound("c6737aba-3e0f-3803-5463-e1bfe068a15a",1);
        }
    }
}