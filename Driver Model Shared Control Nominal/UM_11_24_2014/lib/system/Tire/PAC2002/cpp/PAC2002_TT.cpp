#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

// Data
#include "DATA_PAC2002.cpp"

#define pi          3.1415926

// Input Arguments
#define	IN_FZ       prhs[0]
#define	IN_KAPPA	prhs[1]
#define	IN_ALPHA	prhs[2]

// Output Arguments
#define OUT_FX      plhs[0]
#define	OUT_FY   	plhs[1]

// Functions
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

// Tire Model
static void PAC2002_TT(
            double FX[],
            double FY[],
            double N,
            double FZ[],
            double KAPPA[],
            double ALPHA[]
		   )
{
    // Number of data points
    int n;
    
    double epsilon = 0.001;
    double DFZ;
    
    // PAC2002_FX0
    double KAPPAX;
    double SHX, SVX, BX, CX, DX, EX, KX, MUX;
    double TMPX1, TMPX2;
    double FX0;
    
    // PAC2002_FY0
    double ALPHAY;
    double SHY, SVY, BY, CY, DY, EY, KY0, KY, MUY;
    double TMPY1, TMPY2;
    double FY0;
    
    // PAC2002_FX
    double ALPHAS;
    double BXA, CXA, EXA, SHXA, GX;
    double TMPX3, TMPX4; 

    // PAC2002_FY
    double KAPPAS;
    double BYK, CYK, EYK, SHYK, GY, DVYK, SVYK;
    double TMPY3, TMPY4;
    
    double FX0_0, FY0_0, FX_0, FY_0;
    
    for (n=0; n < N; n++) {
        DFZ     = FZ[n]/FZ0 - 1;
        
        // PAC2002_FX0
        SHX     = PHX1 + PHX2*DFZ;
        SVX     = FZ[n]*(PVX1 + PVX2*DFZ);
        KAPPAX  = KAPPA[n] + SHX;
        CX      = PCX1;
        MUX     = PDX1 + PDX2*DFZ;
        DX      = MUX*FZ[n];
        EX      = (PEX1 + PEX2*DFZ + PEX3*DFZ*DFZ)*(1 - PEX4*KAPPAX/fabs(KAPPAX));
        KX      = FZ[n]*(PKX1 + PKX2*DFZ)*exp(PKX3*DFZ);
        TMPX1   = PCX1*MUX*FZ[n];
        TMPX1   = TMPX1 + TMPX1*epsilon/fabs(TMPX1); // modify denominator
        BX      = KX/TMPX1;
        TMPX2 	= BX*KAPPAX;
        FX0     = DX*sin(CX*atan(TMPX2 - EX*(TMPX2 - atan(TMPX2)))) + SVX;
        
        // PAC2002_FY0
        SHY     = PHY1 + PHY2*DFZ;
        SVY     = FZ[n]*(PVY1 + PVY2*DFZ);
        ALPHAY  = ALPHA[n] + SHY;
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
        
        // PAC2002_FX
        BXA     = RBX1*cos(atan(RBX2*KAPPA[n]));
        CXA     = RCX1;
        EXA     = REX1 + REX2*DFZ;
        SHXA    = RHX1;
        ALPHAS  = ALPHA[n] + SHXA;
        TMPX3   = cos(CXA*atan(BXA*ALPHAS - EXA*(BXA*ALPHAS - atan(BXA*ALPHAS))));
        TMPX4   = cos(CXA*atan(BXA*SHXA - EXA*(BXA*SHXA - atan(BXA*SHXA))));
        GX      = TMPX3/TMPX4;
        FX[n]   = GX*FX0;
            
        // PAC2002_FY
        BYK     = RBY1*cos(atan(RBY2*(ALPHA[n] - RBY3)));
        CYK     = RCY1;
        EYK     = REY1 + REY2*DFZ;
        SHYK    = RHY1 + RHY2*DFZ;
        KAPPAS  = KAPPA[n] + SHYK;
        TMPY3   = cos(CYK*atan(BYK*KAPPAS - EYK*(BYK*KAPPAS - atan(BYK*KAPPAS))));
        TMPY4   = cos(CYK*atan(BYK*SHYK - EYK*(BYK*SHYK - atan(BYK*SHYK))));
        GY      = TMPY3/TMPY4;
        DVYK    = MUY*FZ[n]*(RVY1 + RVY2*DFZ)*cos(atan(RVY4*ALPHA[n]));
        SVYK    = DVYK*sin(RVY5*atan(RVY6*KAPPA[n]));
        FY[n]   = GY*FY0 + SVYK;
        
        // KAPP = 0 && ALPHA = 0
        // PAC2002_FX0
        SHX     = PHX1 + PHX2*DFZ;
        SVX     = FZ[n]*(PVX1 + PVX2*DFZ);
        KAPPAX  = SHX;
        CX      = PCX1;
        MUX     = PDX1 + PDX2*DFZ;
        DX      = MUX*FZ[n];
        EX      = (PEX1 + PEX2*DFZ + PEX3*DFZ*DFZ)*(1 - PEX4*KAPPAX/fabs(KAPPAX));
        KX      = FZ[n]*(PKX1 + PKX2*DFZ)*exp(PKX3*DFZ);
        TMPX1   = PCX1*MUX*FZ[n];
        TMPX1   = TMPX1 + TMPX1*epsilon/fabs(TMPX1); // modify denominator
        BX      = KX/TMPX1;
        TMPX2 	= BX*KAPPAX;
        FX0_0   = DX*sin(CX*atan(TMPX2 - EX*(TMPX2 - atan(TMPX2)))) + SVX;
        
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
        
        // PAC2002_FX
        BXA     = RBX1;
        CXA     = RCX1;
        EXA     = REX1 + REX2*DFZ;
        SHXA    = RHX1;
        ALPHAS  = SHXA;
        TMPX3   = cos(CXA*atan(BXA*ALPHAS - EXA*(BXA*ALPHAS - atan(BXA*ALPHAS))));
        TMPX4   = cos(CXA*atan(BXA*SHXA - EXA*(BXA*SHXA - atan(BXA*SHXA))));
        GX      = TMPX3/TMPX4;
        FX_0    = GX*FX0_0;
            
        // PAC2002_FY
        BYK     = RBY1*cos(atan(RBY2*(- RBY3)));
        CYK     = RCY1;
        EYK     = REY1 + REY2*DFZ;
        SHYK    = RHY1 + RHY2*DFZ;
        KAPPAS  = SHYK;
        TMPY3   = cos(CYK*atan(BYK*KAPPAS - EYK*(BYK*KAPPAS - atan(BYK*KAPPAS))));
        TMPY4   = cos(CYK*atan(BYK*SHYK - EYK*(BYK*SHYK - atan(BYK*SHYK))));
        GY      = TMPY3/TMPY4;
        DVYK    = MUY*FZ[n]*(RVY1 + RVY2*DFZ);
        SVYK    = 0;
        FY_0    = GY*FY0_0 + SVYK;
        
        FX[n]   = FX[n] - FX_0;
        FY[n]   = FY[n] - FY_0;
    }
    return;
}

void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *FX, *FY;
    double *FZ, *KAPPA, *ALPHA;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 3) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Three input arguments required."); 
    } else if (nlhs > 2) {
	    mexErrMsgIdAndTxt( "MATLAB:yprime:maxlhs",
                "Too many output arguments."); 
    } 
    
    // Dimensions
    m = mxGetM(IN_FZ); 
    n = mxGetN(IN_FZ);
    N = MAX(m, n);

    // Create a matrix for the return argument
    OUT_FX  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_FY  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    
    // Assign pointers to the various parameters
    FX      = mxGetPr(OUT_FX);
    FY      = mxGetPr(OUT_FY);
    
    FZ      = mxGetPr(IN_FZ); 
    KAPPA   = mxGetPr(IN_KAPPA);
    ALPHA   = mxGetPr(IN_ALPHA);
    
    // Do the actual computations in a subroutine
    PAC2002_TT(FX, FY, N, FZ, KAPPA, ALPHA); 
    
    return;
}
