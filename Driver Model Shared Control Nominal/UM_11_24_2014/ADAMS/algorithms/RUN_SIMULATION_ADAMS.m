% global variables
global SPEC PARA SIM
global TST TAC OBS CMP
global RUN EXE PUSH %#ok<NUSED>
global DEAD_END HIT
DEAD_END = false;
HIT = false;

% ADAMS vehicle model
run_PLANT_step;

% indicator for running MPC-based obstacle avoidance algorithm
global ALG_IND
ALG_IND = 0;

% indicator for initial sensing delay compensation
global RUN0_IND
RUN0_IND = 0;

% used for coordinate transformation
X_INIT = INPUT.VP_INIT(1);
Y_INIT = INPUT.VP_INIT(2);

% initialization
[SPEC, TST, TAC, PARA, RUN, OBS, CMP, SIM] = INITIALIZE_SIM_ADAMS(INPUT);

% file name for storing true states
SIM.ts_fn = [SIM.logfolder, '/true_states.dat'];

if exist(SIM.ts_fn, 'file') == 2
    delete(SIM.ts_fn);
end

% run the simulation
open('ADAMS_OCOA.slx')
sim('ADAMS_OCOA.slx', 20)

fclose(SIM.f2id);
closePOPUP(SIM.f2name);

fclose(SIM.f3id);
closePOPUP(SIM.f3name);

SIM.SAVEFIG3 = YES;
SIM.SAVEFIG4 = YES;
SIM.SAVEFIG5 = YES;
SIM.SAVEFIG6 = YES;
SIM.SAVEFIG7 = YES;
SIM.SAVEFIG8 = YES;

if SIM.FIG3 == YES && SIM.SAVEFIG3 == YES
    figure(3)
    saveas(gcf,[SIM.logfolder,'/FIG3_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG3_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG4 == YES && SIM.SAVEFIG4 == YES
    figure(4)
    saveas(gcf,[SIM.logfolder,'/FIG4_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG4_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG5 == YES && SIM.SAVEFIG5 == YES
    figure(5)
    saveas(gcf,[SIM.logfolder,'/FIG5_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG5_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG6 == YES && SIM.SAVEFIG6 == YES
    figure(6)
    saveas(gcf,[SIM.logfolder,'/FIG6_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG6_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG7 == YES && SIM.SAVEFIG7 == YES
    figure(7)
    saveas(gcf,[SIM.logfolder,'/FIG7_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG7_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG8 == YES && SIM.SAVEFIG8 == YES
    figure(8)
    saveas(gcf,[SIM.logfolder,'/FIG8_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG8_STEP',num2str(SIM.STEPCNT)],'png')
end