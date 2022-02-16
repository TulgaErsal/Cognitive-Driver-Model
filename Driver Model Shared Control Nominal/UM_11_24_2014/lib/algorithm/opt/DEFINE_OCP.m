function SETUP = DEFINE_OCP(INPUT)

% Name of the OCP problem
NAME                = INPUT.NAME;

% DoF of the model used 
if ~isfield(INPUT, 'MODEL')
    INPUT.MODEL   	= 2;
end

% Auxiliary data
AUXDATA             = DEFINE_AUXDATA(INPUT);

% Bounds
BOUNDS              = DEFINE_BOUNDS(INPUT, AUXDATA);

% Solution guess
if isfield(INPUT, 'GUESS')
    GUESS           = INPUT.GUESS;
else
    GUESS       	= DEFINE_GUESS(AUXDATA, BOUNDS);
end

% Mesh
if isfield(INPUT, 'MESH')
    MESH            = INPUT.MESH;
else
    MESH         	= DEFINE_MESH(AUXDATA);
end

SETUP.NAME          = NAME;
SETUP.AUXDATA       = AUXDATA;
SETUP.BOUNDS        = BOUNDS;
SETUP.GUESS         = GUESS;
SETUP.MESH          = MESH;
