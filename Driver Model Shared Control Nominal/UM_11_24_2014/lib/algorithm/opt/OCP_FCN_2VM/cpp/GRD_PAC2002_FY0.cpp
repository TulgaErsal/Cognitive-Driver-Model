#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;

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

static void GRD_PAC2002_FY0(
           double&  FY0,
		   double&	dFY0dZ,
           double&	dFY0dA,
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
    
    return;
}