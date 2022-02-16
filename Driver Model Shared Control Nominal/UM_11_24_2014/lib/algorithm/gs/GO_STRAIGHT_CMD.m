function EXE = GO_STRAIGHT_CMD(PARA, VCS)

% small time
ST                  = 0.001; %#THLD#

if PARA.MODE == ConstantSpeed || abs(VCS.U0 - PARA.U_MAX) < 0.01
    % move at constant speed
    
    % target speed
    if PARA.MODE == ConstantSpeed
        U_TARGET 	= PARA.U_INIT;
    elseif abs(VCS.U0 - PARA.U_MAX) < 0.01
        U_TARGET 	= PARA.U_MAX;
    end
    
    % planning time
    PT              = min([PARA.PLANNING_TIME, VCS.DIST2GOAL / U_TARGET]);
    
    % transition time
    TT              = abs(VCS.SA0/PARA.SR_SYS_MAX);
    
    TM_SEQ_UX      	= [0,           PT + 1];
    UX_SEQ         	= [U_TARGET,    U_TARGET];
    AX_SEQ          = [0,           0];
    
    D_SEQ           = VCS.DIST2GOAL - TM_SEQ_UX*U_TARGET;
else
    % accelerate to maximum speed
    
    % acceleration time
    AT          	= (PARA.U_MAX - VCS.U0)/PARA.AX_MAX;
    
    % distance required to accelerate to the maximum
    MD          	= (PARA.U_MAX^2 -  VCS.U0^2)/(2*PARA.AX_MAX);
    
    if  VCS.DIST2GOAL <= MD
        % final speed
        FU        	= sqrt(VCS.DIST2GOAL*(2*PARA.AX_MAX) + VCS.U0^2);
        
        % time to goal
        GT        	= (FU - VCS.U0)/PARA.AX_MAX;
    else
        
        % time to goal
        GT      	= AT + (VCS.DIST2GOAL - MD)/PARA.U_MAX;
    end

    % planning time
    PT            	= min([PARA.PLANNING_TIME, GT]);
    
    % transition time
    TT              = abs(VCS.SA0/PARA.SR_SYS_MAX);
    
    TM_SEQ_UX       = [0,           AT,          AT + ST,     AT + PT];
    UX_SEQ          = [VCS.U0,      PARA.U_MAX,  PARA.U_MAX,  PARA.U_MAX];
    AX_SEQ          = [PARA.AX_MAX, PARA.AX_MAX, 0,           0];
    
    D_SEQ           = VCS.DIST2GOAL - ...
                      [0, MD, MD + PARA.U_MAX*ST, MD + PARA.U_MAX*PT];
end

CMD_TM              = linspace(0, PT, 1000);

if TT ~= 0
    TM_SEQ_SA     	= [0, TT, TT + ST, TT + PT];
    SA_SEQ         	= [VCS.SA0, 0, 0, 0];
    
    if VCS.SA0 > 0
        SR_SEQ    	= [PARA.SR_SYS_MIN, PARA.SR_SYS_MIN, 0, 0];
    elseif VCS.SA0 < 0
        SR_SEQ    	= [PARA.SR_SYS_MAX, PARA.SR_SYS_MAX, 0, 0];
    elseif VCS.SA0 == 0
        SR_SEQ   	= [0, 0, 0, 0];
    end
else
    TM_SEQ_SA     	= [0, TT + PT];
    SA_SEQ        	= [0, 0];
    SR_SEQ          = [0, 0];
end

EXE.NAVI_TM         = CMD_TM;
EXE.NAVI_SA         = interp1f(TM_SEQ_SA, SA_SEQ, CMD_TM, 'linear');
EXE.NAVI_UX         = interp1f(TM_SEQ_UX, UX_SEQ, CMD_TM, 'linear');
EXE.NAVI_SR         = interp1f(TM_SEQ_SA, SR_SEQ, CMD_TM, 'linear');
EXE.NAVI_AX         = interp1f(TM_SEQ_UX, AX_SEQ, CMD_TM, 'linear');

D_END               = interp1f(TM_SEQ_UX, D_SEQ, PT, 'linear');

EXE.D_END           = D_END;
EXE.OBJEC           = D_END;