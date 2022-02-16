#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

// Data
#include "DATA_PAC2002_FY_M.cpp"

// Input Arguments
#define	IN_FZ       prhs[0]
#define	IN_ALPHA	prhs[1]

// Output Arguments
#define	OUT_FY0      plhs[0]

// Functions
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif

// Tire Model
static void FCN_PAC2002_FY0(
		   double	FY0[],
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
    int n;
    
    // Pure slip: FY0
    double ALPHAY, SVY, BY, DY, EY, KY, TMP1, TMP2;
    double SIGN_ALPHAY, SIGN_TMP1;

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
        FY0[n]  = DY*sin(PC1*atan(TMP2 - EY*(TMP2 - atan(TMP2)))) + SVY;
    }
    return;
}

void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *FY0; 
    double *FZ, *ALPHA;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 2) { 
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
    OUT_FY0 = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    
    // Assign pointers to the various parameters
    FY0     = mxGetPr(OUT_FY0);
    
    FZ      = mxGetPr(IN_FZ); 
    ALPHA   = mxGetPr(IN_ALPHA);
        
    // Do the actual computations in a subroutine
    FCN_PAC2002_FY0(FY0, N, FZ, ALPHA); 
    return;
    
}
