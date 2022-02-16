#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

// Data
#include "DATA_PAC2002_FY_M.cpp"

// Input Arguments
#define	IN_FZ               prhs[0]
#define	IN_ALPHA            prhs[1]

// Output Arguments
#define	OUT_FY0             plhs[0]
#define	OUT_dFY0dZ          plhs[1]
#define	OUT_dFY0dA          plhs[2]

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

static void GRD_PAC2002_FY0(
           double   FY0[],
		   double	dFY0dZ[],
           double	dFY0dA[],
		   double	N,
           double	FZ[],
 		   double	ALPHA[]
		   )
{
    // Modified tire parameters
    /*
    double PC1, PD1, PD2, PE1, PE2, PE3;
    double PK1, PK2, PH1, PH2, PV1, PV2;
    
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
        FY0[n]          = DY*sin(PC1*atan(TMP2 - EY*(TMP2 - atan(TMP2)))) + SVY;
        
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
        dFY0dZ[n]     	= dDYdZ*INT3 + DY*dINT3dZ + dSVYdZ;
        dFY0dA[n]      	= DY*dINT3dA;
    }
    return;
}

void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *FY0, *dFY0dZ, *dFY0dA;
    double *FZ,*ALPHA;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 2) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Two input arguments required."); 
    } else if (nlhs > 3) {
	    mexErrMsgIdAndTxt( "MATLAB:yprime:maxlhs",
                "Too many output arguments."); 
    } 
    
    // Dimensions
    m = mxGetM(IN_FZ); 
    n = mxGetN(IN_FZ);
    N = MAX(m, n);
    
    // Create a matrix for the return argument
    OUT_FY0 	= mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_dFY0dZ 	= mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_dFY0dA  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    
    // Assign pointers to the various parameters
    FY0         = mxGetPr(OUT_FY0);
    dFY0dZ      = mxGetPr(OUT_dFY0dZ);
    dFY0dA      = mxGetPr(OUT_dFY0dA);
    
    FZ          = mxGetPr(IN_FZ); 
    ALPHA       = mxGetPr(IN_ALPHA);
        
    // Do the actual computations in a subroutine
    GRD_PAC2002_FY0(FY0, dFY0dZ, dFY0dA, N, FZ, ALPHA); 
    
    return;
}