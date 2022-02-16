% pac2002_315_80R22_5.tir
DATA_TIRE.LONGVL                   = 16.7;                 %Measurement speed 
DATA_TIRE.UNLOADED_RADIUS          = 0.548;                %Free tyre radius    
% [VERTICAL]
DATA_TIRE.VERTICAL_STIFFNESS       = 784944;               %Tyre vertical stiffness         
DATA_TIRE.VERTICAL_DAMPING         = 0;                    %Tyre vertical damping         
DATA_TIRE.BREFF                    = 3.5;                  %Low load stiffness e.r.r.         
DATA_TIRE.DREFF                    = 0.5;                  %Peak value of e.r.r.         
DATA_TIRE.FREFF                    = -0.005;               %High load stiffness e.r.r.         
DATA_TIRE.FNOMIN                   = 35000;                %Nominal wheel load
% [LONG_SLIP_RANGE]
DATA_TIRE.KPUMIN                   = -1.5;                 %Minimum valid wheel slip         
DATA_TIRE.KPUMAX                   = 1.5;                  %Maximum valid wheel slip         
% [SLIP_ANGLE_RANGE]
DATA_TIRE.ALPMIN                   = -1.5708;              %Minimum valid slip angle         
DATA_TIRE.ALPMAX                   = 1.5708;               %Maximum valid slip angle         
% [INCLINATION_ANGLE_RANGE]
DATA_TIRE.CAMMIN                   = -0.26181;             %Minimum valid camber angle         
DATA_TIRE.CAMMAX                   = 0.26181;              %Maximum valid camber angle         
% [VERTICAL_FORCE_RANGE]
DATA_TIRE.FZMIN                    = 1750;                 %Minimum allowed wheel load         
DATA_TIRE.FZMAX                    = 78750;                %Maximum allowed wheel load 
%% [SCALING_COEFFICIENTS]
DATA_TIRE.LFZO = 1;                    %Scale factor of nominal (rated) load         
DATA_TIRE.LCX  = 1;                    %Scale factor of Fx shape factor         
DATA_TIRE.LMUX = 1;                    %Scale factor of Fx peak friction coefficient         
DATA_TIRE.LEX  = 1;                    %Scale factor of Fx curvature factor         
DATA_TIRE.LKX  = 1;                    %Scale factor of Fx slip stiffness         
DATA_TIRE.LHX  = 1;                    %Scale factor of Fx horizontal shift         
DATA_TIRE.LVX  = 1;                    %Scale factor of Fx vertical shift         
DATA_TIRE.LGAX = 1;                    %Scale factor of camber for Fx         

DATA_TIRE.LCY  = 1;                    %Scale factor of Fy shape factor         
DATA_TIRE.LMUY = 1;                    %Scale factor of Fy peak friction coefficient         
DATA_TIRE.LEY  = 1;                    %Scale factor of Fy curvature factor         
DATA_TIRE.LKY  = 1;                    %Scale factor of Fy cornering stiffness         
DATA_TIRE.LHY  = 1;                    %Scale factor of Fy horizontal shift         
DATA_TIRE.LVY  = 1;                    %Scale factor of Fy vertical shift         
DATA_TIRE.LGAY = 1;                    %Scale factor of camber for Fy         

DATA_TIRE.LTR  = 1;                    %Scale factor of Peak of pneumatic trail         
DATA_TIRE.LRES = 1;                    %Scale factor for offset of residual torque         
DATA_TIRE.LGAZ = 1;                    %Scale factor of camber for Mz         
DATA_TIRE.LXAL = 1;                    %Scale factor of alpha influence on Fx         
DATA_TIRE.LYKA = 1;                    %Scale factor of alpha influence on Fx         
DATA_TIRE.LVYKA= 1;                    %Scale factor of kappa induced Fy         
DATA_TIRE.LS   = 1;                    %Scale factor of Moment arm of Fx         
DATA_TIRE.LSGKP= 1;                    %Scale factor of Relaxation length of Fx         
DATA_TIRE.LSGAL= 1;                    %Scale factor of Relaxation length of Fy         
DATA_TIRE.LGYR = 1;                    %Scale factor of gyroscopic torque         
DATA_TIRE.LMX  = 1;                    %Scale factor of overturning couple         
DATA_TIRE.LVMX = 1;                    %Scale factor of Mx vertical shift         
DATA_TIRE.LMY  = 1;                    %Scale factor of rolling resistance torque         

%% [LONGITUDINAL_COEFFICIENTS]
DATA_TIRE.PCX1 = 1.7204;               %Shape factor Cfx for longitudinal force         
DATA_TIRE.PDX1 = 0.77751;              %Longitudinal friction Mux at Fznom         
DATA_TIRE.PDX2 = -0.24431;             %Variation of friction Mux with load         
DATA_TIRE.PDX3 = -0.00015908;          %Variation of friction Mux with camber         
DATA_TIRE.PEX1 = 0.46659;              %Longitudinal curvature Efx at Fznom         
DATA_TIRE.PEX2 = 0.393;                %Variation of curvature Efx with load         
DATA_TIRE.PEX3 = 0.076024;             %Variation of curvature Efx with load squared         
DATA_TIRE.PEX4 = 2.6509e-006;          %Factor in curvature Efx while driving         
DATA_TIRE.PKX1 = 14.848;               %Longitudinal slip stiffness Kfx/Fz at Fznom         
DATA_TIRE.PKX2 = -9.8161;              %Variation of slip stiffness Kfx/Fz with load         
DATA_TIRE.PKX3 = 0.15818;              %Exponent in slip stiffness Kfx/Fz with load         
DATA_TIRE.PHX1 = -0.00088873;          %Horizontal shift Shx at Fznom         
DATA_TIRE.PHX2 = -0.00067818;          %Variation of shift Shx with load         
DATA_TIRE.PVX1 = -5.5714e-007;         %Vertical shift Svx/Fz at Fznom         
DATA_TIRE.PVX2 = 6.2972e-006;          %Variation of shift Svx/Fz with load         

DATA_TIRE.RBX1 = 11.13;                %Slope factor for combined slip Fx reduction         
DATA_TIRE.RBX2 = -12.494;              %Variation of slope Fx reduction with kappa         
DATA_TIRE.RCX1 = 0.97505;              %Shape factor for combined slip Fx reduction         
DATA_TIRE.REX1 = -0.37196;             %Curvature factor of combined Fx         
DATA_TIRE.REX2 = 0.0017379;            %Curvature factor of combined Fx with load         
DATA_TIRE.RHX1 = 0.0045181;            %Shift factor for combined slip Fx reduction         
DATA_TIRE.PTX1 = 1.5;                  %Relaxation length SigKap0/Fz at Fznom         
DATA_TIRE.PTX2 = 1.4;                  %Variation of SigKap0/Fz with load         
DATA_TIRE.PTX3 = 1;                    %Variation of SigKap0/Fz with exponent of load         

%%[OVERTURNING_COEFFICIENTS]
DATA_TIRE.QSX1 = 0;                    %Lateral force induced overturning moment         
DATA_TIRE.QSX2 = 0;                    %Camber induced overturning couple         
DATA_TIRE.QSX3 = 0;                    %Fy induced overturning couple         

%%[LATERAL_COEFFICIENTS]
DATA_TIRE.PCY1 = 1.5874;               %Shape factor Cfy for lateral forces         
DATA_TIRE.PDY1 = 0.73957;              %Lateral friction Muy         
DATA_TIRE.PDY2 = -0.075004;            %Variation of friction Muy with load         
DATA_TIRE.PDY3 = -8.0362;              %Variation of friction Muy with squared camber         
DATA_TIRE.PEY1 = 0.37562;              %Lateral curvature Efy at Fznom         
DATA_TIRE.PEY2 = -0.069325;            %Variation of curvature Efy with load         
DATA_TIRE.PEY3 = 0.29168;              %Zero order camber dependency of curvature Efy         
DATA_TIRE.PEY4 = 11.559;               %Variation of curvature Efy with camber         
DATA_TIRE.PKY1 = -10.289;              %Maximum value of stiffness Kfy/Fznom         
DATA_TIRE.PKY2 = 3.3343;               %Load at which Kfy reaches maximum value         
DATA_TIRE.PKY3 = -0.25732;             %Variation of Kfy/Fznom with camber         
DATA_TIRE.PHY1 = 0.0056509;            %Horizontal shift Shy at Fznom         
DATA_TIRE.PHY2 = -0.0020257;           %Variation of shift Shy with load         
DATA_TIRE.PHY3 = -0.038716;            %Variation of shift Shy with camber         
DATA_TIRE.PVY1 = 0.015216;             %Vertical shift in Svy/Fz at Fznom         
DATA_TIRE.PVY2 = -0.010365;            %Variation of shift Svy/Fz with load         
DATA_TIRE.PVY3 = -0.31373;             %Variation of shift Svy/Fz with camber         
DATA_TIRE.PVY4 = -0.055766;            %Variation of shift Svy/Fz with camber and load         

DATA_TIRE.RBY1 = 13.271;               %Slope factor for combined Fy reduction         
DATA_TIRE.RBY2 = 5.2405;               %Variation of slope Fy reduction with alpha         
DATA_TIRE.RBY3 = 1.1547e-005;          %Shift term for alpha in slope Fy reduction         
DATA_TIRE.RCY1 = 1.01;                 %Shape factor for combined Fy reduction         
DATA_TIRE.REY1 = 0.010513;             %Curvature factor of combined Fy         
DATA_TIRE.REY2 = 5.9816e-005;          %Curvature factor of combined Fy with load         
DATA_TIRE.RHY1 = 0.028005;             %Shift factor for combined Fy reduction         
DATA_TIRE.RHY2 = -4.8794e-005;         %Shift factor for combined Fy reduction with load         
DATA_TIRE.RVY1 = 0.0066878;            %Kappa induced side force Svyk/Muy*Fz at Fznom         
DATA_TIRE.RVY2 = -0.042813;            %Variation of Svyk/Muy*Fz with load         
DATA_TIRE.RVY3 = -0.16227;             %Variation of Svyk/Muy*Fz with camber         
DATA_TIRE.RVY4 = -0.019796;            %Variation of Svyk/Muy*Fz with alpha         
DATA_TIRE.RVY5 = 1.9;                  %Variation of Svyk/Muy*Fz with kappa         
DATA_TIRE.RVY6 = -7.8097;              %Variation of Svyk/Muy*Fz with atan(kappa)         
DATA_TIRE.PTY1 = 1.2;                  %Peak value of relaxation length SigAlp0/R0         
DATA_TIRE.PTY2 = 2.5;                  %Value of Fz/Fznom where SigAlp0 is extreme         

%% [ROLLING_COEFFICIENTS]
DATA_TIRE.QSY1 = 0.008;                %Rolling resistance torque coefficient         
DATA_TIRE.QSY2 = 0;                    %Rolling resistance torque depending on Fx         
DATA_TIRE.QSY3 = 0;                    %Rolling resistance torque depending on speed         
DATA_TIRE.QSY4 = 0;                    %Rolling resistance torque depending on speed ^4         

%% [ALIGNING_COEFFICIENTS]
DATA_TIRE.QBZ1 = 5.8978;               %Trail slope factor for trail Bpt at Fznom         
DATA_TIRE.QBZ2 = -0.1535;              %Variation of slope Bpt with load         
DATA_TIRE.QBZ3 = -2.0052;              %Variation of slope Bpt with load squared         
DATA_TIRE.QBZ4 = 0.62731;              %Variation of slope Bpt with camber         
DATA_TIRE.QBZ5 = -0.92709;             %Variation of slope Bpt with absolute camber         
DATA_TIRE.QBZ9 = 10.637;               %Slope factor Br of residual torque Mzr         
DATA_TIRE.QBZ10= 0;                    %Slope factor Br of residual torque Mzr         
DATA_TIRE.QCZ1 = 1.4982;               %Shape factor Cpt for pneumatic trail         
DATA_TIRE.QDZ1 = 0.085549;             %Peak trail Dpt" = Dpt*(Fz/Fznom*R0)         
DATA_TIRE.QDZ2 = -0.025298;            %Variation of peak Dpt" with load         
DATA_TIRE.QDZ3 = 0.21486;              %Variation of peak Dpt" with camber         
DATA_TIRE.QDZ4 = -3.9098;              %Variation of peak Dpt" with camber squared         
DATA_TIRE.QDZ6 = -0.0013373;           %Peak residual torque Dmr" = Dmr/(Fz*R0)         
DATA_TIRE.QDZ7 = 0.0013869;            %Variation of peak factor Dmr" with load         
DATA_TIRE.QDZ8 = -0.053513;            %Variation of peak factor Dmr" with camber         
DATA_TIRE.QDZ9 = 0.025817;             %Variation of peak factor Dmr" with camber and load         
DATA_TIRE.QEZ1 = -0.0084519;           %Trail curvature Ept at Fznom         
DATA_TIRE.QEZ2 = 0.0097389;            %Variation of curvature Ept with load         
DATA_TIRE.QEZ3 = 0;                    %Variation of curvature Ept with load squared         
DATA_TIRE.QEZ4 = 4.3583;               %Variation of curvature Ept with sign of Alpha-t         
DATA_TIRE.QEZ5 = -645.04;              %Variation of Ept with camber and sign Alpha-t         
DATA_TIRE.QHZ1 = 0.0085657;            %Trail horizontal shift Sht at Fznom         
DATA_TIRE.QHZ2 = -0.0042922;           %Variation of shift Sht with load         
DATA_TIRE.QHZ3 = 0.14763;              %Variation of shift Sht with camber         
DATA_TIRE.QHZ4 = -0.29999;             %Variation of shift Sht with camber and load         

DATA_TIRE.SSZ1 = -0.019408;            %Nominal value of s/R0: effect of Fx on Mz         
DATA_TIRE.SSZ2 = 0.025786;             %Variation of distance s/R0 with Fy/Fznom         
DATA_TIRE.SSZ3 = 0.31908;              %Variation of distance s/R0 with camber         
DATA_TIRE.SSZ4 = -0.50765;             %Variation of distance s/R0 with load and camber         
DATA_TIRE.QTZ1 = 0;                    %Gyration torque constant         
DATA_TIRE.MBELT= 0;                    %Belt mass of the wheel   

save DATA_TIRE DATA_TIRE