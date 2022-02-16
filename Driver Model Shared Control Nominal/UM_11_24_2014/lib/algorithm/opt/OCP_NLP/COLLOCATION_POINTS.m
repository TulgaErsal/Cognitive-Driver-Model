function OCPINFO = COLLOCATION_POINTS(SETUP, OCPINFO)

% collocation points

MESH	= SETUP.MESH.PH;

NPH     = SETUP.AUXDATA.num.NPH;

% preallocate
NNO                 = zeros(1,NPH);
CLT(NPH).TAU     	= [];
CLT(NPH).WGT      	= [];
CLT(NPH).IV_IX  	= [];
CLT(NPH).IG_IX      = [];
CLT(NPH).IG_SP  	= [];

% loop through all phase
for IdxPH = 1:NPH
    NCP             = MESH(IdxPH).NCP;  % number of collocation points
    FCT             = MESH(IdxPH).FCT;  % fraction of the interval
    
    % total number of collocation points in current phase
    SumNCP       	= sum(NCP);   
    CS_NCP          = [0, cumsum(NCP)];
    CS_NCP2         = [0, cumsum(NCP.^2)];
    
    % cumulative sum of the fractions
    CS_FRAC         = [0, cumsum(FCT)];

    % preallocate
    TAU         	= zeros(SumNCP,1);
    WGT            	= zeros(SumNCP,1);
    IV_IX       	= zeros(SumNCP,3);
    IG_IX           = zeros(sum(NCP.^2),3);

    % loop through the number of segments in the phase
    for IdxSG = 1:length(FCT)
        I_SEQ1              = (1:NCP(IdxSG)) + CS_NCP(IdxSG);
        N                   = NCP(IdxSG);
        
        [TAU_IdxSG, WGT_IdxSG, IMAT_IdxSG] = LGR_Nodes(N);
        
        % collocation points for entire domain
        TAU(I_SEQ1)      	= (TAU_IdxSG + 1).*FCT(IdxSG) + 2.*CS_FRAC(IdxSG) - 1;
        
        % weights
        WGT(I_SEQ1)        	= WGT_IdxSG.*FCT(IdxSG);
        
        % initial value matrix
        IV_IX(I_SEQ1,1)     = (1:N)'    + CS_NCP(IdxSG);
        IV_IX(I_SEQ1,2) 	= ones(N,1) + CS_NCP(IdxSG);
        IV_IX(I_SEQ1,3)     = ones(N,1);

        I_SEQ2              = (1:(NCP(IdxSG)^2)) + CS_NCP2(IdxSG);
        
        % integration matrix
        ISEG            	= zeros(N.*N,3);
        for i = 1:N
            ISEG((1:N) + (i-1)*N,1) = i.*ones(N,1);     % column index
            ISEG((1:N) + (i-1)*N,2) = (1:N)';           % row index
            ISEG((1:N) + (i-1)*N,3) = IMAT_IdxSG(i,:)';	% value
        end
        
        IG_IX(I_SEQ2,1:2) 	= ISEG(:,1:2) + CS_NCP(IdxSG);      % (column index, row index)
        IG_IX(I_SEQ2,3)   	= ISEG(:,3)*FCT(IdxSG);
    end
    
    NNO(IdxPH)              = SumNCP;
  	CLT(IdxPH).TAU          = TAU;
    CLT(IdxPH).WGT          = WGT;
    CLT(IdxPH).IV_IX        = IV_IX;
    CLT(IdxPH).IG_IX        = IG_IX;
    IG_SP                   = sparse(IG_IX(:,1),IG_IX(:,2),IG_IX(:,3),SumNCP,SumNCP); 
    CLT(IdxPH).IG_SP        = IG_SP;
end

OCPINFO.NNO = NNO;
OCPINFO.CLT = CLT;