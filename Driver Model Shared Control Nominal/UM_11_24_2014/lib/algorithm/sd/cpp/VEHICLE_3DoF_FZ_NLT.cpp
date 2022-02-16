#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

//Data
#include "DATA_HMMWV_3DOF.cpp"
#include "FCN_PAC2002_FY0.cpp"

// Input Arguments
#define	IN_V        prhs[0]
#define	IN_R        prhs[1]
#define	IN_SA       prhs[2]
#define	IN_PSI      prhs[3]
#define	IN_U        prhs[4]
#define	IN_SR       prhs[5]
#define	IN_AX       prhs[6]

// Output Arguments
#define	OUT_Xdot	plhs[0]

// Function
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif

// Vehicle Model
static void VEHICLE_3DoF_FZ_NLT(
            double	Xdot[],
            double	V,
            double	R,
            double	SA,
            double	PSI,
            double	U,
            double	SR,
            double	AX
		   )
{
    double ALPHAF, ALPHAR;
    double FZF, FZR;
    double FYF, FYR;    
    
    ALPHAF  = atan2(V + LA*R, U) - SA;
    ALPHAR  = atan2(V - LB*R, U); 

    FZF     = FZF0 - dF*(AX - V*R);
    FZR     = FZR0 + dF*(AX - V*R);

    FYF     = FCN_PAC2002_FY0(FZF, ALPHAF);
    FYR     = FCN_PAC2002_FY0(FZR, ALPHAR);

    Xdot[0] = U*cos(PSI) - V*sin(PSI);
    Xdot[1] = U*sin(PSI) + V*cos(PSI);
    Xdot[2] = (FYF + FYR)/M - R*U;
    Xdot[3] = (LA*FYF - LB*FYR)/IZZ;
    Xdot[4] = SR;
    Xdot[5] = R;
    Xdot[6] = AX;
    
    return;
}

void
mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
     
{ 
    double *Xdot; 
    double V, R, SA, PSI, U, SR, AX;
    
    // Check for proper number of arguments
    if (nrhs != 7) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Seven input arguments required."); 
    } else if (nlhs > 1) {
	    mexErrMsgIdAndTxt( "MATLAB:yprime:maxlhs",
                "Too many output arguments."); 
    } 
    
    // Create a matrix for the return argument
    OUT_Xdot    = mxCreateDoubleMatrix( 1, 7, mxREAL); 
    
    // Assign pointers to the various parameters
    Xdot        = mxGetPr(OUT_Xdot);
    
    V           = mxGetScalar(IN_V); 
    R           = mxGetScalar(IN_R);
    SA          = mxGetScalar(IN_SA); 
    PSI         = mxGetScalar(IN_PSI); 
    U           = mxGetScalar(IN_U); 
    SR          = mxGetScalar(IN_SR); 
    AX          = mxGetScalar(IN_AX); 
        
    // Do the actual computations in a subroutine
    VEHICLE_3DoF_FZ_NLT(Xdot, V, R, SA, PSI, U, SR, AX); 
    
    return;
    
}