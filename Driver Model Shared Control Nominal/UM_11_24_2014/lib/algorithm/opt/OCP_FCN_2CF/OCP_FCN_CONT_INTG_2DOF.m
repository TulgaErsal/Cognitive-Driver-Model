function VALUE_FCN_INTG = OCP_FCN_CONT_INTG_2DOF(X, Y, SA, SR, INTG_W, REF_LINE)

% integrand weights
INTG_W1     = INTG_W(1);
INTG_W3     = INTG_W(3);
INTG_W5     = INTG_W(5);
LC1         = REF_LINE(1);
LC2         = REF_LINE(2);
LC3         = REF_LINE(3);

% sum of 5 terms
VALUE_FCN_INTG = INTG_W1 * SA.^2 + ...
                 INTG_W3 * SR.^2 + ...
                 INTG_W5 * (LC1*X + LC2*Y + LC3).^2;