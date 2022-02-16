
-------------------------------------------------------------------------------
|        ..          ..                                                       |
|       ####*.      ####.                                                     |
|         `###*.       `#.                 MSC.Software                       |
|            `###.       #.                ------------                       |
|               `##.     ##                                                   |
|                 `##.   ##                                                   |
|                   `## ##'                A d a m s   C++   S o l v e r      |
|                     ####                 [Build:         2012.1.2-CL138740] |
|                     ###.                 Version:        2012               |
|                    ###`#.                Patch Version:  None               |
|                  .###  `#                                                   |
|                 ####    `#                                                  |
|                ####      #.                                                 |
|              #####       `#              http://www.mscsoftware.com         |
|            .#####                                                           |
|           #####'                                                            |
|           ####                                                              |
|                                                                             |
|    *********************************************************************    |
|    *                                                                   *    |
|    *                      MSC.Software Corporation                     *    |
|    *                                                                   *    |
|    *                             A d a m s                             *    |
|    *                                                                   *    |
|    *          Automatic Dynamic Analysis of Mechanical Systems         *    |
|    *                                                                   *    |
|    *********************************************************************    |
|    *                                                                   *    |
|    *                         LEGAL INFORMATION                         *    |
|    *                                                                   *    |
|    *  Warning:  This computer  program is protected  by copyright law  *    |
|    *  and  international  treaties.    Unauthorized  reproduction  or  *    |
|    *  distribution  of this  computer program, or any  portion of it,  *    |
|    *  may result in severe civil and criminal penalties.               *    |
|    *                                                                   *    |
|    *  Copyright (C) 2011 MSC.Software Corporation and  its licensors.  *    |
|    *                        All rights reserved.                       *    |
|    *                                                                   *    |
|    *  This computer program may contain certain  third-party software  *    |
|    *  that is protected by  copyright and licensed from  MSC.Software  *    |
|    *  suppliers.   Portions of this software are owned  by UGS  Corp.  *    |
|    *  (C) Copyright 1997.   All Rights Reserved.   Portions, (C) 1998  *    |
|    *  Spacetec IMC Corporation ("Spacetec").                           *    |
|    *                                                                   *    |
|    *  The  MSC.Software logo,  MSC,  MSC Adams,  MD Adams,  Adams and  *    |
|    *  Adams/  are trademarks or registered trademarks of MSC.Software  *    |
|    *  Corporation  or its  subsidiaries in  the United States  and/or  *    |
|    *  other   countries.   FLEXlm  is  a   registered   trademark  of  *    |
|    *  Macrovision Corporation. Parasolid is a registered trademark of  *    |
|    *  UGS  Corp.   All  other trademarks are  the property  of  their  *    |
|    *  respective owners.                                               *    |
|    *                                                                   *    |
|    *********************************************************************    |
|                                                                             |
|-----------------------------------------------------------------------------|
|                                                                             |
|    *********************************************************************    |
|    *                                                                   *    |
|    *   Local Time: 2014-12-09 14:38:15                                 *    |
|    *    Host Name: DRENWKSC24VVV1                                      *    |
|    *        Uname: MS Windows NT                                       *    |
|    *      OS Info: 6.1                                                 *    |
|    *         User: James.poplawski                                     *    |
|    *  Customer ID: 23D3CFEA-F8C55D35                                   *    |
|    *  Current dir: C:\Users\James.poplawski\Documents\MATLAB\UM_11_24_2014\ADAMS*    |
|    *                                                                   *    |
|    *********************************************************************    |
|                                                                             |
-------------------------------------------------------------------------------

  OS-environment variable
  MDI_ADAMS_SCONTROLS_APPLICATION=1
  Adams/Controls. Announces Adams/Solver C++ is being run with Adams/Controls in either function evaluation mode or cosimulation mode.


Adams/Car Adams 2012                                                            

  Processing ENVIRONMENT entries in 'C:\MSC.Software\Adams_x64\2012\acar/acar.cfg'
  Processing ENVIRONMENT entries in 'C:\Users\James.poplawski/.acar.cfg'

  OS-environment detected:  MDI_CDB_SEARCH=yes
  Adams/Car will restore the cdb search algorithm from version 12.0 (if set to 'yes').
  Usage of this environment variable is strongly discouraged.

  OS-environment detected:  MSC_MULTILINE_XML=1
  Adams/Smartdriver will use multi-line formatting when instantiating xml driver control files (0 or 1; default=1).

     
=================================================================
                           Adams/Tire
                       Version Adams 2012
=================================================================

-------------------------------------------------------------------------------
|                                 Model Title                                 |
|=============================================================================|
|                                                                             |
|                       Adams/Car Assembly (Adams 2012)                       |
|                                                                             |
-------------------------------------------------------------------------------

 command: file/command=run_PLANT_step_controls.acf
 command: string/4, string=C:/Users/James.poplawski/Documents/MATLAB/ADAMS Testing/PLANT_step.xml
 command: preferences/solver=CXX
 command: preferences/status=on
 command: output/nosep
 command: show status=simulation
                     Simulation Statistics 
                     ========== ========== 
          Simulation start time              ----   0
          Current simulation time            ----   0
          Simulation end time                ----   0
          Output steps requested             ----   0
          Actual number of output records    ----   0
          Number of equations in the system  ----   0
          Number of requests in the data set ----   137
          Simulation elapsed time (seconds)  ----   0.171
          Simulation CPU time (seconds)      ----   0.156001
          Current integrator                 ----   Gstiff
          Formulation of the equations       ----   I3
          Number of integration steps        ----   0
          Number of function evaluations     ----   0
          Number of Jacobian evaluations     ----   0
          Relative error tolerance           ----   0.01
          Absolute error tolerance           ----   0.01
          Current order of the integrator    ----   0
          Current integration step size      ----   0

 command: control/ routine=abgVDM::EventInit, function=user(4,1,9,0,2,7,5,15)

Reading configuration file 'C:\MSC.Software\Adams_x64\2012\acar/acar.cfg'
Reading configuration file 'C:\Users\James.poplawski/.acar.cfg'

    
    
vdm::EvtMonitor::EvtMonitor
   End conditions evaluated in SENSUB.
    
   
ASD_ifInit()
=================================================================
                        Adams/Smartdriver
                       Version Adams 2012
=================================================================
                   
SDF_xml_upd_controller()
Info: minPreviewDistance is negative or not set, using default 5m.

   Drv_Model::vfSetMaxLenItx
Info: MaxLenItx is negative or not set, using default (100m).
 command: show status=simulation
                     Simulation Statistics 
                     ========== ========== 
          Simulation start time              ----   0
          Current simulation time            ----   0
          Simulation end time                ----   0
          Output steps requested             ----   0
          Actual number of output records    ----   0
          Number of equations in the system  ----   0
          Number of requests in the data set ----   137
          Simulation elapsed time (seconds)  ----   0.243
          Simulation CPU time (seconds)      ----   0.218401
          Current integrator                 ----   Gstiff
          Formulation of the equations       ----   I3
          Number of integration steps        ----   0
          Number of function evaluations     ----   0
          Number of Jacobian evaluations     ----   0
          Relative error tolerance           ----   0.01
          Absolute error tolerance           ----   0.01
          Current order of the integrator    ----   0
          Current integration step size      ----   0

 command: sim/init


  Begin Displacement Initial Conditions

  Time T=0.000000000E+00.
  Degree-of-freedom analysis identified redundant constraints in the model:
  -------------------------------------------------------------------------
   -  deactivating constraint equation  IJ_RtL0 in plant.modified_humvee_steering.jms_Steering_Wheel_Motion.motion

  End Displacement Initial Conditions


  Begin Velocity Initial Conditions


  End Velocity Initial Conditions


  Begin Acceleration Initial Conditions

    TIRE ID: 2
    TYR910 -> Pacejka 2002 Tire Model
    Using 2D Road
    One point Contact
     
    TIRE ID: 3
    TYR910 -> Pacejka 2002 Tire Model
    Using 2D Road
    One point Contact
     
    TIRE ID: 4
    TYR910 -> Pacejka 2002 Tire Model
    Using 2D Road
    One point Contact
     
    TIRE ID: 5
    TYR910 -> Pacejka 2002 Tire Model
    Using 2D Road
    One point Contact
     

  End Acceleration Initial Conditions

  Simulate status=0

 command: 
 command: simulate/initial_conditions


  Begin Displacement Initial Conditions


  End Displacement Initial Conditions


  Begin Velocity Initial Conditions


  End Velocity Initial Conditions


  Begin Acceleration Initial Conditions


  End Acceleration Initial Conditions

  Simulate status=0

 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=0.00000000000000000e+000
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
    
    
fdm::ActJoiMot
    Setting function on: steering::steering_wheel_angle
 command: MOTION/4, FUNCTION=0.0
 command: SFORCE/1, FUNCTION=0.0
    
    
fdm::ActVar
    Connecting: steering::steering_wheel_torque
    To        : driver_demand::steering
    
    
fdm::ActVar
    Setting function on: driver_demand::steering
 command: VARIABLE/79, FUNCTION=TZ(931,199,199)
 command: DEACTIVATE/SFORCE, ID=2
   Deactivated plant.testrig.jfs_steering_wheel_torque.force, force/torque values will be zero in function-expression references.
 command: DEACTIVATE/SFORCE, ID=4
   Deactivated plant.testrig.jfs_steering_rack_force.force, force/torque values will be zero in function-expression references.
 command: DEACTIVATE/SFORCE, ID=5
   Deactivated plant.testrig.jfs_steering_rack_force.force_j, force/torque values will be zero in function-expression references.
 command: DEACTIVATE/MOTION, ID=3
   Deactivated plant.testrig.jms_steering_rack_travel.motion, force/torque values will be zero in function-expression references.
    
    
fdm::ActJoiMot
    Setting function on: steering::steering_wheel_angle
 command: MOTION/4, FUNCTION=0.0
    
    
fdm::ActVar
    Setting function on: driver_demand::throttle
 command: VARIABLE/81, FUNCTION=USER(976,3)\ ROUTINE=abgVDM::var976
    
    
fdm::ActVar
    Setting function on: driver_demand::brake
 command: VARIABLE/83, FUNCTION=USER(975,3)\ ROUTINE=abgVDM::var975
    
    
fdm::ActVar
    Setting function on: driver_demand::gear
 command: VARIABLE/85, FUNCTION=(4.0)
    
    
fdm::ActVar
    Setting function on: driver_demand::clutch
 command: VARIABLE/87, FUNCTION=0.0
  
  
vdm::SteadyState::MiniInfo
  
Static Task       :  'Settle'
Lon. Acceleration :  0.000 [m/s^2]
Initial Velocity  :  20.000 [m/s]
Use Brake         :  No
Perform Linear    :  No
Include Damping   :  Yes
Halt on Failure   :  Yes
  
    
    
fdm::ActVar
    Setting function on: driver_demand::clutch
 command: VARIABLE/87, FUNCTION=1.0
 command:  SIM/STAT                                                                       


  Begin Static Solution

  Time T=0.000000000E+00.
  Degree-of-freedom analysis identified redundant constraints in the model:
  -------------------------------------------------------------------------
   -  deactivating constraint equation  IJ_RtL0 in plant.modified_humvee_steering.jms_Steering_Wheel_Motion.motion

 STATICS: Original static solver will be used with the Sparse linear solver.

  Static Solution converged in 8 iterations
  Residual imbalance is less than 3.85353E-09

  End Static Solution

  Simulate status=0

 command:  DEACTIVATE/JPRIM,ID=2                                                          
   Deactivated plant.testrig.josinl_body_stake, force/torque values will be zero in function-expression references.
 command:  DEACTIVATE/JPRIM,ID=3                                                          
   Deactivated plant.testrig.josper_yaw_stake, force/torque values will be zero in function-expression references.
 command:  DEACTIVATE/SFORCE,ID=1                                                         
   Deactivated plant.testrig.sse_steering_force, force/torque values will be zero in function-expression references.
 command:  DEACTIVATE/JPRIM,ID=6                                                          
   Deactivated plant.handling_tire_front_geometry.jorper_sse_jprim, force/torque values will be zero in function-expression references.
 command:  DEACTIVATE/JPRIM,ID=5                                                          
   Deactivated plant.handling_tire_front_geometry.jolper_sse_jprim, force/torque values will be zero in function-expression references.
 command:  DEACTIVATE/JPRIM,ID=8                                                          
   Deactivated plant.handling_tire_rear_geometry.jorper_sse_jprim, force/torque values will be zero in function-expression references.
 command:  DEACTIVATE/JPRIM,ID=7                                                          
   Deactivated plant.handling_tire_rear_geometry.jolper_sse_jprim, force/torque values will be zero in function-expression references.
    
    
fdm::ActVar
    Setting function on: driver_demand::clutch
 command: VARIABLE/87, FUNCTION=0.0
                                                                                
acar_2012.1.1/vdm::SteadyState::Run                                             
                                                                                
    Setting initial conditions for speed = 20000.0000000000                                                             
    
    
fdm::ActVar
    Setting function on: driver_demand::steering
 command: VARIABLE/79, FUNCTION=0
 command: DEACTIVATE/MOTION, ID=4
   Deactivated plant.testrig.jms_steering_wheel_angle.motion, force/torque values will be zero in function-expression references.
 command: ACTIVATE/SFORCE, ID=2
    
    
fdm::ActJoiFor
    Connecting: driver_demand::steering
    To        : steering::steering_wheel_torque
    
    
fdm::ActJoiFor
    Setting function on: steering::steering_wheel_torque
 command: SFORCE/2, FUNCTION=VARVAL(79)
    
    
vdm::Dynamic::Setup
    Setting up for minimaneuver: STEP_STEER
                   
Note: quantities are expressed in S.I. [m, kg, s, rad].
                   
Maneuver Name       : STEP_STEER
  abort time        : 20.000000
  sample period     : 0.010000
                   
- Demand : steering
    actuator_type   : TORQUE
    control_method  : OPEN
    control_mode    : RELATIVE
    control_type    : STEP
    control_values  : 0.000000
                    : 0.000000
                    : 0.100000
                    : 0.000000
                   
- Demand : throttle
    control_method  : OPEN
    control_mode    : ABSOLUTE
    control_type    : CONSTANT
    control_values  : 0.000000
                   
- Demand : braking
    control_method  : OPEN
    control_mode    : ABSOLUTE
    control_type    : CONSTANT
    control_values  : 0.000000
                   
- Demand : gear
    control_method  : OPEN
    control_mode    : ABSOLUTE
    control_type    : CONSTANT
    control_values  : 4.000000
                   
- Demand : clutch
    control_method  : OPEN
    control_mode    : ABSOLUTE
    control_type    : CONSTANT
    control_values  : 0.000000
                   
- End condition #1
    type            : TIME
    test            : >>
    trigger value   : 20.000000
    allowed error   : 0.000000
    filter time     : 0.000000
    delay           : 0.000000
    group           : __NO_GROUP__
   
    
vdm::DrivingMachine::outputSignal
Info: Setting Steering IC: 8.52183e-017 (radians)
Info: Setting Steering IC: 0 (newton-meters)
    
    
fdm::ActVar
    Setting function on: driver_demand::steering
 command: VARIABLE/79, FUNCTION=USER(985,0), ROUTINE=abgVDM::VAR985
    
vdm::DrivingMachine::outputSignal
Info: Setting Throttle IC: 0
    
vdm::DrivingMachine::outputSignal
Info: Setting Brake IC:    0 
    
    
fdm::ActVar
    Setting function on: driver_demand::throttle
 command: VARIABLE/81, FUNCTION=USER(985,1), ROUTINE=abgVDM::VAR985
    
    
fdm::ActVar
    Setting function on: driver_demand::brake
 command: VARIABLE/83, FUNCTION=USER(985,2), ROUTINE=abgVDM::VAR985
    
vdm::DrivingMachine::outputSignal
Info: Setting Gear IC:     4 
    
vdm::DrivingMachine::outputSignal
Info: Setting Clutch IC:   0 
    
    
fdm::ActVar
    Setting function on: driver_demand::gear
 command: VARIABLE/85, FUNCTION=USER(985,3), ROUTINE=abgVDM::VAR985
    
    
fdm::ActVar
    Setting function on: driver_demand::clutch
 command: VARIABLE/87, FUNCTION=USER(985,4), ROUTINE=abgVDM::VAR985
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   0.00000E+00  5.00000E-05            0            0       1            0.66 
   5.00000E-03  9.50000E-04           32           10       2            0.75 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.87705754992860000e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.00000E-03  9.50000E-04           32           10       2            0.75 
   1.00000E-02  1.00000E-03           52           15       2            0.78 

  End Simulation

  Simulate status=0

 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.78083322107708310e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.00000E-02  1.00000E-03           52           15       2            0.78 
   1.50000E-02  1.00000E-03          178           36       2            1.01 

  End Simulation

  Simulate status=0

 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.76042878197552870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.50000E-02  1.00000E-03          178           36       2            1.01 
   2.00000E-02  1.00000E-03          198           41       2            1.09 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.12430524482245380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.00000E-02  1.00000E-03          198           41       2            1.09 
   2.50000E-02  1.00000E-03          218           46       2            1.12 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.69440737258287320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.50000E-02  1.00000E-03          218           46       2            1.12 
   3.00000E-02  1.00000E-03          238           51       2            1.17 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.53284937541262250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.00000E-02  1.00000E-03          238           51       2            1.17 
   3.50000E-02  1.00000E-03          258           56       2            1.22 

  End Simulation

  Simulate status=0

 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.15828096760519550e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.50000E-02  1.00000E-03          258           56       2            1.22 
   4.00000E-02  1.00000E-03          278           61       2            1.29 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.76835978842883230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.00000E-02  1.00000E-03          278           61       2            1.29 
   4.50000E-02  1.00000E-03          298           66       2            1.36 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.80291639418187730e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.50000E-02  1.00000E-03          298           66       2            1.36 
   5.00000E-02  1.00000E-03          318           71       2            1.42 

  End Simulation

  Simulate status=0

 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.59319996217546000e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.00000E-02  1.00000E-03          318           71       2            1.42 
   5.50000E-02  1.00000E-03          338           76       1            1.48 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.94478475815573470e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.50000E-02  1.00000E-03          338           76       1            1.48 
   6.00000E-02  1.00000E-03          358           81       1            1.53 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36281615218100720e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.00000E-02  1.00000E-03          358           81       1            1.53 
   6.50000E-02  1.00000E-03          378           86       1            1.61 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.99190100803707380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.50000E-02  1.00000E-03          378           86       1            1.61 
   7.00000E-02  1.00000E-03          398           91       1            1.65 

  End Simulation

  Simulate status=0

 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.74162705202502660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   7.00000E-02  1.00000E-03          398           91       1            1.65 
   7.50000E-02  1.00000E-03          418           96       1            1.72 

  End Simulation

  Simulate status=0

 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.51780535568351620e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   7.50000E-02  1.00000E-03          418           96       1            1.72 
   8.00000E-02  1.00000E-03          438          101       1            1.75 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.02238794422740590e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   8.00000E-02  1.00000E-03          438          101       1            1.75 
   8.50000E-02  1.00000E-03          458          106       1            1.79 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.17695292044760870e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   8.50000E-02  1.00000E-03          458          106       1            1.79 
   9.00000E-02  1.00000E-03          478          111       1            1.86 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.30771232144468950e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   9.00000E-02  1.00000E-03          478          111       1            1.86 
   9.50000E-02  1.00000E-03          498          116       1            1.90 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.40839534250979920e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   9.50000E-02  1.00000E-03          498          116       1            1.90 
   1.00000E-01  1.00000E-03          518          121       1            1.95 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.47445620918613180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.00000E-01  1.00000E-03          518          121       1            1.95 
   1.05000E-01  1.00000E-03          538          126       1            2.01 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.50362048363720490e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.05000E-01  1.00000E-03          538          126       1            2.01 
   1.10000E-01  1.00000E-03          558          131       2            2.07 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.49551160721982180e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.10000E-01  1.00000E-03          558          131       2            2.07 
   1.15000E-01  1.00000E-03          576          136       2            2.14 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.45117140837422390e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.15000E-01  1.00000E-03          576          136       2            2.14 
   1.20000E-01  1.00000E-03          596          141       1            2.18 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.37274947649417960e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.20000E-01  1.00000E-03          596          141       1            2.18 
   1.25000E-01  1.00000E-03          616          146       1            2.25 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26370782413940220e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.25000E-01  1.00000E-03          616          146       1            2.25 
   1.30000E-01  1.00000E-03          636          151       1            2.28 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.12850481564981050e+006
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.30000E-01  1.00000E-03          636          151       1            2.28 
   1.35000E-01  1.00000E-03          656          156       1            2.34 

  End Simulation

  Simulate status=0

 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.72275164866277600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.35000E-01  1.00000E-03          656          156       1            2.34 
   1.40000E-01  1.00000E-03          676          161       1            2.40 

  End Simulation

  Simulate status=0

 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.00809772963560650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.40000E-01  1.00000E-03          676          161       1            2.40 
   1.45000E-01  1.00000E-03          696          166       1            2.45 

  End Simulation

  Simulate status=0

 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.20404345391826700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.45000E-01  1.00000E-03          696          166       1            2.45 
   1.50000E-01  1.00000E-03          716          171       1            2.48 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.37519629490961090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.50000E-01  1.00000E-03          716          171       1            2.48 
   1.55000E-01  1.00000E-03          736          176       1            2.51 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.57901486741344910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.55000E-01  1.00000E-03          736          176       1            2.51 
   1.60000E-01  1.00000E-03          756          181       1            2.54 

  End Simulation

  Simulate status=0

 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.65462265572267790e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.60000E-01  1.00000E-03          756          181       1            2.54 
   1.65000E-01  1.00000E-03          776          186       1            2.62 

  End Simulation

  Simulate status=0

 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.19604670897604520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.65000E-01  1.00000E-03          776          186       1            2.62 
   1.70000E-01  1.00000E-03          796          191       1            2.65 

  End Simulation

  Simulate status=0

 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.13576947429743360e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.70000E-01  1.00000E-03          796          191       1            2.65 
   1.75000E-01  1.00000E-03          816          196       1            2.71 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.35037747957573680e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.75000E-01  1.00000E-03          816          196       1            2.71 
   1.80000E-01  1.00000E-03          836          201       1            2.75 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.34032619732778520e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.80000E-01  1.00000E-03          836          201       1            2.75 
   1.85000E-01  1.00000E-03          856          206       1            2.79 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.09298694024533500e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.85000E-01  1.00000E-03          856          206       1            2.79 
   1.90000E-01  1.00000E-03          876          211       1            2.85 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.60532194819908010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.90000E-01  1.00000E-03          876          211       1            2.85 
   1.95000E-01  1.00000E-03          896          216       1            2.92 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.88349554629198510e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   1.95000E-01  1.00000E-03          896          216       1            2.92 
   2.00000E-01  1.00000E-03          916          221       2            2.98 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.94244414804810540e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.00000E-01  1.00000E-03          916          221       2            2.98 
   2.05000E-01  1.00000E-03          931          226       2            3.01 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.80455246934776430e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.05000E-01  1.00000E-03          931          226       2            3.01 
   2.10000E-01  1.00000E-03          946          231       2            3.06 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.49521384889485900e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.10000E-01  1.00000E-03          946          231       2            3.06 
   2.15000E-01  1.00000E-03          961          236       2            3.10 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.04581885327196910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.15000E-01  1.00000E-03          961          236       2            3.10 
   2.20000E-01  1.00000E-03          976          241       2            3.14 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.48974906182223410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.20000E-01  1.00000E-03          976          241       2            3.14 
   2.25000E-01  1.00000E-03          991          246       2            3.17 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.86082756986058140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.25000E-01  1.00000E-03          991          246       2            3.17 
   2.30000E-01  1.00000E-03         1006          251       2            3.20 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.19215097662243880e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.30000E-01  1.00000E-03         1006          251       2            3.20 
   2.35000E-01  1.00000E-03         1021          256       2            3.24 

  End Simulation

  Simulate status=0

 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.51521537101591240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.35000E-01  1.00000E-03         1021          256       2            3.24 
   2.40000E-01  1.00000E-03         1036          261       2            3.28 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.85919146501582990e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.40000E-01  1.00000E-03         1036          261       2            3.28 
   2.45000E-01  1.00000E-03         1051          266       2            3.34 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.25030081343011000e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.45000E-01  1.00000E-03         1051          266       2            3.34 
   2.50000E-01  1.00000E-03         1066          271       2            3.39 

  End Simulation

  Simulate status=0

 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.11247176581947860e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.50000E-01  1.00000E-03         1066          271       2            3.39 
   2.55000E-01  1.00000E-03         1081          276       2            3.42 

  End Simulation

  Simulate status=0

 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.60703808522725920e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.55000E-01  1.00000E-03         1081          276       2            3.42 
   2.60000E-01  1.00000E-03         1096          281       2            3.46 

  End Simulation

  Simulate status=0

 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=8.71186064148819060e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.60000E-01  1.00000E-03         1096          281       2            3.46 
   2.65000E-01  1.00000E-03         1111          286       2            3.51 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.22787755911668680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.65000E-01  1.00000E-03         1111          286       2            3.51 
   2.70000E-01  1.00000E-03         1126          291       2            3.56 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.41804661928689020e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.70000E-01  1.00000E-03         1126          291       2            3.56 
   2.75000E-01  1.00000E-03         1141          296       2            3.60 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.44560514348921500e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.75000E-01  1.00000E-03         1141          296       2            3.60 
   2.80000E-01  1.00000E-03         1156          301       2            3.63 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36088669653469330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.80000E-01  1.00000E-03         1156          301       2            3.63 
   2.85000E-01  1.00000E-03         1171          306       2            3.68 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.25547694094101680e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.85000E-01  1.00000E-03         1171          306       2            3.68 
   2.90000E-01  1.00000E-03         1186          311       2            3.73 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.74433424699432980e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.90000E-01  1.00000E-03         1186          311       2            3.73 
   2.95000E-01  1.00000E-03         1201          316       2            3.78 

  End Simulation

  Simulate status=0

 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-5.48470735515206180e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   2.95000E-01  1.00000E-03         1201          316       2            3.78 
   3.00000E-01  1.00000E-03         1216          321       2            3.82 

  End Simulation

  Simulate status=0

 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-9.79234102530661330e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.00000E-01  1.00000E-03         1216          321       2            3.82 
   3.05000E-01  1.00000E-03         1231          326       2            3.87 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.44830024193989320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.05000E-01  1.00000E-03         1231          326       2            3.87 
   3.10000E-01  1.00000E-03         1246          331       2            3.92 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.93697158202404210e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.10000E-01  1.00000E-03         1246          331       2            3.92 
   3.15000E-01  1.00000E-03         1261          336       2            3.98 

  End Simulation

  Simulate status=0

 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.42699983790174130e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.15000E-01  1.00000E-03         1261          336       2            3.98 
   3.20000E-01  1.00000E-03         1276          341       2            4.02 

  End Simulation

  Simulate status=0

 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.90119811510298110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.20000E-01  1.00000E-03         1276          341       2            4.02 
   3.25000E-01  1.00000E-03         1291          346       2            4.06 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.34387396287173380e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.25000E-01  1.00000E-03         1291          346       2            4.06 
   3.30000E-01  1.00000E-03         1306          351       2            4.10 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.74114581853751150e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.30000E-01  1.00000E-03         1306          351       2            4.10 
   3.35000E-01  1.00000E-03         1321          356       2            4.13 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.08121398377980570e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.35000E-01  1.00000E-03         1321          356       2            4.13 
   3.40000E-01  1.00000E-03         1336          361       2            4.21 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.35456738692280490e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.40000E-01  1.00000E-03         1336          361       2            4.21 
   3.45000E-01  1.00000E-03         1351          366       2            4.26 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.55412453647099550e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.45000E-01  1.00000E-03         1351          366       2            4.26 
   3.50000E-01  1.00000E-03         1366          371       2            4.31 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67531701835559160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.50000E-01  1.00000E-03         1366          371       2            4.31 
   3.55000E-01  1.00000E-03         1381          376       2            4.37 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.71611912635767250e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.55000E-01  1.00000E-03         1381          376       2            4.37 
   3.60000E-01  1.00000E-03         1396          381       2            4.40 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.67703276000103330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.60000E-01  1.00000E-03         1396          381       2            4.40 
   3.65000E-01  1.00000E-03         1411          386       2            4.45 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.56101328073906010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.65000E-01  1.00000E-03         1411          386       2            4.45 
   3.70000E-01  1.00000E-03         1426          391       2            4.48 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.37331731611384950e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.70000E-01  1.00000E-03         1426          391       2            4.48 
   3.75000E-01  1.00000E-03         1441          396       2            4.51 

  End Simulation

  Simulate status=0

 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-4.12126398590405650e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.75000E-01  1.00000E-03         1441          396       2            4.51 
   3.80000E-01  1.00000E-03         1456          401       2            4.56 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.81391064590633910e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.80000E-01  1.00000E-03         1456          401       2            4.56 
   3.85000E-01  1.00000E-03         1471          406       2            4.59 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.46165484665459660e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.85000E-01  1.00000E-03         1471          406       2            4.59 
   3.90000E-01  1.00000E-03         1486          411       2            4.62 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.07578412117754280e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.90000E-01  1.00000E-03         1486          411       2            4.62 
   3.95000E-01  1.00000E-03         1501          416       2            4.66 

  End Simulation

  Simulate status=0

 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.66800260555755350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   3.95000E-01  1.00000E-03         1501          416       2            4.66 
   4.00000E-01  1.00000E-03         1516          421       2            4.73 

  End Simulation

  Simulate status=0

 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-2.24996668506808700e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.00000E-01  1.00000E-03         1516          421       2            4.73 
   4.05000E-01  1.00000E-03         1531          426       2            4.77 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.83285966690697180e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.05000E-01  1.00000E-03         1531          426       2            4.77 
   4.10000E-01  1.00000E-03         1546          431       2            4.82 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.42702826961877230e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.10000E-01  1.00000E-03         1546          431       2            4.82 
   4.15000E-01  1.00000E-03         1561          436       2            4.87 

  End Simulation

  Simulate status=0

 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-1.04169338809346140e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.15000E-01  1.00000E-03         1561          436       2            4.87 
   4.20000E-01  1.00000E-03         1576          441       2            4.91 

  End Simulation

  Simulate status=0

 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-6.84737075759314900e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.20000E-01  1.00000E-03         1576          441       2            4.91 
   4.25000E-01  1.00000E-03         1591          446       2            4.96 

  End Simulation

  Simulate status=0

 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-3.62559504214500480e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.25000E-01  1.00000E-03         1591          446       2            4.96 
   4.30000E-01  1.00000E-03         1606          451       2            5.01 

  End Simulation

  Simulate status=0

 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=-7.99950685827947380e+003
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.30000E-01  1.00000E-03         1606          451       2            5.01 
   4.35000E-01  1.00000E-03         1621          456       2            5.04 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.59724233724778060e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.35000E-01  1.00000E-03         1621          456       2            5.04 
   4.40000E-01  1.00000E-03         1636          461       2            5.07 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.54968253572740210e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.40000E-01  1.00000E-03         1636          461       2            5.07 
   4.45000E-01  1.00000E-03         1651          466       2            5.13 

  End Simulation

  Simulate status=0

 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.05677389800213710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.45000E-01  1.00000E-03         1651          466       2            5.13 
   4.50000E-01  1.00000E-03         1666          471       2            5.18 

  End Simulation

  Simulate status=0

 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.13305791367966520e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.50000E-01  1.00000E-03         1666          471       2            5.18 
   4.55000E-01  1.00000E-03         1681          476       2            5.21 

  End Simulation

  Simulate status=0

 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.80724031261854110e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.55000E-01  1.00000E-03         1681          476       2            5.21 
   4.60000E-01  1.00000E-03         1696          481       2            5.27 

  End Simulation

  Simulate status=0

 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12075439627975430e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.60000E-01  1.00000E-03         1696          481       2            5.27 
   4.65000E-01  1.00000E-03         1711          486       2            5.32 

  End Simulation

  Simulate status=0

 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.12614366835522230e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.65000E-01  1.00000E-03         1711          486       2            5.32 
   4.70000E-01  1.00000E-03         1726          491       2            5.37 

  End Simulation

  Simulate status=0

 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.88501554638622620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.70000E-01  1.00000E-03         1726          491       2            5.37 
   4.75000E-01  1.00000E-03         1741          496       2            5.41 

  End Simulation

  Simulate status=0

 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.46544635164667710e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.75000E-01  1.00000E-03         1741          496       2            5.41 
   4.80000E-01  1.00000E-03         1756          501       2            5.46 

  End Simulation

  Simulate status=0

 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.93898589481748420e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.80000E-01  1.00000E-03         1756          501       2            5.46 
   4.85000E-01  1.00000E-03         1771          506       2            5.52 

  End Simulation

  Simulate status=0

 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.37759274432109960e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.85000E-01  1.00000E-03         1771          506       2            5.52 
   4.90000E-01  1.00000E-03         1786          511       2            5.58 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.85062973178563040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.90000E-01  1.00000E-03         1786          511       2            5.58 
   4.95000E-01  1.00000E-03         1801          516       2            5.63 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.42208481428009620e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   4.95000E-01  1.00000E-03         1801          516       2            5.63 
   5.00000E-01  1.00000E-03         1816          521       2            5.68 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.14819817298786950e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.00000E-01  1.00000E-03         1816          521       2            5.68 
   5.05000E-01  1.00000E-03         1831          526       2            5.73 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.07562421211807300e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.05000E-01  1.00000E-03         1831          526       2            5.73 
   5.10000E-01  1.00000E-03         1846          531       2            5.76 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.24018066951698640e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.10000E-01  1.00000E-03         1846          531       2            5.76 
   5.15000E-01  1.00000E-03         1861          536       2            5.80 

  End Simulation

  Simulate status=0

 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=4.66616737463612590e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.15000E-01  1.00000E-03         1861          536       2            5.80 
   5.20000E-01  1.00000E-03         1876          541       2            5.85 

  End Simulation

  Simulate status=0

 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=5.36618946156548260e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.20000E-01  1.00000E-03         1876          541       2            5.85 
   5.25000E-01  1.00000E-03         1891          546       2            5.88 

  End Simulation

  Simulate status=0

 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=6.34139788142091930e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.25000E-01  1.00000E-03         1891          546       2            5.88 
   5.30000E-01  1.00000E-03         1906          551       2            5.93 

  End Simulation

  Simulate status=0

 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=7.58206333870708040e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.30000E-01  1.00000E-03         1906          551       2            5.93 
   5.35000E-01  1.00000E-03         1921          556       2            5.97 

  End Simulation

  Simulate status=0

 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=9.06843113289614560e+004
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.35000E-01  1.00000E-03         1921          556       2            5.97 
   5.40000E-01  1.00000E-03         1936          561       2            6.01 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.07717974318243340e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.40000E-01  1.00000E-03         1936          561       2            6.01 
   5.45000E-01  1.00000E-03         1951          566       2            6.04 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.26558025515995410e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.45000E-01  1.00000E-03         1951          566       2            6.04 
   5.50000E-01  1.00000E-03         1966          571       2            6.08 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.46779571974227930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.50000E-01  1.00000E-03         1966          571       2            6.08 
   5.55000E-01  1.00000E-03         1981          576       2            6.12 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.67913989431813800e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.55000E-01  1.00000E-03         1981          576       2            6.12 
   5.60000E-01  1.00000E-03         1996          581       2            6.15 

  End Simulation

  Simulate status=0

 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=1.89468190727173930e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.60000E-01  1.00000E-03         1996          581       2            6.15 
   5.65000E-01  1.00000E-03         2011          586       2            6.24 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.10944932843851330e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.65000E-01  1.00000E-03         2011          586       2            6.24 
   5.70000E-01  1.00000E-03         2026          591       2            6.27 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.31863421188904090e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.70000E-01  1.00000E-03         2026          591       2            6.27 
   5.75000E-01  1.00000E-03         2041          596       2            6.30 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.51778993237084010e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.75000E-01  1.00000E-03         2041          596       2            6.30 
   5.80000E-01  1.00000E-03         2056          601       2            6.35 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.70300585149694870e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.80000E-01  1.00000E-03         2056          601       2            6.35 
   5.85000E-01  1.00000E-03         2071          606       2            6.38 

  End Simulation

  Simulate status=0

 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=2.87104827129655110e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.85000E-01  1.00000E-03         2071          606       2            6.38 
   5.90000E-01  1.00000E-03         2086          611       2            6.41 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.01945932380978370e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.90000E-01  1.00000E-03         2086          611       2            6.41 
   5.95000E-01  1.00000E-03         2101          616       2            6.46 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.14660968374736320e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   5.95000E-01  1.00000E-03         2101          616       2            6.46 
   6.00000E-01  1.00000E-03         2116          621       2            6.51 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.25170551159733440e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.00000E-01  1.00000E-03         2116          621       2            6.51 
   6.05000E-01  1.00000E-03         2131          626       2            6.55 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.33475403443658260e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.05000E-01  1.00000E-03         2131          626       2            6.55 
   6.10000E-01  1.00000E-03         2146          631       2            6.60 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39649502232373690e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.10000E-01  1.00000E-03         2146          631       2            6.60 
   6.15000E-01  1.00000E-03         2161          636       2            6.66 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.43830678984689350e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.15000E-01  1.00000E-03         2161          636       2            6.66 
   6.20000E-01  1.00000E-03         2176          641       2            6.71 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46209528412482240e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.20000E-01  1.00000E-03         2176          641       2            6.71 
   6.25000E-01  1.00000E-03         2191          646       2            6.75 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.47017366982919050e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.25000E-01  1.00000E-03         2191          646       2            6.75 
   6.30000E-01  1.00000E-03         2206          651       2            6.82 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.46513813897806160e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.30000E-01  1.00000E-03         2206          651       2            6.82 
   6.35000E-01  1.00000E-03         2221          656       2            6.85 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.44974404111196170e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.35000E-01  1.00000E-03         2221          656       2            6.85 
   6.40000E-01  1.00000E-03         2236          661       2            6.88 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.42678530891315600e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.40000E-01  1.00000E-03         2236          661       2            6.88 
   6.45000E-01  1.00000E-03         2251          666       2            6.91 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.39897976497242460e+005
 command: var/297, fun=0.00000000000000000e+000
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.45000E-01  1.00000E-03         2251          666       2            6.91 
   6.50000E-01  1.00000E-03         2266          671       2            6.94 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.36886317575961120e+005
 command: var/297, fun=-1.60701353098247360e-004
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.50000E-01  1.00000E-03         2266          671       2            6.94 
   6.55000E-01  1.00000E-03         2283          676       2            6.99 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.33869581574920800e+005
 command: var/297, fun=-1.98867924459081870e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.55000E-01  1.00000E-03         2283          676       2            6.99 
   6.60000E-01  1.00000E-03         2300          681       1            7.04 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.31038467096389390e+005
 command: var/297, fun=-3.97735848918163300e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.60000E-01  1.00000E-03         2300          681       1            7.04 
   6.65000E-01  1.00000E-03         2317          686       1            7.10 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.28545972670464540e+005
 command: var/297, fun=-5.96603773377245810e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: control/ROUTINE=abgVDM::EventRunFor, func=user(0.005000)
 command: SIMULATE/DYNAMIC, DUR=0.005, DTOUT=0.05


  Begin Simulation

  ****** Performing Dynamic Simulation using Gstiff I3 Integrator ******
   The system is modelled with INDEX-3 DAEs.
   The integrator is GSTIFF, CORRECTOR = original
   Integration error =    1.000000E-02

   Simulation      Step        Function    Cumulative   Integration     CPU
      Time         Size       Evaluations  Steps Taken    Order        time
   ___________  ___________   ___________  ___________   _________    ________
   6.65000E-01  1.00000E-03         2317          686       1            7.10 
   6.70000E-01  1.00000E-03         2334          691       1            7.14 

  End Simulation

  Simulate status=0

 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003
 command: var/296, fun=3.26503677403813930e+005
 command: var/297, fun=-7.95471697836326940e-003

  Termination status=0

Terminating Adams/Car usersubs...


Finished -----
Elapsed time = 34.18s,  CPU time = 7.18s,  20.99%
