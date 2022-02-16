#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

// Data
#include "DATA_PAC2002_FY_M.cpp"

double dMFdX(double VAR, double dVARdX, double E, double dEdX)
{
    double RES;
    double TMP1, dTMP1dX, TMP2, dTMP2dX;
    TMP1     	= VAR - atan(VAR);
    dTMP1dX     = dVARdX - dVARdX/(1 + VAR*VAR);
    TMP2        = VAR - E*TMP1;
    dTMP2dX     = dVARdX - dEdX*TMP1 - E*dTMP1dX;
    RES         = dTMP2dX/(1 + TMP2*TMP2);
    return RES;
}

double dMFdXdY(double VAR, double dVARdX, double dVARdY, double dVARdXdY, 
               double E, double dEdX, double dEdY, double dEdXdY)
{   double RES;
    double TMP1, dTMP1dX, dTMP1dY, dTMP1dXdY;
    double TMP2, dTMP2dX, dTMP2dY, dTMP2dXdY;
    double TMP3, dTMP3dY;
    double TMP4, dTMP4dY; 
    
    TMP1     	= VAR - atan(VAR);
    TMP4        = 1 + VAR*VAR;
    dTMP4dY     = 2*VAR*dVARdY;
    dTMP1dX     = dVARdX - dVARdX/TMP4;
    dTMP1dY     = dVARdY - dVARdY/TMP4;
    dTMP1dXdY	= dVARdXdY - (dVARdXdY*TMP4 - dVARdX*dTMP4dY)/(TMP4*TMP4);
    TMP2        = VAR - E*TMP1;
    dTMP2dX     = dVARdX - dEdX*TMP1 - E*dTMP1dX;
    dTMP2dY     = dVARdY - dEdY*TMP1 - E*dTMP1dY;
    dTMP2dXdY   = dVARdXdY - dEdXdY*TMP1 - dEdX*dTMP1dY - dEdY*dTMP1dX - E*dTMP1dXdY;
    TMP3      	= 1 + TMP2*TMP2;
    dTMP3dY     = 2*TMP2*dTMP2dY;
    RES         = (dTMP2dXdY*TMP3 - dTMP2dX*dTMP3dY)/(TMP3*TMP3);
    return RES;
}

static void HES_PAC2002_FY0(
           double&  FY0,
		   double&	dFY0dZ,
           double&	dFY0dA,
           double&  dFY0dZdZ,
           double&  dFY0dAdZ,
           double&  dFY0dAdA,
           double	FZ,
 		   double	ALPHA
		   )
{
    // Pure slip: FY0
    double ALPHAY, SVY, BY, DY, EY, KY, TMP1, TMP2;
    double SIGN_ALPHAY, SIGN_TMP1;
    
    // Pure slip: dFY0/dZ, dFY0/dA
    double dALPHAYdZ, dSVYdZ, dBYdZ, dDYdZ, dEYdZ, dKYdZ;
    double dALPHAYdA;
    double dTMP1dZ, dTMP2dZ; 
    double dTMP2dA; 
    double INT1, INT2, INT3, C_INT2;
    double dINT1dZ, dINT2dZ, dINT3dZ;
    double dINT2dA, dINT3dA;
    
    double dSVYdZdZ, dBYdZdZ, dDYdZdZ, dKYdZdZ;
    double dTMP1dZdZ, dTMP2dZdZ;
    double dTMP2dAdZ;
    double S_INT2, dC_INT2dZ, dC_INT2dA;
    double dINT1dZdZ, dINT2dZdZ, dINT3dZdZ;
    double dINT2dAdZ, dINT3dAdZ;
    double dINT2dAdA, dINT3dAdA;
   	double IMP1, IMP2;
    double dIMP1dZ, dIMP2dZ;
    double TMP1_SQ, dTMP1_SQdZ;
            
    ALPHAY          = ALPHA + PH2*FZ + PH1;
    SVY             = PV2*FZ*FZ + PV1*FZ;
    DY              = PD2*FZ*FZ + PD1*FZ;
    SIGN_ALPHAY     = ALPHAY/fabs(ALPHAY);
    EY              = (PE2*FZ + PE1)*(1 - PE3*SIGN_ALPHAY);
    KY              = PK1*sin(2*atan(PK2*FZ));
    TMP1            = PD2*PC1*FZ*FZ + PD1*PC1*FZ;
    SIGN_TMP1       = TMP1/fabs(TMP1);
    TMP1            = TMP1 + SIGN_TMP1*0.001;
    BY              = KY/TMP1;
    TMP2            = BY*ALPHAY;
    FY0             = DY*sin(PC1*atan(TMP2 - EY*(TMP2 - atan(TMP2)))) + SVY;

    dALPHAYdZ       = PH2;
    dALPHAYdA       = 1;
    dSVYdZ          = 2*PV2*FZ  + PV1;
    dDYdZ           = 2*PD2*FZ  + PD1;
    dEYdZ           = PE2*(1 - PE3*SIGN_ALPHAY);
    INT1            = 2*atan(PK2*FZ);
    dINT1dZ         = 2*PK2/(1 + PK2*PK2*FZ*FZ);
    dKYdZ           = PK1*dINT1dZ*cos(INT1);
    dTMP1dZ         = 2*PD2*PC1*FZ + PD1*PC1;
    dBYdZ           = (dKYdZ*TMP1 - KY*dTMP1dZ)/(TMP1*TMP1);
    dTMP2dZ         = dBYdZ*ALPHAY + BY*dALPHAYdZ;
    dTMP2dA         = BY*dALPHAYdA;
    INT2            = PC1*atan(TMP2 - EY*(TMP2 - atan(TMP2)));
    dINT2dZ         = PC1*dMFdX(TMP2, dTMP2dZ, EY, dEYdZ);
    dINT2dA         = PC1*dMFdX(TMP2, dTMP2dA, EY, 0);
    INT3            = sin(INT2);
    C_INT2          = cos(INT2);
    dINT3dZ         = dINT2dZ*C_INT2;
    dINT3dA         = dINT2dA*C_INT2;
    dFY0dZ          = dDYdZ*INT3 + DY*dINT3dZ + dSVYdZ;
    dFY0dA      	= DY*dINT3dA;

    dSVYdZdZ        = 2*PV2;
    dDYdZdZ         = 2*PD2;
    IMP1            = 1 + PK2*PK2*FZ*FZ;
    dIMP1dZ         = 2*PK2*PK2*FZ;
    dINT1dZdZ       = - 2*PK2*dIMP1dZ/(IMP1*IMP1);
    dKYdZdZ         = PK1*dINT1dZdZ*cos(INT1) - PK1*dINT1dZ*dINT1dZ*sin(INT1);
    dTMP1dZdZ       = 2*PD2*PC1;
    TMP1_SQ         = TMP1*TMP1;
    dTMP1_SQdZ      = 2*dTMP1dZ*TMP1;
    IMP2            = dKYdZ*TMP1 - KY*dTMP1dZ;
    dIMP2dZ         = dKYdZdZ*TMP1 - KY*dTMP1dZdZ;
    dBYdZdZ         = (dIMP2dZ*TMP1_SQ - IMP2*dTMP1_SQdZ)/(TMP1_SQ*TMP1_SQ);
    dTMP2dZdZ       = dBYdZdZ*ALPHAY + 2*dBYdZ*dALPHAYdZ;
    dTMP2dAdZ      	= dBYdZ*dALPHAYdA;
    dINT2dZdZ       = PC1*dMFdXdY(TMP2, dTMP2dZ, dTMP2dZ, dTMP2dZdZ, EY, dEYdZ, dEYdZ, 0);
    dINT2dAdZ       = PC1*dMFdXdY(TMP2, dTMP2dA, dTMP2dZ, dTMP2dAdZ, EY, 0,     dEYdZ, 0);
    dINT2dAdA       = PC1*dMFdXdY(TMP2, dTMP2dA, dTMP2dA, 0,         EY, 0,     0,     0);
    S_INT2          = INT3;
    dC_INT2dZ       = - dINT2dZ*S_INT2;
    dC_INT2dA       = - dINT2dA*S_INT2;
    dINT3dZdZ       = dINT2dZdZ*C_INT2 + dINT2dZ*dC_INT2dZ;
    dINT3dAdZ       = dINT2dAdZ*C_INT2 + dINT2dA*dC_INT2dZ;
    dINT3dAdA       = dINT2dAdA*C_INT2 + dINT2dA*dC_INT2dA;
    dFY0dZdZ        = dDYdZdZ*INT3 + 2*dDYdZ*dINT3dZ + DY*dINT3dZdZ + dSVYdZdZ;
    dFY0dAdZ        = dDYdZ*dINT3dA + DY*dINT3dAdZ;
    dFY0dAdA        = DY*dINT3dAdA;
    
    return;
}