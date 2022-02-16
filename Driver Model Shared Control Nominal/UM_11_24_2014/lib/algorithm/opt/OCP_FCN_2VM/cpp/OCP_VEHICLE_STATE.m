function [t, X, Y, V, R, SA, PSI, SR] = OCP_VEHICLE_STATE(PHASE)

t           = PHASE.TM;
X           = PHASE.ST(:,1);
Y           = PHASE.ST(:,2);
V           = PHASE.ST(:,3);
R          	= PHASE.ST(:,4);
SA          = PHASE.ST(:,5);
PSI       	= PHASE.ST(:,6);
SR          = PHASE.CT(:,1);