#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

// Data
#include "DATA_PAC2002.cpp"

#define pi          3.1415926

// Input Arguments
#define	IN_FZ       prhs[0]
#define	IN_ALPHA	prhs[1]

// Output Arguments
#define	OUT_FY   	plhs[0]

// Functions
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

// Tire Model
static void PAC2002_ST(
            double FY[],
            double N,
            double FZ[],
            double ALPHA[]
		   )
{
    // Number of data points
    int n;
    
    double epsilon = 0.001;
    double DFZ;
    
    // PAC2002_FY0
    double ALPHAY;
    double SHY, SVY, BY, CY, DY, EY, KY0, KY, MUY;
    double TMPY1, TMPY2;
    double FY0;
    
    for (n=0; n < N; n++) {
        DFZ     = FZ[n]/FZ0 - 1;
        
        // PAC2002_FY0
        SHY     = PHY1 + PHY2*DFZ;
        SVY     = FZ[n]*(PVY1 + PVY2*DFZ);
        ALPHAY  = ALPHA[n] + SHY;
        CY      = PCY1;
        MUY     = (PDY1 + PDY2*DFZ);
        DY      = MUY*FZ[n];
        EY      = (PEY1 + PEY2*DFZ)*(1 - PEY3*ALPHAY/fabs(ALPHAY));
        KY0     = PKY1*(FZ0)*sin(2*atan(FZ[n]/(PKY2*FZ0)));
        KY      = KY0;
        TMPY1	= PCY1*MUY*FZ[n];
        TMPY1   = TMPY1 + TMPY1*epsilon/fabs(TMPY1); // modify denominator
        BY      = KY/TMPY1;
        TMPY2 	= BY*ALPHAY;
        FY[n]   = DY*sin(CY*atan(TMPY2 - EY*(TMPY2 - atan(TMPY2)))) + SVY;
        
        // PAC2002_FY0
        SHY     = PHY1 + PHY2*DFZ;
        SVY     = FZ[n]*(PVY1 + PVY2*DFZ);
        ALPHAY  = SHY;
        CY      = PCY1;
        MUY     = PDY1 + PDY2*DFZ;
        DY      = MUY*FZ[n];
        EY      = (PEY1 + PEY2*DFZ)*(1 - PEY3*ALPHAY/fabs(ALPHAY));
        KY0     = PKY1*(FZ0)*sin(2*atan(FZ[n]/(PKY2*FZ0)));
        KY      = KY0;
        TMPY1	= PCY1*MUY*FZ[n];
        TMPY1   = TMPY1 + TMPY1*epsilon/fabs(TMPY1); // modify denominator
        BY      = KY/TMPY1;
        TMPY2 	= BY*ALPHAY;
        FY0     = DY*sin(CY*atan(TMPY2 - EY*(TMPY2 - atan(TMPY2)))) + SVY;
        
        FY[n]   = FY[n] - FY0;
    }
    return;
}

void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *FY;
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
    OUT_FY  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    
    // Assign pointers to the various parameters
    FY      = mxGetPr(OUT_FY);
    
    FZ      = mxGetPr(IN_FZ); 
    ALPHA   = mxGetPr(IN_ALPHA);
    
    // Do the actual computations in a subroutine
    PAC2002_ST(FY, N, FZ, ALPHA);
    
    return;
}
