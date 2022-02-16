FZ0     = 35000;

PCY1    = 1.5874;               %Shape factor Cfy for lateral forces         
PDY1    = 0.73957;              %Lateral friction Muy         
PDY2    = -0.075004;            %Variation of friction Muy with load         
PEY1    = 0.37562;              %Lateral curvature Efy at Fznom         
PEY2    = -0.069325;            %Variation of curvature Efy with load         
PEY3    = 0.29168;              %Zero order camber dependency of curvature Efy         
PKY1    = -10.289;              %Maximum value of stiffness Kfy/Fznom         
PKY2    = 3.3343;               %Load at which Kfy reaches maximum value             
PHY1    = 0.0056509;            %Horizontal shift Shy at Fznom         
PHY2    = -0.0020257;           %Variation of shift Shy with load          
PVY1    = 0.015216;             %Vertical shift in Svy/Fz at Fznom         
PVY2    = -0.010365;            %Variation of shift Svy/Fz with load  

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


PC1     = PCY1;
PD1     = PDY1 - PDY2;
PD2     = PDY2/FZ0;
PE1     = PEY1 - PEY2;
PE2     = PEY2/FZ0;
PE3     = PEY3;
PK1     = PKY1*FZ0;
PK2     = 1/(PKY2*FZ0);
PH1     = PHY1 - PHY2;
PH2     = PHY2/FZ0;
PV1     = PVY1 - PVY2;
PV2     = PVY2/FZ0;

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

fid = fopen('DATA_PAC2002_FY_M.cpp', 'wt');
fprintf(fid, '#define PC1\t %5.20f\n', PC1);
fprintf(fid, '#define PD1\t %5.20f\n', PD1);
fprintf(fid, '#define PD2\t %5.20f\n', PD2);
fprintf(fid, '#define PE1\t %5.20f\n', PE1);
fprintf(fid, '#define PE2\t %5.20f\n', PE2);
fprintf(fid, '#define PE3\t %5.20f\n', PE3);
fprintf(fid, '#define PK1\t %5.20f\n', PK1);
fprintf(fid, '#define PK2\t %5.20f\n', PK2);
fprintf(fid, '#define PH1\t %5.20f\n', PH1);
fprintf(fid, '#define PH2\t %5.20f\n', PH2);
fprintf(fid, '#define PV1\t %5.20f\n', PV1);
fprintf(fid, '#define PV2\t %5.20f\n', PV2);

fprintf(fid, '#define RB1\t %5.20f\n', RB1);
fprintf(fid, '#define RB2\t %5.20f\n', RB2);
fprintf(fid, '#define RB3\t %5.20f\n', RB3);
fprintf(fid, '#define RC1\t %5.20f\n', RC1);
fprintf(fid, '#define RE1\t %5.20f\n', RE1);
fprintf(fid, '#define RE2\t %5.20f\n', RE2);
fprintf(fid, '#define RH1\t %5.20f\n', RH1);
fprintf(fid, '#define RH2\t %5.20f\n', RH2);
fprintf(fid, '#define RV1\t %5.20f\n', RV1);
fprintf(fid, '#define RV2\t %5.20f\n', RV2);
fprintf(fid, '#define RV4\t %5.20f\n', RV4);
fprintf(fid, '#define RV5\t %5.20f\n', RV5);
fprintf(fid, '#define RV6\t %5.20f\n', RV6);
fclose(fid);