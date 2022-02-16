function [sys,x0,str,ts]=CONTROLLER(t,x,u,flag)
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
    sizes.NumOutputs        = 2;
    sizes.NumInputs         = 6;
    sizes.NumSampleTimes    = 1;
    sizes.DirFeedthrough    = 1;
    sys                     = simsizes(sizes);
    x0                      = [];
    str                     = [];
    ts                      = 0.0001;
end

function sys=mdlOutputs(t,x,u)
    global SPEC PARA SIM
    global TST TAC OBS CMP
    global RUN EXE PUSH
    global DEAD_END HIT
    
    global ALG_IND RUN0_IND
    
    % record states
    data_out    = [t, u'];
    dlmwrite(SIM.ts_fn, data_out, '-append')
    
    % initial sensing delay compensation
    if t == 0 && ~isempty(RUN)
        RUN0_IND = 1;
        t0 = RUN.T_TOTAL;
    else
        t0 = 0;
    end
    
    if RUN0_IND == 1 && t <= RUN.T_TOTAL
        sys = [ interp1(RUN.CMD_TM, RUN.CMD_SA, t), ...
                interp1(RUN.CMD_TM, RUN.CMD_UX, t)];
        
        if mod(t, 0.01) == 0
            disp('RUN')
            disp(['Time: ', num2str(t)])
            % disp(['SA: ', num2str(sys(1)*180/pi)])
            % disp(['(X, Y): (', num2str(u(1)),' ,', num2str(u(2)), ')'])
            disp(['U: ', num2str(u(4))])
        end
        
        return;
    end
    
    % MPC-based obstacle avoidance algorithm
    T_EXECUTE   = PARA.EXECUTION_TIME;
    
    t_round     = floor((t - t0)*1000)/1000;
    t_rem       = mod(t_round,T_EXECUTE);

    if t_rem == 0 && ALG_IND == 0
        ALG_IND = 1;
        
        disp('calculating')

        if floor(t*1000)/1000 ~= 0
            TST = TRUE_STATES_ADAMS(TST, u, t_round, SIM.ts_fn);
            OBS	= OBSERVER(TST);

            HIT = COLLISION_CHECK_ADAMS(SPEC, TST);
        end
        
        MPC_NAVIGATION;
        
        ADAMS_COMMANDS;

        if SIM.SAVEDATA == YES
            save([SIM.logfolder,'/STEP_',num2str(SIM.STEPCNT),'.mat'])
        end
        
        closeLOG(SIM);
    end
    
    if t_rem ~= 0 && ALG_IND == 1
        ALG_IND = 0;
    end

    % output
    sys = [ interp1(RUN.CMD_TM, RUN.CMD_SA, t_rem), ...
            interp1(RUN.CMD_TM, RUN.CMD_UX, t_rem)];
    
    if mod(t_round + t0, 0.01) == 0
        disp(['Time: ', num2str(t_round + t0)])
        % disp(['SA: ', num2str(sys(1)*180/pi)])
        % disp(['(X, Y): (', num2str(u(1)),' ,', num2str(u(2)), ')'])
        disp(['U: ', num2str(u(4))])
    end
end
