#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

//Data
#include "DATA_HMMWV_2DOF.cpp"
#include "FCN_PAC2002_FY0.cpp"

// Input Arguments
#define	IN_V        prhs[0]
#define	IN_R        prhs[1]
#define	IN_PSI      prhs[2]
#define	IN_SA       prhs[3]
#define	IN_SR       prhs[4]
#define IN_U0       prhs[5]

// Output Arguments
#define	OUT_Xdot	plhs[0]
#define	OUT_Ydot	plhs[1]
#define	OUT_Vdot	plhs[2]
#define	OUT_Rdot	plhs[3]
#define	OUT_Ddot	plhs[4]
#define	OUT_Pdot	plhs[5]

// Function
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif

// Vehicle Model
static void OCP_FCN_CONT_DYNAMICS_2DOFNL(
            double	Xdot[],
            double	Ydot[],
            double	Vdot[],
            double	Rdot[],
            double	Ddot[],
            double	Pdot[],
            double	N,
            double	V[],
            double	R[],
            double	PSI[],
            double	SA[],
            double	SR[],
            double  U0
		   )
{
    long long n;
    double ALPHAF, ALPHAR;
    double FZF, FZR;
    double FYF, FYR;    
    
    for (n=0; n < N; n++) {
        ALPHAF  = atan2(V[n] + LA*R[n], U0) - SA[n];
        ALPHAR  = atan2(V[n] - LB*R[n], U0); 
        
        FZF     = FZF0 - dF*( - V[n]*R[n]);
        FZR     = FZR0 + dF*( - V[n]*R[n]);
        
        FYF     = FCN_PAC2002_FY0(FZF, ALPHAF);
        FYR     = FCN_PAC2002_FY0(FZR, ALPHAR);
        
        Xdot[n] = U0*cos(PSI[n]) - (V[n] + LA*R[n])*sin(PSI[n]);
        Ydot[n] = U0*sin(PSI[n]) + (V[n] + LA*R[n])*cos(PSI[n]);
        Vdot[n] = (FYF + FYR)/M - R[n]*U0;
        Rdot[n] = (LA*FYF - LB*FYR)/IZZ;
        Ddot[n] = SR[n];
        Pdot[n] = R[n];
    }
    
    return;
}

void
mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
     
{ 
    double *Xdot, *Ydot, *Vdot, *Rdot, *Ddot, *Pdot; 
    double *V, *R, *PSI, *SA, *SR;
    double U0;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 6) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Six input arguments required."); 
    } else if (nlhs > 6) {
	    mexErrMsgIdAndTxt( "MATLAB:yprime:maxlhs",
                "Too many output arguments."); 
    } 
    
    // Dimensions
    m = mxGetM(IN_V); 
    n = mxGetN(IN_V);
    N = MAX(m, n);
    
    // Create a matrix for the return argument
    OUT_Xdot    = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_Ydot    = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_Vdot    = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_Rdot    = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_Ddot    = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    OUT_Pdot    = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL); 
    
    // Assign pointers to the various parameters
    Xdot        = mxGetPr(OUT_Xdot);
    Ydot        = mxGetPr(OUT_Ydot);
    Vdot        = mxGetPr(OUT_Vdot);
    Rdot        = mxGetPr(OUT_Rdot);
    Ddot        = mxGetPr(OUT_Ddot);
    Pdot        = mxGetPr(OUT_Pdot);
    
    V           = mxGetPr(IN_V); 
    R           = mxGetPr(IN_R);
    PSI         = mxGetPr(IN_PSI); 
    SA          = mxGetPr(IN_SA); 
    SR          = mxGetPr(IN_SR); 
    U0          = mxGetScalar(IN_U0);
        
    // Do the actual computations in a subroutine
    OCP_FCN_CONT_DYNAMICS_2DOFNL(Xdot, Ydot, Vdot, Rdot, Ddot, Pdot, N, V, R, PSI, SA, SR, U0); 
    return;
    
}