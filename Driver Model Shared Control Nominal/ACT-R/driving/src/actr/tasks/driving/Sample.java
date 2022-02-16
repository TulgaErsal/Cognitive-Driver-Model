package actr.tasks.driving;

/**
 * The class that defines a collected data sample at a given point in time.
 *  
 * @author Dario Salvucci
 */
public class Sample
{
    double time;
    Position simcarPos, simcarHeading;
    double simcarFracIndex, simcarSpeed;
    long simcarRoadIndex;
    Position nearPoint, farPoint, carPoint;
    double steerAngle, accelerator, brake;
    Position autocarPos, autocarHeading;
    double autocarFracIndex, autocarSpeed;
    boolean autocarBraking;
//    LocationChunk eyeLocation;
//    LocationChunk handLocation;
    boolean handMoving;
    boolean listening;
    boolean inDriveGoal;
    
    int event;
    double lanepos;
    
    public String toString ()
    {
    	return "["+time+"\t"+simcarPos+"\t"+simcarHeading+"\t"+simcarFracIndex+
    	"\t"+simcarSpeed+"\t"+simcarRoadIndex+"\t"+nearPoint+"\t"+farPoint+"\t"+carPoint+
    	"\t"+steerAngle+"\t"+accelerator+"\t"+brake+"\t"+autocarPos+"\t"+autocarHeading+
    	"\t"+autocarFracIndex+"\t"+autocarSpeed+"]";
    }
}
