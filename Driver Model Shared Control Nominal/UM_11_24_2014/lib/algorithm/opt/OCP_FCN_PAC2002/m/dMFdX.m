function RES = dMFdX(VAR, dVARdX, E, dEdX)

% MF        = atan(VAR - E.*(VAR - atan(VAR)));

TMP1     	= VAR - atan(VAR);
dTMP1dX     = dVARdX - dVARdX./(1 + VAR.^2);
TMP2        = VAR - E.*TMP1;
dTMP2dX     = dVARdX - dEdX.*TMP1 - E.*dTMP1dX;
% MF      	= atan(TMP2);
RES         = dTMP2dX./(1 + TMP2.^2);


