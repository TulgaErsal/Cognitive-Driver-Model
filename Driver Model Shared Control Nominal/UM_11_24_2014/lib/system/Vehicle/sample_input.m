function [CMD_TM, CMD_SA, CMD_UX] = sample_input(U_INIT)

MS          = 1*pi/180;
T_TOTAL     = 10;
TS          = 0.01;

CMD_TM      = 0:TS:T_TOTAL;
TT          = round(MS/(10*pi/180)/TS)*TS;
CMD_TM_SEQ  = [0 TT T_TOTAL/2 T_TOTAL/2+2*TT T_TOTAL];
CMD_SA_SEQ 	= [0 MS MS -MS -MS];
CMD_SA      = interp1f(CMD_TM_SEQ, CMD_SA_SEQ, CMD_TM, 'linear');
CMD_UX      = linspace(U_INIT, 20, length(CMD_TM));