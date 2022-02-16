function [sys,x0,str,ts]=TERMINATION_CHECK(t,x,u,flag)
    switch flag
        case 0  
            [sys,x0,str,ts] = mdlInitializeSizes();
        case 1 
            sys             = []; 
        case 2 
            sys             = [];
        case 3 
            sys             = mdlOutputs(t,x,u); 
        otherwise
            sys             = [];
    end
end

function [sys,x0,str,ts] = mdlInitializeSizes()
    sizes                   = simsizes;
    sizes.NumContStates     = 0;
    sizes.NumDiscStates     = 0;
    sizes.NumOutputs        = 1;
    sizes.NumInputs         = 6;
    sizes.NumSampleTimes    = 1;
    sizes.DirFeedthrough    = 1;
    sys                     = simsizes(sizes);
    x0                      = [];
    str                     = [];
    ts                      = [0, 0];
end

function sys=mdlOutputs(t,x,u)
% HIT               = COLLISION_CHECK(SPEC, TST, SIM);
% LIFT              = CONTACT_CHECK(OBS, SIM);
% GOAL_REACHED      = COMPLETION_CHECK(PARA, OBS, SIM);

global SPEC PARA SIM
global PUSH
global DEAD_END HIT

if DEAD_END == true
    disp('#############################################')
    disp('# The simulation is terminated: dead end. #')
    disp('#############################################')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ZERO_U              = false;

if u(4) == 0 && t > 0.01
    ZERO_U          = true;
    disp('#############################################')
    disp('# The simulation is terminated: zero speed. #')
    disp('#############################################')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GOAL_PASSED         = false;  

if SIM.RTG_IND >= 2 && PUSH.CMD_TM(end) < PARA.EXECUTION_TIME
    GOAL_PASSED     = true;
    disp('#############################################')
    disp('# The simulation is terminated: missed goal. #')
    disp('#############################################')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GOAL_REACHED        = false;

XX                  = PARA.VP_GOAL(1) - u(1);
YY                  = PARA.VP_GOAL(2) - u(2);
if sqrt(XX^2 + YY^2) <= PARA.DIST2GOAL_THLD + PARA.CONTROL_DELAY_EST*u(4)
    GOAL_REACHED  	= true;
    disp('############################################')
    disp('# The simulation is successfully finished! #')
    disp('############################################')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if HIT == true
    disp('#############################################')
    disp('# The simulation is terminated: collision. #')
    disp('#############################################')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ZERO_U == true || GOAL_REACHED == true || GOAL_PASSED == true || DEAD_END == true || HIT == true
    sys = 1;
else
    sys = 0;
end

end