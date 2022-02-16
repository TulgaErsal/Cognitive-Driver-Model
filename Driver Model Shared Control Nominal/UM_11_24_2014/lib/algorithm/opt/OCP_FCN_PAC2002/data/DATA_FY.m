function [ PD1, PD2, RB1, RB2, RB3, RC1, RE1, RE2, ...
           RH1, RH2, RV1, RV2, RV4, RV5, RV6] = DATA_FY()

FZ0     = 35000;

PDY1    = 0.73957;              %Lateral friction Muy         
PDY2    = -0.075004;            %Variation of friction Muy with load    

RBY1    = 13.271;               %Slope factor for combined Fy reduction         
RBY2    = 5.2405;               %Variation of slope Fy reduction with alpha         
RBY3    = 1.1547e-005;          %Shift term for alpha in slope Fy reduction         
RCY1    = 1.01;                 %Shape factor for combined Fy reduction         
REY1    = 0.010513;             %Curvature factor of combined Fy         
REY2    = 5.9816e-005;          %Curvature factor of combined Fy with load         
RHY1    = 0.028005;             %Shift factor for combined Fy reduction         
RHY2    = -4.8794e-005;         %Shift factor for combined Fy reduction with load         
RVY1    = 0.0066878;            %Kappa induced side force Svyk/Muy*Fz at Fznom         
RVY2    = -0.042813;            %Variation of Svyk/Muy*Fz with load                
RVY4    = -0.019796;            %Variation of Svyk/Muy*Fz with alpha         
RVY5    = 1.9;                  %Variation of Svyk/Muy*Fz with kappa         
RVY6    = -7.8097;              %Variation of Svyk/Muy*Fz with atan(kappa)    

PD1     = PDY1 - PDY2;
PD2     = PDY2/FZ0;

RB1     = RBY1;
RB2     = RBY2;
RB3     = RBY3;
RC1     = RCY1;
RE1     = REY1 - REY2;
RE2     = REY2/FZ0;
RH1     = RHY1 - RHY2;
RH2     = RHY2/FZ0;
RV1     = RVY1 - RVY2;
RV2     = RVY2/FZ0;
RV4     = RVY4;
RV5     = RVY5;
RV6     = RVY6;

% save DATA_FY PD1 PD2 RB1 RB2 RB3 RC1 RE1 RE2 RH1 RH2 RV1 RV2 RV4 RV5 RV6