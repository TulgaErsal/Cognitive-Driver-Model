function PUSH = EXECUTION_HORIZON(PARA, EXE)

% commands calculated at this step along the execution horizon
T_END          	= min(PARA.EXECUTION_TIME, EXE.NAVI_TM(end));
CMD_TM        	= linspace(0, T_END, 100);
CMD_SA         	= interp1f(EXE.NAVI_TM, EXE.NAVI_SA, CMD_TM, 'linear');
CMD_UX       	= interp1f(EXE.NAVI_TM, EXE.NAVI_UX, CMD_TM, 'linear');
CMD_SR      	= interp1f(EXE.NAVI_TM, EXE.NAVI_SR, CMD_TM, 'linear');
CMD_AX        	= interp1f(EXE.NAVI_TM, EXE.NAVI_AX, CMD_TM, 'linear');

T_TOTAL         = PARA.EXECUTION_TIME;

PUSH.CMD_TM   	= CMD_TM;
PUSH.CMD_SA     = CMD_SA;
PUSH.CMD_UX     = CMD_UX;
PUSH.CMD_SR     = CMD_SR;
PUSH.CMD_AX     = CMD_AX;
PUSH.T_TOTAL    = T_TOTAL;