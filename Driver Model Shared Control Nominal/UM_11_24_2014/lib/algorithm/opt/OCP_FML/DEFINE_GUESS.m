function GUESS = DEFINE_GUESS(AUXDATA, BOUNDS)

NPH                     = AUXDATA.num.NPH;

NMST                    = AUXDATA.mif.NMST;
NMCT                    = AUXDATA.mif.NMCT;
XLOC                    = AUXDATA.mif.XLOC;
YLOC                    = AUXDATA.mif.YLOC;

ISP1                    = BOUNDS.PH(1).IS.LB;
HA                      = ISP1(AUXDATA.mif.ALOC);

if AUXDATA.mif.MODEL == 2
    U0              	= AUXDATA.veh.U0;
else
    U0              	= ISP1(AUXDATA.mif.ULOC);
end

PT                      = zeros(NPH + 1, 1);
FS                      = zeros(NPH + 1, NMST);
FS(1,:)                 = ISP1;

PT(1)                   = 0;
STEP                    = BOUNDS.PH(NPH).FT.UB/NPH;

for i = 1:NPH
    % PT(i + 1)           = BOUNDS.PH(i).FT.UB;
    % PT(i + 1)           = (BOUNDS.PH(i).FT.UB - BOUNDS.PH(i).FT.LB)/2 + BOUNDS.PH(i).FT.LB;
    PT(i + 1)           = PT(i) + STEP;
    FS(i + 1,:)         = ISP1;
    FS(i + 1, XLOC)  	= FS(i + 1, XLOC) + PT(i + 1)*U0*cos(HA);
    FS(i + 1, YLOC)    	= FS(i + 1, YLOC) + PT(i + 1)*U0*sin(HA);
    
    GUESS.PH(i).TM      = [PT(i); PT(i+1)];             % time
    GUESS.PH(i).ST      = [FS(i,:); FS(i + 1, :)];      % states
    GUESS.PH(i).CT      = zeros(2, NMCT);               % control
    GUESS.PH(i).IN      = 0;                            % integral
end