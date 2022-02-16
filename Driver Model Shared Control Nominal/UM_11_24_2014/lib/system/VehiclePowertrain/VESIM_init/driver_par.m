% Parameters of the driver speed controller and constants

Kp_v    = 30;		  			% Cruise-controller's parameter
Ti_v    = 2.5 ;		  			% Cruise-controller's parameter
Tt_v    = Ti_v/8.;				% Cruise-controller's parameter
Gain_v  = 70;				    % Cruise-controller's parameter
MIN_TH  = 0;                    % Cruise-controller's parameter

rpm2rads = 2*pi/60;         % Conversion from rpm to rad/s
ms2mph   = 2.23694;			% Conversion from m/s to mph
