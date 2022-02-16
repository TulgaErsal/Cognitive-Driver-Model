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
#define IN_GAMMA    prhs[3]
#define IN_VX       prhs[4]

// Output Arguments
#define OUT_FX      plhs[0]
#define	OUT_FY   	plhs[1]
#define OUT_MX      plhs[2]
#define	OUT_MY   	plhs[3]
#define	OUT_MZ   	plhs[4]

// Functions
#if !defined(MAX)
#define	MAX(A, B)	((A) > (B) ? (A) : (B))
#endif

// Tire Model
static void PAC2002_biased(
            double FX[],
            double FY[],
            double MX[],
            double MY[],
            double MZ[],
            double N,
            double FZ[],
            double KAPPA[],
            double ALPHA[],
            double GAMMA[],
            double VX[]
		   )
{
    // Number of data points
    int n;
    
    double epsilon = 0.001;
    double DFZ;
    
    // PAC2002_FX0
    double GAMMAX, KAPPAX;
    double SHX, SVX, BX, CX, DX, EX, KX, MUX;
    double TMPX1, TMPX2;
    double FX0;
    
    // PAC2002_FY0
    double GAMMAY, ALPHAY;
    double SHY, SVY, BY, CY, DY, EY, KY0, KY, MUY;
    double TMPY1, TMPY2;
    double FY0;
    
    //PAC2002_MZ0
    double GAMMAZ, ALPHAT, ALPHAR;
    double SHT, BT, CT, DT, ET, SHF, BR, CR, DR;
    double TMPZ1;
    double T0, KY_M, MZR0, MZ0;
    
    // PAC2002_FX
    double ALPHAS;
    double BXA, CXA, EXA, SHXA, GX;
    double TMPX3, TMPX4; 

    // PAC2002_FY
    double KAPPAS;
    double BYK, CYK, EYK, SHYK, GY, DVYK, SVYK;
    double TMPY3, TMPY4;

    // PAC2002_MZ
    double ALPHATEQ, ALPHAREQ;
    double SCS, TCS, MZRCS;
    double TMPZ2;
    
    for (n=0; n < N; n++) {
        DFZ     = FZ[n]/FZ0 - 1;
        
        // PAC2002_FX0
        GAMMAX  = GAMMA[n];
        SHX     = PHX1 + PHX2*DFZ;
        SVX     = FZ[n]*(PVX1 + PVX2*DFZ);
        KAPPAX  = KAPPA[n] + SHX;
        CX      = PCX1;
        MUX     = (PDX1 + PDX2*DFZ)*(1 - PDX3*GAMMAX*GAMMAX);
        DX      = MUX*FZ[n];
        EX      = (PEX1 + PEX2*DFZ + PEX3*DFZ*DFZ)*(1 - PEX4*KAPPAX/fabs(KAPPAX));
        KX      = FZ[n]*(PKX1 + PKX2*DFZ)*exp(PKX3*DFZ);
        TMPX1   = PCX1*MUX*FZ[n];
        TMPX1   = TMPX1 + TMPX1*epsilon/fabs(TMPX1); // modify denominator
        BX      = KX/TMPX1;
        TMPX2 	= BX*KAPPAX;
        FX0     = DX*sin(CX*atan(TMPX2 - EX*(TMPX2 - atan(TMPX2)))) + SVX;
        
        // PAC2002_FY0
        GAMMAY  = GAMMA[n];
        SHY     = PHY1 + PHY2*DFZ + PHY3*GAMMAY;
        SVY     = FZ[n]*(PVY1 + PVY2*DFZ + (PVY3 + PVY4*DFZ)*GAMMAY);
        ALPHAY  = ALPHA[n] + SHY;
        CY      = PCY1;
        MUY     = (PDY1 + PDY2*DFZ)*(1 - PDY3*GAMMAY*GAMMAY);
        DY      = MUY*FZ[n];
        EY      = (PEY1 + PEY2*DFZ)*(1 - (PEY3 + PEY4*GAMMAY)*ALPHAY/fabs(ALPHAY));
        KY0     = PKY1*(FZ0)*sin(2*atan(FZ[n]/(PKY2*FZ0)));
        KY      = KY0*(1 - PKY3*abs(GAMMAY));
        TMPY1	= PCY1*MUY*FZ[n];
        TMPY1   = TMPY1 + TMPY1*epsilon/fabs(TMPY1); // modify denominator
        BY      = KY/TMPY1;
        TMPY2 	= BY*ALPHAY;
        FY0     = DY*sin(CY*atan(TMPY2 - EY*(TMPY2 - atan(TMPY2)))) + SVY;
        
        // PAC2002_MZ0
        GAMMAZ  = GAMMA[n];
        SHT     = QHZ1 + QHZ2*DFZ + (QHZ3 + QHZ4*DFZ)*GAMMAZ;
        ALPHAT  = ALPHA[n] + SHT;
        BT      = (QBZ1 + QBZ2*DFZ + QBZ3*DFZ*DFZ)*(1 + QBZ4*GAMMAZ + QBZ5*abs(GAMMAZ));
        CT      = QCZ1;
        DT      = FZ[n]*(QDZ1 + QDZ2*DFZ)*(1 + QDZ3*GAMMAZ + QDZ4*GAMMAZ*GAMMAZ)*(R0/FZ0);
        ET      = (QEZ1 + QEZ2*DFZ + QEZ3*DFZ*DFZ)*(1 + (QEZ4 + QEZ5*GAMMAZ)*((2/pi)*atan(BT*CT*ALPHAT)));
        TMPZ1   = BT*ALPHAT;
        T0      = DT*cos(CT*atan(TMPZ1 - ET*(TMPZ1 - atan(TMPZ1))))*cos(ALPHA[n]);
        KY_M    = KY + KY*epsilon/fabs(KY); // modify denominator
        SHF     = SHY + SVY/KY_M;
        ALPHAR  = ALPHA[n] + SHF;
        BR      = QBZ9 + QBZ10*BY*CY;
        CR      = 1;
        DR      = FZ[n]*((QDZ6 + QDZ7*DFZ) + (QDZ8 + QDZ9*DFZ)*GAMMAZ)*R0;
        MZR0    = DR*cos(CR*atan(BR*ALPHAR))*cos(ALPHA[n]);
        MZ0     = -T0*FY0 + MZR0;
        
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
        DVYK    = MUY*FZ[n]*(RVY1 + RVY2*DFZ + RVY3*GAMMA[n])*cos(atan(RVY4*ALPHA[n]));
        SVYK    = DVYK*sin(RVY5*atan(RVY6*KAPPA[n]));
        FY[n]   = GY*FY0 + SVYK;

        // PAC2002_MX
        MX[n]	= R0*FZ[n]*(QSX1 -QSX2*GAMMA[n] + QSX3*FY[n]/FZ0);
        
        // PAC2002_MY
        MY[n]	= -R0*FZ[n]*(QSY1 + QSY2*FX[n]/FZ0 + QSY3*abs(VX[n]/VREF)+ QSY4*(VX[n]/VREF)*(VX[n]/VREF));
        
        // PAC2002_MZ
        ALPHATEQ = atan(sqrt((tan(ALPHAT))*(tan(ALPHAT)) + (KX/KY)*(KX/KY)*KAPPA[n]*KAPPA[n])*ALPHAT/fabs(ALPHAT));
        ALPHAREQ = atan(sqrt((tan(ALPHAR))*(tan(ALPHAR)) + (KX/KY)*(KX/KY)*KAPPA[n]*KAPPA[n])*ALPHAR/fabs(ALPHAR));
        SCS     = R0*(SSZ1 + SSZ2*(FY[n]/FZ0) + (SSZ3 + SSZ4*DFZ)*GAMMA[n]);
        TMPZ2   = BT*ALPHATEQ;
        TCS     = DT*cos(CT*atan(TMPZ2 - ET*(TMPZ2 - atan(TMPZ2))))*cos(ALPHA[n]);
        MZRCS   = DR*cos(CR*atan(BR*ALPHAREQ))*cos(ALPHA[n]);
        MZ[n]   = SCS*FX[n] - TCS*(FY[n] - SVYK) + MZRCS;
    }
    return;
}

void mexFunction( int nlhs, mxArray *plhs[], 
		  int nrhs, const mxArray*prhs[] )
     
{ 
    double *FX, *FY, *MX, *MY, *MZ; 
    double *FZ, *KAPPA, *ALPHA, *GAMMA, *VX;
    double N;
    size_t m,n; 
    
    // Check for proper number of arguments
    if (nrhs != 5) { 
	    mexErrMsgIdAndTxt( "MATLAB:yprime:invalidNumInputs",
                "Five input arguments required."); 
    } else if (nlhs > 5) {
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
    OUT_MX  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_MY  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    OUT_MZ  = mxCreateDoubleMatrix( (mwSize)m, (mwSize)n, mxREAL);
    
    // Assign pointers to the various parameters
    FX      = mxGetPr(OUT_FX);
    FY      = mxGetPr(OUT_FY);
    MX      = mxGetPr(OUT_MX);
    MY      = mxGetPr(OUT_MY);
    MZ      = mxGetPr(OUT_MZ);
    
    FZ      = mxGetPr(IN_FZ); 
    KAPPA   = mxGetPr(IN_KAPPA);
    ALPHA   = mxGetPr(IN_ALPHA);
    GAMMA   = mxGetPr(IN_GAMMA);
    VX      = mxGetPr(IN_VX);
    
    // Do the actual computations in a subroutine
    PAC2002_biased(FX, FY, MX, MY, MZ, N, FZ, KAPPA, ALPHA, GAMMA, VX); 
    
    return;
}
