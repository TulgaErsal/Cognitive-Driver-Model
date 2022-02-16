function RESULT = wrapup(TST, SIM, ABNORMAL)

fclose(SIM.f2id);
closePOPUP(SIM.f2name);

fclose(SIM.f3id);
closePOPUP(SIM.f3name);

SIM.SAVEFIG1 = NO;
SIM.SAVEFIG2 = NO;
SIM.SAVEFIG3 = YES;
SIM.SAVEFIG4 = YES;
SIM.SAVEFIG5 = YES;
SIM.SAVEFIG6 = YES;
SIM.SAVEFIG7 = YES;
SIM.SAVEFIG8 = YES;
FIGURE_SAVE(SIM);

close all

if SIM.DISPLAY == YES
    if ABNORMAL == true
        disp('###########################################################')
        disp('# The simulation is finished under termination condition! #')
        disp('###########################################################')
    else
        disp('###########################################')
        disp('# The simulation is sucessfully finished! #')
        disp('###########################################')
    end
end

RESULT.TIME             = TST.TM_SEQ;
RESULT.STATE            = TST.ST_SEQ;
RESULT.COMMAND         	= TST.CM_SEQ;
RESULT.FORCE            = TST.FC_SEQ;
RESULT.X                = TST.ST_SEQ(:,1);
RESULT.Y                = TST.ST_SEQ(:,2);
RESULT.YAW_ANGLE        = TST.ST_SEQ(:,6);
RESULT.LONG_SPEED     	= TST.ST_SEQ(:,7);
RESULT.STEERING_ANGLE   = TST.CM_SEQ(:,1);
RESULT.VERTICAL_LOAD    = TST.FC_SEQ(:,9:12);

fname = [SIM.errorfolder, '/error.txt'];
if exist(fname, 'file') == 2
    fn = errorZIP('check', SIM.errorfolder); %#ok<NASGU>
end