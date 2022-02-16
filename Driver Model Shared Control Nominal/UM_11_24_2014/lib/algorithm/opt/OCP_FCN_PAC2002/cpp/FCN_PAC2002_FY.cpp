#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

// Data
#include "DATA_PAC2002_FY_M.cpp"

// Input Arguments
#define	IN_FZ       prhs[0]
#define	IN_KAPPA	prhs[1]
#define	IN_ALPHA	prhs[2]

// Output Arguments
#define	OUT_FY   	plhs[0]

// Functions
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif

// Tire Model
static void FCN_PAC2002_FY(
		   double	FY[],
		   double	N,
           double	FZ[],
           double   KAPPA[],
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
    int n;
    
    // Pure slip: FY0
    double ALPHAY, SVY, BY, DY, EY, KY, TMP1, TMP2;
    double SIGN_ALPHAY, SIGN_TMP1;
    double FY0;
    double BYK, EYK, SHYK, GY, DVYK, SVYK;
    double KAPPAS;
    double TMP3, TMP4, TMP5, TMP6;
    
    for (n=0; n < N; n++) {
        ALPHAY  = ALPHA[n] + PH2*FZ[n] + PH1;
        SVY     = PV2*FZ[n]*FZ[n] + PV1*FZ[n];
        DY      = PD2*FZ[n]*FZ[n] + PD1*FZ[n];
        SIGN_ALPHAY = ALPHAY/fabs(ALPHAY);
        EY      = (PE2*FZ[n] + PE1)*(1 - PE3*SIGN_ALPHAY);
        KY      = PK1*sin(2*atan(PK2*FZ[n]));
        TMP1    = PD2*PC1*FZ[n]*FZ[n] + PD1*PC1*FZ[n];
        SIGN_TMP1 = TMP1/fabs(TMP1);
        TMP1    = TMP1 + SIGN_TMP1*0.001;
        BY      = KY/TMP1;
        TMP2    = BY*ALPHAY;
        FY0     = DY*sin(PC1*atan(TMP2 - EY*(TMP2 - atan(TMP2)))) + SVY;
        
        BYK     = RB1*cos(atan(RB2*(ALPHA[n] - RB3)));
        EYK     = RE2*FZ[n] + RE1;
        SHYK    = RH2*FZ[n] + RH1;
        KAPPAS  = KAPPA[n] + SHYK;
        TMP3    = BYK*KAPPAS;
        TMP4    = cos(RC1*atan(TMP3 - EYK*(TMP3 - atan(TMP3))));
        TMP5    = BYK*SHYK;
        TMP6    = cos(RC1*atan(TMP5 - EYK*(TMP5 - atan(TMP5))));
        GY      = TMP4/TMP6;
        DVYK    = DY*(RV2*FZ[n] + RV1)*cos(atan(RV4*ALPHA[n]));
        SVYK    = DVYK*sin(RV5*atan(RV6*KAPPA[n]));
        FY[n]  	= GY*FY0 + SVYK;
    }
    return;
}

void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *FY; 
    double *FZ, *KAPPA, *ALPHA;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 3) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Two input arguments required."); 
    } else if (nlhs > 1) {
	    mexErrMsgIdAndTxt( "MATLAB:yprime:maxlhs",
                "Too many output arguments."); 
    } 
    
    // Dimensions
    m = mxGetM(IN_FZ); 
    n = mxGetN(IN_FZ);
    N = MAX(m, n);
    
    // Create a matrix for the return argument
    OUT_FY  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    
    // Assign pointers to the various parameters
    FY      = mxGetPr(OUT_FY);
    
    FZ      = mxGetPr(IN_FZ); 
    KAPPA   = mxGetPr(IN_KAPPA);
    ALPHA   = mxGetPr(IN_ALPHA);
        
    // Do the actual computations in a subroutine
    FCN_PAC2002_FY(FY, N, FZ, KAPPA, ALPHA); 
    return;
}
