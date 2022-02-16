#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

// Data
#include "DATA_PAC2002_FY_M.cpp"

// Input Arguments
#define	IN_FZ               prhs[0]
#define	IN_KAPPA            prhs[1]
#define	IN_ALPHA            prhs[2]

// Output Arguments
#define	OUT_FY              plhs[0]
#define	OUT_dFYdZ           plhs[1]
#define	OUT_dFYdK           plhs[2]
#define	OUT_dFYdA           plhs[3]

// Functions
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif

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

static void GRD_PAC2002_FY(
           double   FY[],
		   double	dFYdZ[],
           double	dFYdK[],
           double	dFYdA[],
		   double	N,
           double	FZ[],
           double	KAPPA[],
 		   double	ALPHA[]
		   )
{
    // Modified tire parameters
    /*
    double PC1, PD1, PD2, PE1, PE2, PE3;
    double PK1, PK2, PH1, PH2, PV1, PV2;
    double RB1, RB2, RB3, RC1, RE1, RE2;
    double RH1, RH2, RV1, RV2, RV4, RV5, RV6;
    
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
    */
    
    // Number of data points
    long long n;
    
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
    
    double FY0, dFY0dZ, dFY0dA;
    
    double BYK, EYK, SHYK, GY, DVYK, SVYK;
    double KAPPAS;
    double TMP3, TMP4, TMP5, TMP6;
    
    double dTMP3dZ, dTMP4dZ, dTMP5dZ, dTMP6dZ;
    double dTMP3dK, dTMP4dK;
    double dTMP3dA, dTMP4dA, dTMP5dA, dTMP6dA;
    double TMP6SQ;
    double INT4, INT5, INT6, INT7, INT8, INT9, INT10, INT11;
    double S_INT5, S_INT6;
    double dINT5dZ, dINT6dZ, dINT7dZ;
    double dINT5dK, dINT10dK, dINT11dK;
    double dINT4dA, dINT5dA, dINT6dA, dINT8dA, dINT9dA;
    double dEYKdZ, dSHYKdZ, dKAPPASdZ, dGYdZ, dDVYKdZ, dSVYKdZ;
    double dKAPPASdK, dGYdK, dSVYKdK;
    double dBYKdA, dGYdA, dDVYKdA, dSVYKdA;
       
    for (n=0; n < N; n++) {
        ALPHAY          = ALPHA[n] + PH2*FZ[n] + PH1;
        SVY             = PV2*FZ[n]*FZ[n] + PV1*FZ[n];
        DY              = PD2*FZ[n]*FZ[n] + PD1*FZ[n];
        SIGN_ALPHAY     = ALPHAY/fabs(ALPHAY);
        EY              = (PE2*FZ[n] + PE1)*(1 - PE3*SIGN_ALPHAY);
        KY              = PK1*sin(2*atan(PK2*FZ[n]));
        TMP1            = PD2*PC1*FZ[n]*FZ[n] + PD1*PC1*FZ[n];
        SIGN_TMP1       = TMP1/fabs(TMP1);
        TMP1            = TMP1 + SIGN_TMP1*0.001;
        BY              = KY/TMP1;
        TMP2            = BY*ALPHAY;
        FY0             = DY*sin(PC1*atan(TMP2 - EY*(TMP2 - atan(TMP2)))) + SVY;
        
        dALPHAYdZ       = PH2;
        dALPHAYdA       = 1;
        dSVYdZ          = 2*PV2*FZ[n]  + PV1;
        dDYdZ           = 2*PD2*FZ[n]  + PD1;
        dEYdZ           = PE2*(1 - PE3*SIGN_ALPHAY);
        INT1            = 2*atan(PK2*FZ[n]);
        dINT1dZ         = 2*PK2/(1 + PK2*PK2*FZ[n]*FZ[n]);
        dKYdZ           = PK1*dINT1dZ*cos(INT1);
        dTMP1dZ         = 2*PD2*PC1*FZ[n] + PD1*PC1;
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
        
        BYK             = RB1*cos(atan(RB2*(ALPHA[n] - RB3)));
        EYK             = RE2*FZ[n] + RE1;
        SHYK            = RH2*FZ[n] + RH1;
        KAPPAS          = KAPPA[n] + SHYK;
        TMP3            = BYK*KAPPAS;
        TMP4            = cos(RC1*atan(TMP3 - EYK*(TMP3 - atan(TMP3))));
        TMP5            = BYK*SHYK;
        TMP6            = cos(RC1*atan(TMP5 - EYK*(TMP5 - atan(TMP5))));
        GY              = TMP4/TMP6;
        DVYK            = DY*(RV2*FZ[n] + RV1)*cos(atan(RV4*ALPHA[n]));
        SVYK            = DVYK*sin(RV5*atan(RV6*KAPPA[n]));
        FY[n]           = GY*FY0 + SVYK;
        
        INT4            = atan(RB2*(ALPHA[n] - RB3));
        dINT4dA         = RB2/(1 + (RB2*(ALPHA[n] - RB3))*(RB2*(ALPHA[n] - RB3)));
        dBYKdA          = - RB1*dINT4dA*sin(INT4);
        dEYKdZ          = RE2;
        dSHYKdZ         = RH2;
        dKAPPASdZ       = dSHYKdZ;
        dKAPPASdK       = 1;
        dTMP3dZ         = BYK*dKAPPASdZ;
        dTMP3dK         = BYK*dKAPPASdK;
        dTMP3dA         = dBYKdA*KAPPAS;
        INT5            = RC1*atan(TMP3 - EYK*(TMP3 - atan(TMP3)));
        dINT5dZ         = RC1*dMFdX(TMP3, dTMP3dZ, EYK, dEYKdZ);
        dINT5dK         = RC1*dMFdX(TMP3, dTMP3dK, EYK, 0);
        dINT5dA         = RC1*dMFdX(TMP3, dTMP3dA, EYK, 0);
        S_INT5          = sin(INT5);
        dTMP4dZ         = - dINT5dZ*S_INT5;
        dTMP4dK         = - dINT5dK*S_INT5;
        dTMP4dA         = - dINT5dA*S_INT5;
        dTMP5dZ         = BYK*dSHYKdZ;
        dTMP5dA         = dBYKdA*SHYK;
        INT6            = RC1*atan(TMP5 - EYK*(TMP5 - atan(TMP5)));
        dINT6dZ         = RC1*dMFdX(TMP5, dTMP5dZ, EYK, dEYKdZ);
        dINT6dA         = RC1*dMFdX(TMP5, dTMP5dA, EYK, 0);
        S_INT6          = sin(INT6);
        dTMP6dZ         = - dINT6dZ*S_INT6;
        dTMP6dA         = - dINT6dA*S_INT6;
        TMP6SQ          = TMP6*TMP6;
        dGYdZ           = (dTMP4dZ*TMP6 - TMP4*dTMP6dZ)/TMP6SQ;
        dGYdK           =  dTMP4dK/TMP6;
        dGYdA           = (dTMP4dA*TMP6 - TMP4*dTMP6dA)/TMP6SQ;
        INT7            = DY*(RV2*FZ[n] + RV1);
        dINT7dZ         = dDYdZ*(RV2*FZ[n] + RV1) + DY*RV2;
        INT8            = atan(RV4*ALPHA[n]);
        dINT8dA         = RV4/(1 + (RV4*ALPHA[n])*(RV4*ALPHA[n]));
        INT9            = cos(INT8);
        dINT9dA         = - dINT8dA*sin(INT8);
        dDVYKdZ         = dINT7dZ*INT9;
        dDVYKdA         = INT7*dINT9dA;
        INT10           = RV5*atan(RV6*KAPPA[n]);
        dINT10dK        = RV5*RV6/(1 + (RV6*KAPPA[n])*(RV6*KAPPA[n]));
        INT11           = sin(INT10);
        dINT11dK        = dINT10dK*cos(INT10);
        dSVYKdZ         = dDVYKdZ*INT11;
        dSVYKdK         = DVYK*dINT11dK;
        dSVYKdA         = dDVYKdA*INT11;
        dFYdZ[n]       	= dGYdZ*FY0 + GY*dFY0dZ + dSVYKdZ;
        dFYdK[n]       	= dGYdK*FY0 + dSVYKdK;
        dFYdA[n]       	= dGYdA*FY0 + GY*dFY0dA + dSVYKdA;
    }
    return;
}

void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *FY, *dFYdZ, *dFYdK, *dFYdA;
    double *FZ, *KAPPA, *ALPHA;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 3) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Two input arguments required."); 
    } else if (nlhs > 4) {
	    mexErrMsgIdAndTxt( "MATLAB:yprime:maxlhs",
                "Too many output arguments."); 
    } 
    
    // Dimensions
    m = mxGetM(IN_FZ); 
    n = mxGetN(IN_FZ);
    N = MAX(m, n);
    
    // Create a matrix for the return argument
    OUT_FY      = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_dFYdZ 	= mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_dFYdK   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_dFYdA   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    
    // Assign pointers to the various parameters
    FY          = mxGetPr(OUT_FY);
    dFYdZ       = mxGetPr(OUT_dFYdZ);
    dFYdK       = mxGetPr(OUT_dFYdK);
    dFYdA       = mxGetPr(OUT_dFYdA);
    
    FZ          = mxGetPr(IN_FZ); 
    KAPPA       = mxGetPr(IN_KAPPA);
    ALPHA       = mxGetPr(IN_ALPHA);
        
    // Do the actual computations in a subroutine
    GRD_PAC2002_FY(FY, dFYdZ, dFYdK, dFYdA, N, FZ, KAPPA, ALPHA); 
    
    return;
}