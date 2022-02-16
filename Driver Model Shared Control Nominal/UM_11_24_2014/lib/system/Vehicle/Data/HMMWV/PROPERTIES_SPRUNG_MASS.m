function [MASS, X, Y, Z, IXX, IYY, IZZ] = PROPERTIES_SPRUNG_MASS()
    % Mass Information
    MTotal = 2688.7180162729;
    MChassis = 2086.524902;
    MSteering = 17.9969748396;
    MPowertrain = 53.359237;
    MTireFL = 68.0388555;
    MTireFR = 68.0388555;
    MTireRL = 68.0388555;
    MTireRR = 68.0388555;
    MSuspFL = 43.2706024706;
    MSuspFR = 43.2706024706;
    MSuspF = 50.0;
    MSuspRL = 38.390519246;
    MSuspRR = 38.390519246;
    MSuspR = 45.359237;
    
MASS = MChassis + (MSteering + MPowertrain + MSuspF + ...
        MSuspFL + MSuspFR + MSuspR + ...
        MSuspRL + MSuspRR) / 2;

    
    XChassis = 2110.74;
    YChassis = 0.0;
    ZChassis = 965.2;
    LChassis = [XChassis, YChassis, ZChassis];
    
    XSteering = 917.2523599596;
    YSteering = -174.6896659309;
    ZSteering = 733.12653361;
    LSteering = [XSteering, YSteering, ZSteering];

    XPowertrain = 308.4601828172;
    YPowertrain = 0.0;
    ZPowertrain = 71.8597981452;
    LPowertrain = [XPowertrain, YPowertrain, ZPowertrain];
    
    XSuspFL = 377.920555765;
    YSuspFL = -572.0020793269;
    ZSuspFL = 471.8621635204;
    LSuspFL = [XSuspFL, YSuspFL, ZSuspFL];

    XSuspFR = 377.920555765;
    YSuspFR = 572.0020793269;
    ZSuspFR = 471.8621635204;
    LSuspFR = [XSuspFR, YSuspFR, ZSuspFR];

    XSuspRL = 3699.4530825409;
    YSuspRL = -586.6087233466;
    ZSuspRL = 454.2139382596;
    LSuspRL = [XSuspRL, YSuspRL, ZSuspRL];

    XSuspRR = 3699.4530825409;
    YSuspRR = 586.6087233466;
    ZSuspRR = 454.2139382596;
    LSuspRR = [XSuspRR, YSuspRR, ZSuspRR];
    
    XSuspF = 406.4;
    YSuspF = 0;
    ZSuspF = 149.9999999994;
    LSuspF = [XSuspF, YSuspF, ZSuspF];

    % the value of XSuspR from ADAMS is not reasonable
    % an estimated value is used
    XSuspR = XSuspRL - (XSuspF - XSuspFL);      
    YSuspR = 0;
    ZSuspR = 149.9999999994;
    LSuspR = [XSuspR, YSuspR, ZSuspR];
    
LSprungMass = (MChassis*LChassis + MSteering*LSteering/2 + ...
    MPowertrain*LPowertrain/2 + MSuspF*LSuspF/2 + ...
    MSuspFL*LSuspFL/2 + MSuspFR*LSuspFR/2 + ...
    MSuspR*LSuspR/2 + ...
    MSuspRL*LSuspRL/2 + MSuspRR*LSuspRR/2)/MASS;
X = LSprungMass(1);
Y = LSprungMass(2);
Z = LSprungMass(3);
    
IXXChassis = 3.0223530767E+009;
IYYChassis = 1.4195424592E+010;
IZZChassis = 1.2866138231E+010;
IXYChassis = 0.0;
IXZChassis = 4.250848489E+009;
IYZChassis = 0.0;

IXXSuspFL = 2.5504587531E+007;
IYYSuspFL = 1.6777813312E+007;
IZZSuspFL = 2.1763143422E+007;
IXYSuspFL = -9.4689782253E+006;
IXZSuspFL = 7.6628218079E+006;
IYZSuspFL = -1.1545148861E+007;

IXXSuspFR = 2.5504587531E+007;
IYYSuspFR = 1.6777813312E+007;
IZZSuspFR = 2.1763143422E+007;
IXYSuspFR = 9.4689782253E+006;
IXZSuspFR = 7.6628218079E+006;
IYZSuspFR = 1.1545148861E+007;

IXXSuspRL = 2.2857090014E+007;
IYYSuspRL = 5.3419310248E+008;
IZZSuspRL = 5.4035638026E+008;
IXYSuspRL = -8.331090387E+007;
IXZSuspRL = 6.4374890847E+007;
IYZSuspRL = -1.0118043797E+007;

IXXSuspRR = 2.2857090014E+007;
IYYSuspRR = 5.3419310248E+008;
IZZSuspRR = 5.4035638026E+008;
IXYSuspRR = 8.331090387E+007;
IXZSuspRR = 6.4374890847E+007;
IYZSuspRR = 1.0118043797E+007;

IXXSuspF = 1.125001E+006;
IYYSuspF = 9.383049E+006;
IZZSuspF = 8.258049E+006;
IXYSuspF = 0.0;
IXZSuspF = 3.048E+006;
IYZSuspF = 0.0;

% IXXSuspR = 1.0208754721E+006;
% IYYSuspR = 1.0208754721E+006;
% IZZSuspR = 292.6396534292;
% IXYSuspR = 0.0;
% IXZSuspR = 0.0;
% IYZSuspR = 0.0;

IXXSteering = 1.2497920715E+007;
IYYSteering = 2.8901250884E+007;
IZZSteering = 1.939845515E+007;
IXYSteering = -3.689303506E+006;
IXZSteering = 1.3929595815E+007;
IYZSteering = -2.9398281118E+006;

IXXPowertrain = 2.1635927621E+006;
IYYPowertrain = 5.7507997882E+007;
IZZPowertrain = 5.599502368E+007;
IXYPowertrain = 0.0;
IXZPowertrain = 7.8049908416E+006;
IYZPowertrain = 0.0;

IXXChassis = IXXChassis - MChassis*(YChassis^2 + ZChassis^2);
IYYChassis = IYYChassis - MChassis*(XChassis^2 + ZChassis^2);
IZZChassis = IZZChassis - MChassis*(XChassis^2 + YChassis^2);
IXYChassis = IXYChassis - MChassis*XChassis*YChassis;
IXZChassis = IXZChassis - MChassis*XChassis*ZChassis;
IYZChassis = IYZChassis - MChassis*YChassis*ZChassis;

IXXSuspFL = IXXSuspFL - MSuspFL*(YSuspFL^2 + ZSuspFL^2);
IYYSuspFL = IYYSuspFL - MSuspFL*(XSuspFL^2 + ZSuspFL^2);
IZZSuspFL = IZZSuspFL - MSuspFL*(XSuspFL^2 + YSuspFL^2);
IXYSuspFL = IXYSuspFL - MSuspFL*XSuspFL*YSuspFL;
IXZSuspFL = IXZSuspFL - MSuspFL*XSuspFL*ZSuspFL;
IYZSuspFL = IYZSuspFL - MSuspFL*YSuspFL*ZSuspFL;

IXXSuspFR = IXXSuspFR - MSuspFR*(YSuspFR^2 + ZSuspFR^2);
IYYSuspFR = IYYSuspFR - MSuspFR*(XSuspFR^2 + ZSuspFR^2);
IZZSuspFR = IZZSuspFR - MSuspFR*(XSuspFR^2 + YSuspFR^2);
IXYSuspFR = IXYSuspFR - MSuspFR*XSuspFR*YSuspFR;
IXZSuspFR = IXZSuspFR - MSuspFR*XSuspFR*ZSuspFR;
IYZSuspFR = IYZSuspFR - MSuspFR*YSuspFR*ZSuspFR;

IXXSuspRL = IXXSuspRL - MSuspRL*(YSuspRL^2 + ZSuspRL^2);
IYYSuspRL = IYYSuspRL - MSuspRL*(XSuspRL^2 + ZSuspRL^2);
IZZSuspRL = IZZSuspRL - MSuspRL*(XSuspRL^2 + YSuspRL^2);
IXYSuspRL = IXYSuspRL - MSuspRL*XSuspRL*YSuspRL;
IXZSuspRL = IXZSuspRL - MSuspRL*XSuspRL*ZSuspRL;
IYZSuspRL = IYZSuspRL - MSuspRL*YSuspRL*ZSuspRL;

IXXSuspRR = IXXSuspRR - MSuspRR*(YSuspRR^2 + ZSuspRR^2);
IYYSuspRR = IYYSuspRR - MSuspRR*(XSuspRR^2 + ZSuspRR^2);
IZZSuspRR = IZZSuspRR - MSuspRR*(XSuspRR^2 + YSuspRR^2);
IXYSuspRR = IXYSuspRR - MSuspRR*XSuspRR*YSuspRR;
IXZSuspRR = IXZSuspRR - MSuspRR*XSuspRR*ZSuspRR;
IYZSuspRR = IYZSuspRR - MSuspRR*YSuspRR*ZSuspRR;

IXXSuspF = IXXSuspF - MSuspF*(YSuspF^2 + ZSuspF^2);
IYYSuspF = IYYSuspF - MSuspF*(XSuspF^2 + ZSuspF^2);
IZZSuspF = IZZSuspF - MSuspF*(XSuspF^2 + YSuspF^2);
IXYSuspF = IXYSuspF - MSuspF*XSuspF*YSuspF;
IXZSuspF = IXZSuspF - MSuspF*XSuspF*ZSuspF;
IYZSuspF = IYZSuspF - MSuspF*YSuspF*ZSuspF;

% IXXSuspR = IXXSuspR - MSuspR*(YSuspR^2 + ZSuspR^2);
% IYYSuspR = IYYSuspR - MSuspR*(XSuspR^2 + ZSuspR^2);
% IZZSuspR = IZZSuspR - MSuspR*(XSuspR^2 + YSuspR^2);
% IXYSuspR = IXYSuspR - MSuspR*XSuspR*YSuspR;
% IXZSuspR = IXZSuspR - MSuspR*XSuspR*ZSuspR;
% IYZSuspR = IYZSuspR - MSuspR*YSuspR*ZSuspR;

IXXSuspR = 292.6396081647836;
IYYSuspR = 292.6396081647836;
IZZSuspR = 292.6396081647836;
IXYSuspR = 0.0;
IXZSuspR = 0.0;
IYZSuspR = 0.0;

IXXSteering = IXXSteering - MSteering*(YSteering^2 + ZSteering^2);
IYYSteering = IYYSteering - MSteering*(XSteering^2 + ZSteering^2);
IZZSteering = IZZSteering - MSteering*(XSteering^2 + YSteering^2);
IXYSteering = IXYSteering - MSteering*XSteering*YSteering;
IXZSteering = IXZSteering - MSteering*XSteering*ZSteering;
IYZSteering = IYZSteering - MSteering*YSteering*ZSteering;

IXXPowertrain = IXXPowertrain - MPowertrain*(YPowertrain^2 + ZPowertrain^2);
IYYPowertrain = IYYPowertrain - MPowertrain*(XPowertrain^2 + ZPowertrain^2);
IZZPowertrain = IZZPowertrain - MPowertrain*(XPowertrain^2 + YPowertrain^2);
IXYPowertrain = IXYPowertrain - MPowertrain*XPowertrain*YPowertrain;
IXZPowertrain = IXZPowertrain - MPowertrain*XPowertrain*ZPowertrain;
IYZPowertrain = IYZPowertrain - MPowertrain*YPowertrain*ZPowertrain;

% 
IXXChassis = IXXChassis + (MChassis)*((YChassis - Y)^2+(ZChassis - Z)^2);
IYYChassis = IYYChassis + (MChassis)*((XChassis - X)^2+(ZChassis - Z)^2);
IZZChassis = IZZChassis + (MChassis)*((XChassis - X)^2+(YChassis - Y)^2);
IXYChassis = IXYChassis + (MChassis)*(XChassis - X)*(YChassis - Y);
IXZChassis = IXZChassis + (MChassis)*(XChassis - X)*(ZChassis - Z);
IYZChassis = IYZChassis + (MChassis)*(YChassis - Y)*(ZChassis - Z);

IXXSuspFL = IXXSuspFL + (MSuspFL/2)*((YSuspFL - Y)^2+(ZSuspFL - Z)^2);
IYYSuspFL = IYYSuspFL + (MSuspFL/2)*((XSuspFL - X)^2+(ZSuspFL - Z)^2);
IZZSuspFL = IZZSuspFL + (MSuspFL/2)*((XSuspFL - X)^2+(YSuspFL - Y)^2);
IXYSuspFL = IXYSuspFL + (MSuspFL/2)*(XSuspFL - X)*(YSuspFL - Y);
IXZSuspFL = IXZSuspFL + (MSuspFL/2)*(XSuspFL - X)*(ZSuspFL - Z);
IYZSuspFL = IYZSuspFL + (MSuspFL/2)*(YSuspFL - Y)*(ZSuspFL - Z);

IXXSuspFR = IXXSuspFR + (MSuspFR/2)*((YSuspFR - Y)^2+(ZSuspFR - Z)^2);
IYYSuspFR = IYYSuspFR + (MSuspFR/2)*((XSuspFR - X)^2+(ZSuspFR - Z)^2);
IZZSuspFR = IZZSuspFR + (MSuspFR/2)*((XSuspFR - X)^2+(YSuspFR - Y)^2);
IXYSuspFR = IXYSuspFR + (MSuspFR/2)*(XSuspFR - X)*(YSuspFR - Y);
IXZSuspFR = IXZSuspFR + (MSuspFR/2)*(XSuspFR - X)*(ZSuspFR - Z);
IYZSuspFR = IYZSuspFR + (MSuspFR/2)*(YSuspFR - Y)*(ZSuspFR - Z);

IXXSuspRL = IXXSuspRL + (MSuspRL/2)*((YSuspRL - Y)^2+(ZSuspRL - Z)^2);
IYYSuspRL = IYYSuspRL + (MSuspRL/2)*((XSuspRL - X)^2+(ZSuspRL - Z)^2);
IZZSuspRL = IZZSuspRL + (MSuspRL/2)*((XSuspRL - X)^2+(YSuspRL - Y)^2);
IXYSuspRL = IXYSuspRL + (MSuspRL/2)*(XSuspRL - X)*(YSuspRL - Y);
IXZSuspRL = IXZSuspRL + (MSuspRL/2)*(XSuspRL - X)*(ZSuspRL - Z);
IYZSuspRL = IYZSuspRL + (MSuspRL/2)*(YSuspRL - Y)*(ZSuspRL - Z);

IXXSuspRR = IXXSuspRR + (MSuspRR/2)*((YSuspRR - Y)^2+(ZSuspRR - Z)^2);
IYYSuspRR = IYYSuspRR + (MSuspRR/2)*((XSuspRR - X)^2+(ZSuspRR - Z)^2);
IZZSuspRR = IZZSuspRR + (MSuspRR/2)*((XSuspRR - X)^2+(YSuspRR - Y)^2);
IXYSuspRR = IXYSuspRR + (MSuspRR/2)*(XSuspRR - X)*(YSuspRR - Y);
IXZSuspRR = IXZSuspRR + (MSuspRR/2)*(XSuspRR - X)*(ZSuspRR - Z);
IYZSuspRR = IYZSuspRR + (MSuspRR/2)*(YSuspRR - Y)*(ZSuspRR - Z);

IXXSuspF = IXXSuspF + (MSuspF/2)*((YSuspF - Y)^2+(ZSuspF - Z)^2);
IYYSuspF = IYYSuspF + (MSuspF/2)*((XSuspF - X)^2+(ZSuspF - Z)^2);
IZZSuspF = IZZSuspF + (MSuspF/2)*((XSuspF - X)^2+(YSuspF - Y)^2);
IXYSuspF = IXYSuspF + (MSuspF/2)*(XSuspF - X)*(YSuspF - Y);
IXZSuspF = IXZSuspF + (MSuspF/2)*(XSuspF - X)*(ZSuspF - Z);
IYZSuspF = IYZSuspF + (MSuspF/2)*(YSuspF - Y)*(ZSuspF - Z);

IXXSuspR = IXXSuspR + (MSuspR/2)*((YSuspR - Y)^2+(ZSuspR - Z)^2);
IYYSuspR = IYYSuspR + (MSuspR/2)*((XSuspR - X)^2+(ZSuspR - Z)^2);
IZZSuspR = IZZSuspR + (MSuspR/2)*((XSuspR - X)^2+(YSuspR - Y)^2);
IXYSuspR = IXYSuspR + (MSuspR/2)*(XSuspR - X)*(YSuspR - Y);
IXZSuspR = IXZSuspR + (MSuspR/2)*(XSuspR - X)*(ZSuspR - Z);
IYZSuspR = IYZSuspR + (MSuspR/2)*(YSuspR - Y)*(ZSuspR - Z);

IXXSteering = IXXSteering + (MSteering/2)*((YSteering - Y)^2+(ZSteering - Z)^2);
IYYSteering = IYYSteering + (MSteering/2)*((XSteering - X)^2+(ZSteering - Z)^2);
IZZSteering = IZZSteering + (MSteering/2)*((XSteering - X)^2+(YSteering - Y)^2);
IXYSteering = IXYSteering + (MSteering/2)*(XSteering - X)*(YSteering - Y);
IXZSteering = IXZSteering + (MSteering/2)*(XSteering - X)*(ZSteering - Z);
IYZSteering = IYZSteering + (MSteering/2)*(YSteering - Y)*(ZSteering - Z);

IXXPowertrain = IXXPowertrain + (MPowertrain/2)*((YPowertrain - Y)^2+(ZPowertrain - Z)^2);
IYYPowertrain = IYYPowertrain + (MPowertrain/2)*((XPowertrain - X)^2+(ZPowertrain - Z)^2);
IZZPowertrain = IZZPowertrain + (MPowertrain/2)*((XPowertrain - X)^2+(YPowertrain - Y)^2);
IXYPowertrain = IXYPowertrain + (MPowertrain/2)*(XPowertrain - X)*(YPowertrain - Y);
IXZPowertrain = IXZPowertrain + (MPowertrain/2)*(XPowertrain - X)*(ZPowertrain - Z);
IYZPowertrain = IYZPowertrain + (MPowertrain/2)*(YPowertrain - Y)*(ZPowertrain - Z);

IXX = (IXXChassis + IXXSuspFL + IXXSuspFR + IXXSuspRL + IXXSuspRR + IXXSuspF + IXXSuspR + IXXSteering + IXXPowertrain)/1e6;
IYY = (IYYChassis + IYYSuspFL + IYYSuspFR + IYYSuspRL + IYYSuspRR + IYYSuspF + IYYSuspR + IYYSteering + IYYPowertrain)/1e6;
IZZ = (IZZChassis + IZZSuspFL + IZZSuspFR + IZZSuspRL + IZZSuspRR + IZZSuspF + IZZSuspR + IZZSteering + IZZPowertrain)/1e6;
IXY = (IXYChassis + IXYSuspFL + IXYSuspFR + IXYSuspRL + IXYSuspRR + IXYSuspF + IXYSuspR + IXYSteering + IXYPowertrain)/1e6;
IXZ = (IXZChassis + IXZSuspFL + IXZSuspFR + IXZSuspRL + IXZSuspRR + IXZSuspF + IXZSuspR + IXZSteering + IXZPowertrain)/1e6;
IYZ = (IYZChassis + IYZSuspFL + IYZSuspFR + IYZSuspRL + IYZSuspRR + IYZSuspF + IYZSuspR + IYZSteering + IYZPowertrain)/1e6;

X = X/1000;
Y = Y/1000;
Z = Z/1000;