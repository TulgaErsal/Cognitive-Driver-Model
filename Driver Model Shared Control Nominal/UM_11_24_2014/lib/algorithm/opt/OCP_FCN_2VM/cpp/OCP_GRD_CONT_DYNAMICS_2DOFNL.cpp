#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

//Data
#include "DATA_HMMWV_2DOF.cpp"
#include "GRD_PAC2002_FY0.cpp"

// Input Arguments
#define	IN_V        prhs[0]
#define	IN_R        prhs[1]
#define	IN_PSI      prhs[2]
#define	IN_SA       prhs[3]
#define IN_U0       prhs[4]

// Output Arguments
#define	OUT_dot01	plhs[0]
#define	OUT_dot02	plhs[1]
#define	OUT_dot03	plhs[2]
#define	OUT_dot04	plhs[3]
#define	OUT_dot05	plhs[4]
#define	OUT_dot06	plhs[5]
#define	OUT_dot07	plhs[6]
#define	OUT_dot08	plhs[7]
#define	OUT_dot09	plhs[8]
#define	OUT_dot10	plhs[9]
#define	OUT_dot11	plhs[10]
#define	OUT_dot12	plhs[11]
#define	OUT_dot13	plhs[12]
#define	OUT_dot14	plhs[13]

// Function
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif

// Vehicle Model
static void OCP_GRD_CONT_DYNAMICS_2DOFNL(
        double dot01[],
        double dot02[], 
        double dot03[], 
        double dot04[], 
        double dot05[], 
        double dot06[], 
        double dot07[], 
        double dot08[], 
        double dot09[], 
        double dot10[], 
        double dot11[], 
        double dot12[], 
        double dot13[], 
        double dot14[], 
        double N,
        double V[],
        double R[],
        double PSI[],
        double SA[],
        double U0
        )
{
    long long n;
    
    double ALPHAF, ALPHAR;
    double FZF, FZR;
    double FYF, FYR;
    double dFYFdFZ, dFYRdFZ;
    double dFYFdALPHA, dFYRdALPHA;
    double PARAF, PARAR;
    double dFZFdV, dFZFdR;
    double dALPHAFdV, dALPHAFdR, dALPHAFdD;
    double dFYFdV, dFYFdR, dFYFdD;
    double dFZRdV, dFZRdR;
    double dALPHARdV, dALPHARdR, dALPHARdD;
    double dFYRdV, dFYRdR, dFYRdD;
    
    for (n=0; n < N; n++) {
        ALPHAF  = atan2(V[n] + LA*R[n], U0) - SA[n];
        ALPHAR  = atan2(V[n] - LB*R[n], U0);
        
        FZF     = FZF0 - dF*( - V[n]*R[n]);
        FZR     = FZR0 + dF*( - V[n]*R[n]);
        
        GRD_PAC2002_FY0(FYF, dFYFdFZ, dFYFdALPHA, FZF, ALPHAF);
        GRD_PAC2002_FY0(FYR, dFYRdFZ, dFYRdALPHA, FZR, ALPHAR);
                
        PARAF   = (V[n] + LA*R[n])*(V[n] + LA*R[n]) + U0*U0;
        PARAR   = (V[n] - LB*R[n])*(V[n] - LB*R[n]) + U0*U0;
        
        dFZFdV  = dF*R[n];
        dFZFdR  = dF*V[n];

        dALPHAFdV = U0/PARAF;
        dALPHAFdR = (LA*U0)/PARAF;
        dALPHAFdD = - 1;

        dFYFdV	= dFYFdFZ*dFZFdV + dFYFdALPHA*dALPHAFdV;
        dFYFdR	= dFYFdFZ*dFZFdR + dFYFdALPHA*dALPHAFdR;
        dFYFdD	=                  dFYFdALPHA*dALPHAFdD;

        dFZRdV  = - dF*R[n];
        dFZRdR  = - dF*V[n];

        dALPHARdV = U0/PARAR;
        dALPHARdR = - (LB*U0)/PARAR;
        dALPHARdD = 0;

        dFYRdV	= dFYRdFZ*dFZRdV + dFYRdALPHA*dALPHARdV;
        dFYRdR	= dFYRdFZ*dFZRdR + dFYRdALPHA*dALPHARdR;
        dFYRdD	=                  dFYRdALPHA*dALPHARdD;
        
        dot01[n] = - sin(PSI[n]);
        dot02[n] =   cos(PSI[n]);
        dot03[n] = (dFYFdV + dFYRdV)/M;
        dot04[n] = (LA*dFYFdV - LB*dFYRdV)/IZZ;

        dot05[n] = - LA*sin(PSI[n]);
        dot06[n] =   LA*cos(PSI[n]);
        dot07[n] = (dFYFdR + dFYRdR)/M - U0;
        dot08[n] = (LA*dFYFdR - LB*dFYRdR)/IZZ;
        dot09[n] = 1;

        dot10[n] = (dFYFdD + dFYRdD)/M;
        dot11[n] = (LA*dFYFdD - LB*dFYRdD)/IZZ;

        dot12[n] = - U0*sin(PSI[n]) - (V[n] + LA*R[n])*cos(PSI[n]);
        dot13[n] =   U0*cos(PSI[n]) - (V[n] + LA*R[n])*sin(PSI[n]);

        dot14[n] = 1;
    }
    
    return;
}
     
void
mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
     
{
    double *dot01, *dot02, *dot03, *dot04, *dot05, *dot06, *dot07;
    double *dot08, *dot09, *dot10, *dot11, *dot12, *dot13, *dot14;
    double *V, *R, *PSI, *SA;
    double U0;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 5) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Five input arguments required."); 
    } else if (nlhs > 14) {
	    mexErrMsgIdAndTxt( "MATLAB:yprime:maxlhs",
                "Too many output arguments."); 
    } 
    
    // Dimensions
    m = mxGetM(IN_V); 
    n = mxGetN(IN_V);
    N = MAX(m, n);
    
    // Create a matrix for the return argument
    OUT_dot01   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot02   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot03   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot04   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot05   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot06   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot07   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot08   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot09   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot10   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot11   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot12   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot13   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot14   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    
    // Assign pointers to the various parameters
    dot01       = mxGetPr(OUT_dot01);
    dot02       = mxGetPr(OUT_dot02);
    dot03       = mxGetPr(OUT_dot03);
    dot04       = mxGetPr(OUT_dot04);
    dot05       = mxGetPr(OUT_dot05);
    dot06       = mxGetPr(OUT_dot06);
    dot07       = mxGetPr(OUT_dot07);
    dot08       = mxGetPr(OUT_dot08);
    dot09       = mxGetPr(OUT_dot09);
    dot10       = mxGetPr(OUT_dot10);
    dot11       = mxGetPr(OUT_dot11);
    dot12       = mxGetPr(OUT_dot12);
    dot13       = mxGetPr(OUT_dot13);
    dot14       = mxGetPr(OUT_dot14);
    
    V           = mxGetPr(IN_V); 
    R           = mxGetPr(IN_R);
    PSI         = mxGetPr(IN_PSI); 
    SA          = mxGetPr(IN_SA); 
    U0          = mxGetScalar(IN_U0); 
    
    // Do the actual computations in a subroutine
    OCP_GRD_CONT_DYNAMICS_2DOFNL(dot01, dot02, dot03, dot04, dot05, dot06, dot07, dot08, dot09, dot10, dot11, dot12, dot13, dot14, N, V, R, PSI, SA, U0);
    return;
}