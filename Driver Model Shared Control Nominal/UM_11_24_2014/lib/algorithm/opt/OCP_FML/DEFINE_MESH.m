function MESH = DEFINE_MESH(AUXDATA)

NPH             = AUXDATA.num.NPH;
SEG_NUM         = 10;

for IdxPH = 1:NPH
    % fraction of the interval
    MESH.PH(IdxPH).FCT	= (1/SEG_NUM)*ones(1,SEG_NUM); 
    % number of collocation points
    MESH.PH(IdxPH).NCP	= 4*ones(1,SEG_NUM); 
end