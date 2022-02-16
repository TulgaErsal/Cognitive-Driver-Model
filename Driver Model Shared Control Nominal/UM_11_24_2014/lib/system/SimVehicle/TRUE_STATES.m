function TST = TRUE_STATES(TST, OUTPUT)

% data from the past execution step
TM              	= OUTPUT.TIME;
ST              	= OUTPUT.STATE;
CM                  = OUTPUT.COMMAND;
CM(1, :)            = CM(2, :);
FC              	= OUTPUT.FORCE;
FC(1, :)            = FC(2, :);

TST.TM              = TM;
TST.ST              = ST;
TST.FC              = FC;
TST.CM              = CM;

TST.SA              = CM(end, 1);
TST.SR              = 0;
TST.AX              = 0;

% data log since the start of the simulation
TST.T_SEQ          	= [TST.T_SEQ; TM(2:end) + TST.TIME_PRE];
TST.X_SEQ          	= [TST.X_SEQ; ST(2:end, 1)];
TST.Y_SEQ          	= [TST.Y_SEQ; ST(2:end, 2)];
TST.A_SEQ         	= [TST.A_SEQ; ST(2:end, 6)];

RM_IDX            	= find(diff(TST.T_SEQ)<=0) + 1;
TST.T_SEQ(RM_IDX)  	= [];
TST.X_SEQ(RM_IDX)  	= [];
TST.Y_SEQ(RM_IDX)  	= [];
TST.A_SEQ(RM_IDX)  	= [];

if size(TST.TM_SEQ, 1) == 1
    TST.TM_SEQ      = TM + TST.TIME_PRE;
    TST.ST_SEQ      = ST;
    TST.CM_SEQ      = CM;
    TST.FC_SEQ      = FC;
else
    TST.TM_SEQ      = [TST.TM_SEQ;	TM(2:end) + TST.TIME_PRE];
    TST.ST_SEQ      = [TST.ST_SEQ; 	ST(2:end,:)];
    TST.CM_SEQ      = [TST.CM_SEQ;  CM(2:end,:)];
    TST.FC_SEQ      = [TST.FC_SEQ; 	FC(2:end,:)];
end

RM_IDX                  = find(diff(TST.TM_SEQ)<=0) + 1;
TST.TM_SEQ(RM_IDX,:)	= [];
TST.ST_SEQ(RM_IDX,:)   	= [];
TST.CM_SEQ(RM_IDX,:) 	= [];
TST.FC_SEQ (RM_IDX,:)  	= [];

% initialization for next step
TST.TIME_PRE     	= TST.TIME_PRE + TM(end);
TST.STATES_INIT    	= ST(end,:);

