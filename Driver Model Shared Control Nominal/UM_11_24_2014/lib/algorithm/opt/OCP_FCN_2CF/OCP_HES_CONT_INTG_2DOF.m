function VALUE_HES_INTG = OCP_HES_CONT_INTG_2DOF(X, Y, SA, SR, INTG_W, REF_LINE)

VALUE_HES_INTG = zeros(length(SA), 3);

% integrand weights
INTG_W1 = INTG_W(1);
INTG_W3 = INTG_W(3);
INTG_W5 = INTG_W(5);
LC1     = REF_LINE(1);
LC2     = REF_LINE(2);
LC3     = REF_LINE(3);

MAT_ONES            = ones(size(SA));

VALUE_HES_INTG(:,1)	= 2*INTG_W5*LC1*LC1;
VALUE_HES_INTG(:,2)	= 2*INTG_W5*LC2*LC1;
VALUE_HES_INTG(:,3)	= 2*INTG_W5*LC2*LC2;
VALUE_HES_INTG(:,4)	= 2*INTG_W1*MAT_ONES;
VALUE_HES_INTG(:,5)	= 2*INTG_W3*MAT_ONES;