function VD = OCP_VEHICLE_DATA(INPUT)

veh        	= INPUT.AUXDATA.veh;

VD.M        = veh.M;
VD.IZZ      = veh.IZZ;
VD.LA       = veh.LA;
VD.LB       = veh.LB;
VD.FZF0    	= veh.FZF0;
VD.FZR0     = veh.FZR0;
VD.dF       = veh.dF;
VD.U0       = veh.U0;