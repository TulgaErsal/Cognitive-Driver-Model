function TST = TRUE_STATES_ADAMS(TST, u, t_round, fn)

TST.TM = [];
TST.ST = [];
TST.CM = [];
TST.FC = [];

TST.SA = [];
TST.SR = [];
TST.AX = [];

TST.TIME_PRE = t_round;

TST.STATES_INIT(1)  = u(1);
TST.STATES_INIT(2)  = u(2);
TST.STATES_INIT(6)  = u(3);
TST.STATES_INIT(7)  = u(4);
TST.STATES_INIT(8)  = u(5);
TST.STATES_INIT(12) = u(6);

RESULT = dlmread(fn);
idx = diff(RESULT(:, 1)) == 0;
RESULT(idx, :) = [];

TST.T_SEQ = RESULT(:, 1);
TST.X_SEQ = RESULT(:, 2);
TST.Y_SEQ = RESULT(:, 3);
TST.A_SEQ = RESULT(:, 4);