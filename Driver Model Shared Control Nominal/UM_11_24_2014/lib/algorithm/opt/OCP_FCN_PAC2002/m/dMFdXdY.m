function RES = dMFdXdY(VAR, dVARdX, dVARdY, dVARdXdY, E, dEdX, dEdY, dEdXdY)

% MF        = atan(VAR - E.*(VAR - atan(VAR)));

TMP1        = VAR - atan(VAR);

TMP4        = 1 + VAR.^2;
dTMP4dY     = 2*VAR.*dVARdY;

dTMP1dX     = dVARdX - dVARdX./TMP4;
dTMP1dY     = dVARdY - dVARdY./TMP4;

dTMP1dXdY	= dVARdXdY - (dVARdXdY.*TMP4 - dVARdX.*dTMP4dY)./(TMP4.^2);

TMP2    	= VAR - E.*TMP1;

dTMP2dX     = dVARdX - dEdX.*TMP1 - E.*dTMP1dX;
dTMP2dY     = dVARdY - dEdY.*TMP1 - E.*dTMP1dY;

dTMP2dXdY   = dVARdXdY - dEdXdY.*TMP1 - dEdX.*dTMP1dY - dEdY.*dTMP1dX - E.*dTMP1dXdY;

TMP3      	= 1 + TMP2.^2;
dTMP3dY     = 2*TMP2.*dTMP2dY;

% MF      	= atan(TMP2);
% dMFdX  	= dTMP2dX./TMP3;
RES         = (dTMP2dXdY.*TMP3 - dTMP2dX.*dTMP3dY)./(TMP3.^2);

   


