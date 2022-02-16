function test_ipopt(PARA, VCS)

SIM.LOGS = NO;

% specification of the steer towards the goal problem
S2G                 = STEER2GOAL_FML(PARA, VCS, SIM, false);

% formulation of the optimal control problem
INPUT               = STEER2GOAL_OCP(PARA, VCS, S2G);

% mesh 
SEG_NUM           	= 10;
MESH.PH.FCT       	= (1/SEG_NUM)*ones(1, SEG_NUM);
MESH.PH.NCP       	= 4*ones(1, SEG_NUM);

INPUT.MESH         	= MESH;

% define the optimal control problem
SETUP           	= DEFINE_OCP(INPUT);

% solve the optimal control problem
RESULT             	= SOLVE_OCP(SETUP); %#ok<NASGU>