integer inUVBounds(vector touchUV, vector SW, vector NE)
{
 if(touchUV.x > SW.x && touchUV.x < NE.x && touchUV.y > SW.y && touchUV.y < NE.y)
 return TRUE;
 else return FALSE;
}