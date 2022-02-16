function [ RB1, RB2, RC1, RE1, RE2, RH1] = DATA_FX()

FZ0     = 35000;

RBX1    = 11.13;                %Slope factor for combined slip Fx reduction         
RBX2    = -12.494;              %Variation of slope Fx reduction with kappa         
RCX1    = 0.97505;              %Shape factor for combined slip Fx reduction         
REX1    = -0.37196;             %Curvature factor of combined Fx         
REX2    = 0.0017379;            %Curvature factor of combined Fx with load         
RHX1    = 0.0045181;            %Shift factor for combined slip Fx reduction   

RB1     = RBX1;
RB2     = RBX2;
RC1     = RCX1;
RE1     = REX1 - REX2;
RE2     = REX2/FZ0;
RH1     = RHX1;

% save DATA_FX RB1 RB2 RC1 RE1 RE2 RH1