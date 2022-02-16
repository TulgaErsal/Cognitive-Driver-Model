#include <math.h>
#include <stdint.h>
typedef uint16_t char16_t;
#include <mex.h>

//Data
#include "DATA_HMMWV_2DOF.cpp"
#include "HES_PAC2002_FY0.cpp"

// Input Arguments
#define	IN_V        prhs[0]
#define	IN_R        prhs[1]
#define	IN_PSI      prhs[2]
#define	IN_SA       prhs[3]
#define	IN_U0       prhs[4]

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
#define	OUT_dot15	plhs[14]
#define	OUT_dot16	plhs[15]
#define	OUT_dot17	plhs[16]
#define	OUT_dot18	plhs[17]

// Function
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(MIN)
#define	MIN(A, B)	((A) < (B) ? (A) : (B))
#endif

// Vehicle Model
static void OCP_HES_CONT_DYNAMICS_2DOFNL(
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
        double dot15[], 
        double dot16[], 
        double dot17[], 
        double dot18[], 
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
    double dFYFdAP, dFYRdAP;
    double dFYFdFZdFZ, dFYRdFZdFZ;
    double dFYFdAPdFZ, dFYRdAPdFZ;
    double dFYFdAPdAP, dFYRdAPdAP;
    
    double PARAF, PARAR;
    double PARAFSQ, PARARSQ;
    double dPARAFdV, dPARAFdR, dPARARdV, dPARARdR;
    
    double dFZFdV, dFZFdR;
    double dFZFdVdV, dFZFdRdV, dFZFdRdR;
    double dALPHAFdV, dALPHAFdR, dALPHAFdD;
    double dALPHAFdVdV, dALPHAFdRdV, dALPHAFdRdR;
    double dFYFdVdV, dFYFdRdV, dFYFdRdR, dFYFdDdV, dFYFdDdR, dFYFdDdD;
    
    double dFZRdV, dFZRdR;
    double dFZRdVdV, dFZRdRdV, dFZRdRdR;
    double dALPHARdV, dALPHARdR, dALPHARdD;
    double dALPHARdVdV, dALPHARdRdV, dALPHARdRdR;
    double dFYRdVdV, dFYRdRdV, dFYRdRdR, dFYRdDdV, dFYRdDdR, dFYRdDdD;
    
    for (n=0; n < N; n++) {
        ALPHAF  = atan2(V[n] + LA*R[n], U0) - SA[n];
        ALPHAR  = atan2(V[n] - LB*R[n], U0);
        
        FZF     = FZF0 - dF*( - V[n]*R[n]);
        FZR     = FZR0 + dF*( - V[n]*R[n]);
        
        HES_PAC2002_FY0(FYF, dFYFdFZ, dFYFdAP, dFYFdFZdFZ, dFYFdAPdFZ, dFYFdAPdAP, FZF, ALPHAF);
        HES_PAC2002_FY0(FYR, dFYRdFZ, dFYRdAP, dFYRdFZdFZ, dFYRdAPdFZ, dFYRdAPdAP, FZR, ALPHAR);
        
        PARAF   = (V[n] + LA*R[n])*(V[n] + LA*R[n]) + U0*U0;
        PARAR   = (V[n] - LB*R[n])*(V[n] - LB*R[n]) + U0*U0;
        
        PARAFSQ     = PARAF*PARAF;
        dPARAFdV   	= 2*(V[n] + LA*R[n]);
        dPARAFdR   	= 2*LA*(V[n] + LA*R[n]);
        
        PARARSQ     = PARAR*PARAR;
        dPARARdV   	= 2*(V[n] - LB*R[n]);
        dPARARdR   	= - 2*LB*(V[n] - LB*R[n]);
        
        dFZFdV	= dF*R[n];
        dFZFdR  = dF*V[n];
        
        dFZFdVdV    = 0;
        dFZFdRdV    = dF;
        dFZFdRdR    = 0;
        
        dFZRdV	= - dF*R[n];
        dFZRdR  = - dF*V[n];
        
        dFZRdVdV    = 0;
        dFZRdRdV    = - dF;
        dFZRdRdR    = 0;
        
        dALPHAFdV = U0/PARAF;
        dALPHAFdR = (LA*U0)/PARAF;
        dALPHAFdD = - 1;

        dALPHAFdVdV = U0*( - dPARAFdV)/PARAFSQ;
        dALPHAFdRdV = LA*U0*( - dPARAFdV)/PARAFSQ;
        dALPHAFdRdR = LA*U0*( - dPARAFdR)/PARAFSQ;
        
        dALPHARdV = U0/PARAR;
        dALPHARdR = - (LB*U0)/PARAR;
        dALPHARdD = 0;
        
        dALPHARdVdV = U0*( - dPARARdV)/PARARSQ;
        dALPHARdRdV = - LB*U0*( - dPARARdV)/PARARSQ;
        dALPHARdRdR = - LB*U0*( - dPARARdR)/PARARSQ;
        
        dFYFdVdV = dFYFdAP*dALPHAFdVdV + dFYFdAPdAP*dALPHAFdV*dALPHAFdV + dFYFdFZ*dFZFdVdV + dFYFdFZdFZ*dFZFdV*dFZFdV + 2*dFYFdAPdFZ*dALPHAFdV*dFZFdV;
        dFYFdRdV = dFYFdAP*dALPHAFdRdV + dFYFdAPdAP*dALPHAFdR*dALPHAFdV + dFYFdFZ*dFZFdRdV + dFYFdFZdFZ*dFZFdR*dFZFdV +   dFYFdAPdFZ*dALPHAFdV*dFZFdR + dFYFdAPdFZ*dALPHAFdR*dFZFdV;
        dFYFdRdR = dFYFdAP*dALPHAFdRdR + dFYFdAPdAP*dALPHAFdR*dALPHAFdR + dFYFdFZ*dFZFdRdR + dFYFdFZdFZ*dFZFdR*dFZFdR + 2*dFYFdAPdFZ*dALPHAFdR*dFZFdR;
        dFYFdDdV =                       dFYFdAPdAP*dALPHAFdD*dALPHAFdV                                               +   dFYFdAPdFZ*dALPHAFdD*dFZFdV;
        dFYFdDdR =                       dFYFdAPdAP*dALPHAFdD*dALPHAFdR                                               +   dFYFdAPdFZ*dALPHAFdD*dFZFdR;
        dFYFdDdD =                       dFYFdAPdAP*dALPHAFdD*dALPHAFdD;

        dFYRdVdV = dFYRdAP*dALPHARdVdV + dFYRdAPdAP*dALPHARdV*dALPHARdV + dFYRdFZ*dFZRdVdV + dFYRdFZdFZ*dFZRdV*dFZRdV + 2*dFYRdAPdFZ*dALPHARdV*dFZRdV;
        dFYRdRdV = dFYRdAP*dALPHARdRdV + dFYRdAPdAP*dALPHARdR*dALPHARdV + dFYRdFZ*dFZRdRdV + dFYRdFZdFZ*dFZRdR*dFZRdV +   dFYRdAPdFZ*dALPHARdV*dFZRdR + dFYRdAPdFZ*dALPHARdR*dFZRdV;
        dFYRdRdR = dFYRdAP*dALPHARdRdR + dFYRdAPdAP*dALPHARdR*dALPHARdR + dFYRdFZ*dFZRdRdR + dFYRdFZdFZ*dFZRdR*dFZRdR + 2*dFYRdAPdFZ*dALPHARdR*dFZRdR;
        dFYRdDdV =                       dFYRdAPdAP*dALPHARdD*dALPHARdV                                               +   dFYRdAPdFZ*dALPHARdD*dFZRdV;
        dFYRdDdR =                       dFYRdAPdAP*dALPHARdD*dALPHARdR                                               +   dFYRdAPdFZ*dALPHARdD*dFZRdR;
        dFYRdDdD =                       dFYRdAPdAP*dALPHARdD*dALPHARdD;
        
        dot01[n] = (dFYFdVdV + dFYRdVdV) / M;
        dot02[n] = (LA*dFYFdVdV - LB*dFYRdVdV)/IZZ;
        
        dot03[n] = (dFYFdRdV + dFYRdRdV) / M;
        dot04[n] = (LA*dFYFdRdV - LB*dFYRdRdV)/IZZ;

        dot05[n] = (dFYFdRdR + dFYRdRdR) / M;
        dot06[n] = (LA*dFYFdRdR - LB*dFYRdRdR)/IZZ;
        
        dot07[n] = (dFYFdDdV + dFYRdDdV) / M;
        dot08[n] = (LA*dFYFdDdV - LB*dFYRdDdV)/IZZ;
        
        dot09[n] = (dFYFdDdR + dFYRdDdR) / M;
        dot10[n] = (LA*dFYFdDdR - LB*dFYRdDdR)/IZZ;
        
        dot11[n] = (dFYFdDdD + dFYRdDdD) / M;
        dot12[n] = (LA*dFYFdDdD - LB*dFYRdDdD)/IZZ;
        
        dot13[n] = - cos(PSI[n]);
        dot14[n] = - sin(PSI[n]);
        
        dot15[n] = - LA*cos(PSI[n]);
        dot16[n] = - LA*sin(PSI[n]);
        
        dot17[n] = - U0*cos(PSI[n]) + (V[n] + LA*R[n])*sin(PSI[n]);
        dot18[n] = - U0*sin(PSI[n]) - (V[n] + LA*R[n])*cos(PSI[n]);
    }
    return;
}

void
mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
     
{
    double *dot01, *dot02, *dot03, *dot04, *dot05, *dot06, *dot07;
    double *dot08, *dot09, *dot10, *dot11, *dot12, *dot13, *dot14;
    double *dot15, *dot16, *dot17, *dot18;
    double *V, *R, *PSI, *SA;
    double U0;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 5) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Five input arguments required."); 
    } else if (nlhs > 18) {
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
    OUT_dot15   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot16   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot17   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_dot18   = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    
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
    dot15       = mxGetPr(OUT_dot15);
    dot16       = mxGetPr(OUT_dot16);
    dot17       = mxGetPr(OUT_dot17);
    dot18       = mxGetPr(OUT_dot18);
    
    V           = mxGetPr(IN_V); 
    R           = mxGetPr(IN_R);
    PSI         = mxGetPr(IN_PSI); 
    SA          = mxGetPr(IN_SA); 
    U0          = mxGetScalar(IN_U0);
    
    // Do the actual computations in a subroutine
    OCP_HES_CONT_DYNAMICS_2DOFNL(dot01, dot02, dot03, dot04, dot05, dot06, dot07, dot08, dot09, dot10, dot11, dot12, dot13, dot14, dot15, dot16, dot17, dot18, N, V, R, PSI, SA, U0);
    return;
}