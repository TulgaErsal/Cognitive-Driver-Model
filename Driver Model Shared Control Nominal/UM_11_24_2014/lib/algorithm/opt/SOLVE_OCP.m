function RESULT = SOLVE_OCP(SETUP)

% this function solves the optimal control problem defined
% 
% The gradients and the hessian matrices are given by analytical equations
% The gradients and the hessian matrices are stored using sparse matrices
% The dependency maps are provided manually
% The problem is discretized into NLP using the 
% Radau Pseudospectral Method - integral version
% The NLP problem is not scaled
% The NLP problem is solved using IPOPT

OCPTS                   = tic;

% Auxiliary data
OCPINFO.AUXDATA         = SETUP.AUXDATA;

% Counters
OCPINFO.NPH             = SETUP.AUXDATA.num.NPH;
OCPINFO.NST             = SETUP.AUXDATA.num.NST;
OCPINFO.NCT             = SETUP.AUXDATA.num.NCT;
OCPINFO.NPT             = SETUP.AUXDATA.num.NPT;
OCPINFO.NIN             = SETUP.AUXDATA.num.NIN;
OCPINFO.NEG             = SETUP.AUXDATA.num.NEG;
OCPINFO.NEV             = SETUP.AUXDATA.num.NEV;
OCPINFO.PDU             = SETUP.AUXDATA.num.PDU; 

% fid = fopen([rootpath, '\lib\algorithm\opt\OCP_FCN_2VM\cpp\DATA_HMMWV_2DOF.cpp'], 'wt');
% fprintf(fid, '#define M\t %5.20f\n',    SETUP.AUXDATA.veh.M);
% fprintf(fid, '#define IZZ\t %5.20f\n',  SETUP.AUXDATA.veh.IZZ);
% fprintf(fid, '#define LA\t %5.20f\n',   SETUP.AUXDATA.veh.LA);
% fprintf(fid, '#define LB\t %5.20f\n',   SETUP.AUXDATA.veh.LB);
% fprintf(fid, '#define FZF0\t %5.20f\n', SETUP.AUXDATA.veh.FZF0);
% fprintf(fid, '#define FZR0\t %5.20f\n', SETUP.AUXDATA.veh.FZR0);
% fprintf(fid, '#define dF\t %5.20f\n',   SETUP.AUXDATA.veh.dF);
% fprintf(fid, '#define U0\t %5.20f\n',   SETUP.AUXDATA.veh.U0);
% fclose(fid);

% Derivative map: endpoint variables
OCPINFO                 = DER_MAP_ENDP(SETUP, OCPINFO);

% Derivative map: continuous variables
if OCPINFO.AUXDATA.mif.MODEL == 2
    OCPINFO             = DER_MAP_CONT_2DOFNL(SETUP, OCPINFO);
else
    error('only 2 DoF model is available')
end

% Collocatopn points
OCPINFO                 = COLLOCATION_POINTS(SETUP, OCPINFO);

% NLP bounds and map
[NLCBOUNDS, OCPINFO]    = OCP2NLP_BOUNDS(SETUP, OCPINFO);

% NLP Guess
GUESS                   = OCP2NLP_GUESS(SETUP, OCPINFO);

% Jacobian structure
OCPINFO                 = STRUCTURE_JACOBIAN(OCPINFO);

% Hessian structure
OCPINFO                 = STRUCTURE_HESSIAN(OCPINFO);

% Callback functions
FCNS.objective          = @IPOPT_OBJECTIVE;
FCNS.constraints        = @IPOPT_CONSTRAINTS;
FCNS.gradient           = @IPOPT_GRADIENT;
FCNS.jacobian           = @IPOPT_JACOBIAN;
FCNS.jacobianstructure  = @IPOPT_JACOBIAN_STRUCTURE;
FCNS.hessian            = @IPOPT_HESSIAN;
FCNS.hessianstructure   = @IPOPT_HESSIAN_STRUCTURE;

% Auxiliary data
OPTIONS.auxdata         = OCPINFO;

% Bounds
OPTIONS.lb              = NLCBOUNDS.ZL; % Lower bound on the variables
OPTIONS.ub              = NLCBOUNDS.ZU; % Upper bound on the variables
OPTIONS.cl              = NLCBOUNDS.FL; % Lower bounds on the constraint functions
OPTIONS.cu              = NLCBOUNDS.FU; % Upper bounds on the constraint functions

% IPOPT options
OPTIONS.ipopt.tol                   = 1e-4;
OPTIONS.ipopt.print_level           = 1; % set print level default
OPTIONS.ipopt.nlp_scaling_method    = 'none'; % turn scaling off
% OPTIONS.ipopt.mu_init             = 1e-2; % changin initial barrier parameter
% OPTIONS.ipopt.bound_relax_factor  = 1e-6; % equality constraint relaxation factor
OPTIONS.ipopt.mu_strategy           = 'adaptive';
OPTIONS.ipopt.linear_solver         = 'mumps';
OPTIONS.ipopt.max_iter              = 300;

% call IPOPT
NLPTS                   = tic;
[ZSOL, NLPINFO]         = ipopt(GUESS, FCNS, OPTIONS);
NLPTE                   = toc(NLPTS);

OCPTE                   = toc(OCPTS);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RESULT.NAME             = SETUP.NAME;
RESULT.NLPSTATUS        = NLPINFO.status;
RESULT.OBJECTIVE        = IPOPT_OBJECTIVE(ZSOL, OCPINFO);
RESULT.SOLUTION         = NLP2OCP_SOLUTION(ZSOL, OCPINFO);
RESULT.SETUP            = SETUP;
RESULT.NLPINFO          = NLPINFO;
RESULT.OCPINFO          = OCPINFO;
RESULT.NLPTIME          = NLPTE;
RESULT.OCPTIME          = OCPTE;