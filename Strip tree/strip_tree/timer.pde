float lastTime;
float timeToWait=4000;
boolean timer()
{
  if( millis() - lastTime > timeToWait)
  {
    String time = hour()+":"+minute()+":"+second() + "\n...";
    println(time);
    lastTime = millis();
    return true;
  } 
  return false;
}
