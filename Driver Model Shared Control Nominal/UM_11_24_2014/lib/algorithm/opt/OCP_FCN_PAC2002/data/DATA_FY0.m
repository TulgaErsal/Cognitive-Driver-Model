function [ PC1, PD1, PD2, PE1, PE2, PE3, ...
           PK1, PK2, PH1, PH2, PV1, PV2] = DATA_FY0()

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

% save DATA_FY0 PC1 PD1 PD2 PE1 PE2 PE3 PK1 PK2 PH1 PH2 PV1 PV2