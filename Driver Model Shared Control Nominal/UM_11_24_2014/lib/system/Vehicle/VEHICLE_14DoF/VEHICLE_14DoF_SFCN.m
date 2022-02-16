function [sys, x0,str,ts] = VEHICLE_14DoF_SFCN(t,x,u,flag)

%   See sfuntmpl.m for a general S-function template.
%   FLAG   RESULT             DESCRIPTION
%   -----  ------             --------------------------------------------
%   0      [SIZES,X0,STR,TS]  Initialization, return system sizes in SYS,
%                             initial state in X0, state ordering strings
%                             in STR, and sample times in TS.
%   1      DX                 Return continuous state derivatives in SYS.
%   2      DS                 Update discrete states SYS = X(n+1)
%   3      Y                  Return outputs in SYS.
%   4      TNEXT              Return next time hit for variable step sample
%                             time in SYS.
%   5                         Reserved for future (root finding).
%   9      []                 Termination, perform any cleanup SYS=[].

% parameters
global DATA_HMMWV STATES_INIT
g               = DATA_HMMWV.g;
MU              = DATA_HMMWV.MU;
MS              = DATA_HMMWV.MS;
VEHICLEMASS     = DATA_HMMWV.VEHICLEMASS;
LA              = DATA_HMMWV.LA;
LB              = DATA_HMMWV.LB;
LC              = DATA_HMMWV.LC;
LC              = LC/2*[1, 1, 1, 1];
IXX             = DATA_HMMWV.IXX;
IYY             = DATA_HMMWV.IYY;
IZZ             = DATA_HMMWV.IZZ;
KS              = DATA_HMMWV.KS;
KT              = DATA_HMMWV.KT;
CS              = DATA_HMMWV.CS;
ZS_INIT         = DATA_HMMWV.ZS_INIT;
XS_INIT         = DATA_HMMWV.XS_INIT;
ZT_INIT         = DATA_HMMWV.ZT_INIT;
MAXPOWER        = DATA_HMMWV.MAXPOWER;
IW              = DATA_HMMWV.IW;
RW              = DATA_HMMWV.RW;
HRCF            = DATA_HMMWV.HRCF;
HRCR            = DATA_HMMWV.HRCR;

persistent T_FLAG ACCEL SLIP FORCE SUSP TIRE COMMAND 
switch flag
case 0  % initialization
    % sequence:
    % number of continuous states
    % number of discrete states
    % number of outputs
    % number of inputs
    % reserved must be zero
    % direct feedthrough flag
    % number of sample times
    sys         = [32,0, 157, 5, 0, 0, 1];
    
    x0          = STATES_INIT(1:32);
    str         = [];
    ts          = [0 0];   % sample time: [period, offset]
    T_FLAG      = 0;
    ACCEL       = zeros(1,32)';
    SLIP        = zeros(1,8)';
    FORCE       = zeros(1,28)';
    SUSP        = zeros(1,36)';
    TIRE        = zeros(1,16)';
    COMMAND     = zeros(1,5)';
    
case 1 % derivatives 
    %% STATE DEFINITION
    % SPRUNGMASS - 6 DOF
    % - displacements
    XG          = x(1); % longitudinal
    YG          = x(2); % lateral
    ZG          = x(3); % vertical
    PHI         = x(4); % roll    
    THETA       = x(5); % pitch
    PSI         = x(6); % yaw
    % - velocities
    UG          = x(7);          
    VG          = x(8);          
    WG          = x(9); 
    OMEGA_X     = x(10);    
    OMEGA_Y     = x(11);    
    OMEGA_Z     = x(12);
    % UNSPRUNGMASS VERTICAL - 4 DOF
    % 4 unsprung masses vertical velocity in coordinate frame 1
    WU1         = zeros(1, 4);
    WU1(1)      = x(13); 
    WU1(2)      = x(14); 
    WU1(3)      = x(15); 
    WU1(4)      = x(16); 
    % 4 unsprung masses deflection / extension positive
    XT          = zeros(1, 4);
    XT(1)       = x(17); 
    XT(2)       = x(18);  
    XT(3)       = x(19);  
    XT(4)       = x(20); 
    % vertical deflection of 4 corners of sprung mass / extension positive
    XS          = zeros(1, 4);
    XS(1)       = x(21);  
    XS(2)       = x(22);  
    XS(3)       = x(23);	
    XS(4)       = x(24);
    % UNSPRUNGMASS ROTATTION - 4 DOF
    OMEGA_W     = zeros(1, 4);
    OMEGA_W(1)  = x(25); 
    OMEGA_W(2)  = x(26); 
    OMEGA_W(3)  = x(27); 
    OMEGA_W(4)  = x(28);
    
    sys         = zeros(32,1);
    
    %% INPUTS
    % road wheel steering angles
    % front wheel steer (FWS)
    SAFL        = u(1);
    SAFR        = u(2);
    SARL        = u(3);
    SARR        = u(4);
    
    % accleration command
    AC          = u(5);
    
    % % put saturation on the acceleration command
    % if abs(AC) > 1
    %     AC = sign(AC);
    % end

    %% COORDINATES TRANSFORMATION MATRICIES
    % Frame1: Body-Fixed Coordinate Frame Attached to Sprung Mass CG
    % Frame2: Coordinate Frame Attached to Tire-Ground Contact Point
    RX = [1     0           0
          0     cos(PHI)    -sin(PHI)
          0     sin(PHI)    cos(PHI)];

    RY = [cos(THETA)    0   sin(THETA)
          0             1   0
          -sin(THETA)   0   cos(THETA)];

    RZ = [cos(PSI)      -sin(PSI)   0
          sin(PSI)      cos(PSI)    0
          0             0           1];

    % Transformation matrix from frame 2 to frame 1  
    R21 = RX'*RY';
    % Transformation matrix from frame 1 to inertia frame
    RI1 = RX'*RY'*RZ';
    % Transformation matrix from inertia frame to frame 1  
    R1I = RZ*RY*RX;

    %% Velocity at the Four Strut Mounting Points in Coordinate Frame 1 
    % 1 = front left, 2 = front right, 3 = rear left, 4 = rear right
    US1     = UG + [-LC(1) LC(2) -LC(3) LC(4)]*OMEGA_Z;
    VS1     = VG + [LA LA -LB -LB]*OMEGA_Z;
    US1dot  = sys(7) + [-LC(1) LC(2) -LC(3) LC(4)]*sys(12);
    VS1dot  = sys(8) + [LA LA -LB -LB]*sys(12);
    WS1(1)  = WG + LC(1)*OMEGA_X - LA*OMEGA_Y;
    WS1(2)  = WG - LC(2)*OMEGA_X - LA*OMEGA_Y;
    WS1(3)  = WG + LC(3)*OMEGA_X + LB*OMEGA_Y;
    WS1(4)  = WG - LC(4)*OMEGA_X + LB*OMEGA_Y;
    
    % Instantaneous Tire Radius
    RT      = (RW + XT)/(cos(THETA)*cos(PHI));
    % Instantaneous Height of the Four Strut Mounting Points
    LS      = (ZS_INIT - ZT_INIT) + (XS - XS_INIT);
    
    % If tire lift-off happens
    for idx = 1:4
        % if RT(idx) >= RW(idx)
        if XT(idx) >= 0
            XT(idx)     = 0;
            XS(idx)     = 0;
            WU1(idx)    = WS1(idx);
            RT(idx)     = RW(idx);    % Set the tire radius to be unloaded
            LS(idx)     = (ZS_INIT(idx) - ZT_INIT(idx)) + (XS(idx) - XS_INIT(idx));
            % disp(['# ', num2str(idx),' tire lift-off!!'])
        end
    end
    
    %% Velocity of Unsprung Masses in Coordinate Frame 1 
    UU1     = US1 - LS*OMEGA_Y;
    VU1     = VS1 + LS*OMEGA_X;
    UU1dot  = US1dot - (LS*sys(11) + sys(21:24)'*OMEGA_Y);
    VU1dot  = VS1dot + (LS*sys(10) + sys(21:24)'*OMEGA_X);
    
    %% Longitudinal and Lateral Velocities of the Tire Contact Patch in Frame 2
    UG1     = UU1 - RT*OMEGA_Y;
    VG1     = VU1 + RT*OMEGA_X;
    WG1     = WU1;
    % from Coordinate Frame 1 to Coordinate Frame 2: RY*RX
    UG2     = cos(THETA)*UG1 + sin(THETA)*sin(PHI)*VG1 + sin(THETA)*cos(PHI)*WG1;
    VG2     = cos(PHI)*VG1 - sin(PHI)*WG1;
    
    %% resolve parallel to the tire direction
    UT(1)   = UG2(1)*cos(SAFL) + VG2(1)*sin(SAFL);
    VT(1)   = -UG2(1)*sin(SAFL) + VG2(1)*cos(SAFL);
    UT(2)   = UG2(2)*cos(SAFR) + VG2(2)*sin(SAFR);
    VT(2)   = -UG2(2)*sin(SAFR) + VG2(2)*cos(SAFR);
    UT(3)   = UG2(3);
    VT(3)   = VG2(3);
    UT(4)   = UG2(4);
    VT(4)   = VG2(4);
    
    % Suspension and Tire Forces
    DAMPER_VEL = WS1 - WU1;
    for idx = 1:4
        if abs(WS1(idx)-WU1(idx))> 0.3391
            DAMPER_VEL(idx) = 0.3391*sign(WS1(idx)-WU1(idx));
            % disp(['# ', num2str(idx),' large damping velocity!!'])
        end
    end
    
    % FD(1)   = interp1f(CS.RS, CS.FDF, DAMPER_VEL(1), 'pchip');
    % FD(2)   = interp1f(CS.RS, CS.FDF, DAMPER_VEL(2), 'pchip');
    % FD(3)   = interp1f(CS.RS, CS.FDR, DAMPER_VEL(3), 'pchip');
    % FD(4)   = interp1f(CS.RS, CS.FDR, DAMPER_VEL(4), 'pchip');
    
    % ScaleTime only works when the input data is equally spaced
    DAMPER_VEL = (DAMPER_VEL - CS.RS_INIT)*CS.RS_SLOPE + 1;
    FD(1)   = ScaleTime(CS.FDF, DAMPER_VEL(1));
    FD(2)   = ScaleTime(CS.FDF, DAMPER_VEL(2));
    FD(3)   = ScaleTime(CS.FDR, DAMPER_VEL(3));
    FD(4)   = ScaleTime(CS.FDR, DAMPER_VEL(4));
    
    FS      = KS.*XS;	% Spring Force
    FT      = KT.*XT;	% Tire Force
    FTZ     = - FT;    	% Tire Vertical Load - Downward Positive

    %% Tire Forces
    % Tire Forces place holder
    FTX     = zeros(1,4);       % Longitudinal Tire Force 
    FTY     = zeros(1,4);       % Lateral Tire Force
    MTX     = zeros(1,4);       
    MTY     = zeros(1,4);       
    MTZ     = zeros(1,4);       % Aligning Moment
    
    KAPPA   = -(UT - RT.*OMEGA_W)./abs(UT);
    ALPHA   = atan(VT./abs(UT));

    for idx2 = 1:4
        % If tire lift-off happens
        if FTZ(idx2) == 0
            FTX(idx2) = 0;
            FTY(idx2) = 0;
            MTX(idx2) = 0;
            MTY(idx2) = 0;
            MTZ(idx2) = 0;
        else
            [FTX(idx2), FTY(idx2), MTX(idx2), MTY(idx2), MTZ(idx2)] = TIRE_MODEL(FTZ(idx2), KAPPA(idx2), ALPHA(idx2));
        end
    end 

    %% Forces acting at the tire contact patch in coordinate frame 2
    FT      = [FTX;FTY;FTZ];
    FT(1,1) = FTX(1)*cos(SAFL) - FTY(1)*sin(SAFL); 
    FT(2,1) = FTX(1)*sin(SAFL) + FTY(1)*cos(SAFL);
    FT(1,2) = FTX(2)*cos(SAFR) - FTY(2)*sin(SAFR); 
    FT(2,2) = FTX(2)*sin(SAFR) + FTY(2)*cos(SAFR);

    %% Forces at the tire contact patch in coordinate frame 1
    FSG     = R21*FT;
    FSGX    = FSG(1,:);
    FSGY    = FSG(2,:);
    FSGZ    = FSG(3,:);

    %% Forces transmitted to sprung mass in coordinate frame 1
    FSX     = FSGX + MU*g*sin(THETA) - MU.*(UU1dot - VU1*OMEGA_Z + WU1*OMEGA_Y);
    FSY     = FSGY - MU*g*sin(PHI)*cos(THETA) - MU.*(VU1dot + UU1*OMEGA_Z - WU1*OMEGA_X);
    FSZ     = FD + FS;

    %% ROLL CENTER
    MX      = FSGY.*RT + FSY.*LS;
    MY      = -(FSGX.*RT + FSX.*LS);
    FJ(1)   = (MX(1) + MX(2) - (FSY(1)+FSY(2))*HRCF)/(LC(1) + LC(2));
    FJ(2)   = - FJ(1);
    FJ(3)   = (MX(3) + MX(4) - (FSY(3)+FSY(4))*HRCR)/(LC(3) + LC(4));
    FJ(4)   = - FJ(3);
    
    %% AERODYNAMICS
    FXA     = 0;
    FYA     = 0;
    FZA     = 0;
    MXA     = 0;
    MYA     = 0; 
    MZA     = 0;
    
    %% 
    VELOCITY    = R1I*[UG;VG;WG];
    UI          = VELOCITY(1);
    VI          = VELOCITY(2);
    WI          = VELOCITY(3);
    
    EULERANGLES = [ 1   sin(PHI)*tan(THETA)     cos(PHI)*tan(THETA)
                    0   cos(PHI)                -sin(PHI)
                    0   sin(PHI)/cos(THETA)     cos(PHI)/cos(THETA) ];

    ANGULAR_VELOCITY = EULERANGLES*[OMEGA_X;OMEGA_Y;OMEGA_Z];
    PHI_dot     = ANGULAR_VELOCITY(1);
    THETA_DOT   = ANGULAR_VELOCITY(2);
    PSI_DOT     = ANGULAR_VELOCITY(3);
    
    GRAVITY     = RI1*[0;0;-MS*g];

    sys(1)      = UI;
    sys(2)      = VI;
    sys(3)      = WI;  
    sys(4)      = PHI_dot;
    sys(5)      = THETA_DOT;
    sys(6)      = PSI_DOT;
    sys(7)      = (  sum(FSX) + GRAVITY(1) + FXA)/MS + (VG*OMEGA_Z - WG*OMEGA_Y);
    sys(8)      = (  sum(FSY) + GRAVITY(2) + FYA)/MS + (WG*OMEGA_X - UG*OMEGA_Z);
    sys(9)      = (- sum(FSZ) + GRAVITY(3) + FZA)/MS + (UG*OMEGA_Y - VG*OMEGA_X);
    sys(10)     = ((- FSZ(1)*LC(1) + FSZ(2)*LC(2) - FSZ(3)*LC(3) + FSZ(4)*LC(4))...
                    + (IYY-IZZ)*OMEGA_Y*OMEGA_Z + sum(MX) + sum(MTX) + MXA)/IXX;
    sys(11)     = ((FSZ(1)*LA + FSZ(2)*LA - FSZ(3)*LB - FSZ(4)*LB)...
                    + (IZZ-IXX)*OMEGA_X*OMEGA_Z + sum(MY) + sum(MTY) + MYA)/IYY;  
    sys(12)     = (- FSX(1)*LC(1) + FSX(2)*LC(2) - FSX(3)*LC(3) + FSX(4)*LC(4)...
                    + FSY(1)*LA + FSY(2)*LA - FSY(3)*LB - FSY(4)*LB...
                    + (IXX-IYY)*OMEGA_X*OMEGA_Y + sum(MTZ) + MZA)/IZZ;
            
    %% Suspension Differential Equations
    sys(13:16)  = (-MU*g*cos(PHI)*cos(THETA) + FSGZ + FJ + FS + FD)./MU - OMEGA_X*VU1 + OMEGA_Y*UU1;
    WUI         = -sin(THETA)*UU1 + cos(THETA)*sin(PHI)*VU1 + cos(THETA)*cos(PHI)*WU1;
    sys(17:20)  = WUI;
    sys(21:24)  = WS1 - WU1;

    %% TIRE ROTATION DYNAMICS
    KAPPAMAX    = 0.1;      % limits the longitudinal slip
    SMALL       = 0.00001;  % for acceleration demand check
    OMEGA_0     = 0.01;     % for detecting wheel lock
    DRIVE       = [0.25 0.25 0.25 0.25]; % apportionment of drive torque
    BRAKE       = [0.25 0.25 0.25 0.25]; % apportionment of brake torque
    TW          = [0 0 0 0];

    if AC > SMALL
        FDrive  = AC*VEHICLEMASS; % equivalent drive force
        Power   = FDrive*UG;
        if Power > MAXPOWER
            FDrive = FDrive*MAXPOWER/Power; 
            % disp('Maxium Power Required')
        end
        TW      = DRIVE*FDrive.*RT;       
    elseif AC < - SMALL
      TW        = BRAKE*AC*VEHICLEMASS.*RT;
      % reverse brake torque if wheel spins backwards
      TW        = TW.*sign(OMEGA_W); 
      % moderate the brake torque when the wheel locks
      lock      = find(abs(OMEGA_W) < OMEGA_0); % identifies any locked wheels
      if ~isempty(lock) > 0
          %add damping at low angular velocities
          TW(lock) = TW(lock).*abs(OMEGA_W(lock)); 
      end
    end
    
    sys(25:28)  = (TW-FTX.*RT)./IW;
    
    %spinning wheels
    cut         = find(abs(KAPPA) >= KAPPAMAX); 
    if ~isempty(cut)
        % check if the applied torque increases slip
        cut2    = find(TW.*KAPPA > 0); 
        cut     = intersect(cut,cut2);
        if ~isempty(cut)
            % remove the torque from these wheels
            sys(cut+24)= -FTX(cut).*RT(cut)./IW(cut);
            % disp('Torque Removed')
        end
    end
    
    sys(29:32)  = OMEGA_W;
    WHEEL_SPEED = OMEGA_W.*RT;

    %%
    sys         = sys(:);
    ACCEL       = sys(1:32); 
    SLIP        = [KAPPA,ALPHA]';
    FORCE       = [FTX,FTY,FTZ,MTZ,FSX,FSY,FSZ]';
    SUSP        = [XT,XS,RT,LS,WU1,WS1,FD,FS,FJ]';
    TIRE        = [UT,VT,WHEEL_SPEED,TW]';
    COMMAND     = [SAFL,SAFR,SARL,SARR,AC]';

    %%
    % occasional output of simulation time to screen
    if t >= T_FLAG + 0.1
        T_FLAG = T_FLAG + 0.1;
%         fprintf([num2str(T_FLAG),' \n'])
    end
    
case 2  % Discrete state update
    sys	= []; % do nothing
   
case 3 	% Outputs
	sys	= [x;ACCEL;SLIP;FORCE;SUSP;TIRE;COMMAND];
    
case 9  % Terminate
    sys	= []; % do nothing
   
otherwise
   error(['unhandled flag = ',num2str(flag)]);
end
