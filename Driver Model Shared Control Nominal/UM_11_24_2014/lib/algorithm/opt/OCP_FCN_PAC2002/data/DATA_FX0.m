function [ PC1, PD1, PD2, PE1, PE2, PE3, PE4, ... 
           PK1, PK2, PK3, PK4, PH1, PH2, PV1, PV2] = DATA_FX0()

FZ0     = 35000;

PCX1    = 1.7204;               %Shape factor Cfx for longitudinal force         
PDX1    = 0.77751;              %Longitudinal friction Mux at Fznom         
PDX2    = -0.24431;             %Variation of friction Mux with load               
PEX1    = 0.46659;              %Longitudinal curvature Efx at Fznom         
PEX2    = 0.393;                %Variation of curvature Efx with load         
PEX3    = 0.076024;             %Variation of curvature Efx with load squared         
PEX4    = 2.6509e-006;          %Factor in curvature Efx while driving         
PKX1    = 14.848;               %Longitudinal slip stiffness Kfx/Fz at Fznom         
PKX2    = -9.8161;              %Variation of slip stiffness Kfx/Fz with load         
PKX3    = 0.15818;              %Exponent in slip stiffness Kfx/Fz with load         
PHX1    = -0.00088873;          %Horizontal shift Shx at Fznom         
PHX2    = -0.00067818;          %Variation of shift Shx with load         
PVX1    = -5.5714e-007;         %Vertical shift Svx/Fz at Fznom         
PVX2    = 6.2972e-006;          %Variation of shift Svx/Fz with load

PC1     = PCX1;
PD1     = PDX1 - PDX2;
PD2   	= PDX2/FZ0;
PE1     = PEX1 - PEX2 + PEX3;
PE2   	= (PEX2 - 2*PEX3)/FZ0;
PE3     = PEX3/FZ0.^2;
PE4     = PEX4;
PK1     = PKX1 - PKX2;
PK2     = PKX2/FZ0;
PK3     = PKX3;
PK4     = PKX3/FZ0;
PH1     = PHX1 - PHX2;
PH2     = PHX2/FZ0;
PV1     = PVX1 - PVX2;
PV2     = PVX2/FZ0;

% save DATA_FX0 PC1 PD1 PD2 PE1 PE2 PE3 PE4 PK1 PK2 PK3 PK4 PH1 PH2 PV1 PV2