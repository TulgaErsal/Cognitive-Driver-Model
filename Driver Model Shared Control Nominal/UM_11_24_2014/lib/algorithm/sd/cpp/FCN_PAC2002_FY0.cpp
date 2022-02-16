#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;

// Data
#include "DATA_PAC2002_FY_M.cpp"

// Tire Model
double FCN_PAC2002_FY0(
           double	FZ,
 		   double	ALPHA
		   )
{
    // Pure slip: FY0
    double FY0;
    double ALPHAY, SVY, BY, DY, EY, KY, TMP1, TMP2;
    double SIGN_ALPHAY, SIGN_TMP1;

    ALPHAY  = ALPHA + PH2*FZ + PH1;
    SVY     = PV2*FZ*FZ + PV1*FZ;
    DY      = PD2*FZ*FZ + PD1*FZ;
    SIGN_ALPHAY = ALPHAY/fabs(ALPHAY);
    EY      = (PE2*FZ + PE1)*(1 - PE3*SIGN_ALPHAY);
    KY      = PK1*sin(2*atan(PK2*FZ));
    TMP1    = PD2*PC1*FZ*FZ + PD1*PC1*FZ;
    SIGN_TMP1 = TMP1/fabs(TMP1);
    TMP1    = TMP1 + SIGN_TMP1*0.001;
    BY      = KY/TMP1;
    TMP2    = BY*ALPHAY;
    FY0     = DY*sin(PC1*atan(TMP2 - EY*(TMP2 - atan(TMP2)))) + SVY;

    return FY0;
}