% Adams / MATLAB Interface - Release 2012.1.2
global ADAMS_sysdir; % used by setup_rtw_for_adams.m
global ADAMS_host; % used by start_adams_daemon.m
machine=computer;
datestr(now)
if strcmp(machine, 'SOL2')
   arch = 'solaris32';
elseif strcmp(machine, 'SOL64')
   arch = 'solaris32';
elseif strcmp(machine, 'GLNX86')
   arch = 'linux32';
elseif strcmp(machine, 'GLNXA64')
   arch = 'linux64';
elseif strcmp(machine, 'PCWIN')
   arch = 'win32';
elseif strcmp(machine, 'PCWIN64')
   arch = 'win64';
else
   disp( '%%% Error : Platform unknown or unsupported by Adams/Controls.' ) ;
   arch = 'unknown_or_unsupported';
   return
end
if strcmp(arch,'win64')
   [flag, topdir]=system('adams2012_x64 -top');
else
   [flag, topdir]=system('adams2012 -top');
end
if flag == 0
  temp_str=strcat(topdir, '/controls/', arch);
  addpath(temp_str)
  temp_str=strcat(topdir, '/controls/', 'matlab');
  addpath(temp_str)
  temp_str=strcat(topdir, '/controls/', 'utils');
  addpath(temp_str)
  ADAMS_sysdir = strcat(topdir, '');
else
  addpath( 'C:\MSC~1.SOF\ADAMS_~1\2012\controls/win64' ) ;
  addpath( 'C:\MSC~1.SOF\ADAMS_~1\2012\controls/matlab' ) ;
  addpath( 'C:\MSC~1.SOF\ADAMS_~1\2012\controls/utils' ) ;
  ADAMS_sysdir = 'C:\MSC~1.SOF\ADAMS_~1\2012\' ;
end
ADAMS_exec = 'acar_solver' ;
ADAMS_host = '' ;
ADAMS_cwd ='C:\Users\James.poplawski\Documents\MATLAB\ADAMS Testing'  ;
ADAMS_prefix = 'PLANT_step' ;
ADAMS_static = 'no' ;
ADAMS_solver_type = 'C++' ;
if exist([ADAMS_prefix,'.adm']) == 0
   disp( ' ' ) ;
   disp( '%%% Warning : missing ADAMS plant model file(.adm) for Co-simulation or Function Evaluation.' ) ;
   disp( '%%% If necessary, please re-export model files or copy the exported plant model files into the' ) ;
   disp( '%%% working directory.  You may disregard this warning if the Co-simulation/Function Evaluation' ) ;
   disp( '%%% is TCP/IP-based (running Adams on another machine), or if setting up MATLAB/Real-Time Workshop' ) ;
   disp( '%%% for generation of an External System Library.' ) ;
   disp( ' ' ) ;
end
ADAMS_init = 'file/command=PLANT_step_controls.acf' ;
ADAMS_inputs  = 'powertrain_modified.Axle_Torque!modified_humvee_steering.Steering_Motion_from_Cntl_System' ;
ADAMS_outputs = 'testrig.body_disp_x!testrig.body_disp_y!testrig.body_disp_z!testrig.body_velocity_x!testrig.body_velocity_y!testrig.body_velocity_z!testrig.body_acce_x!testrig.body_acce_y!testrig.body_acce_z!testrig.body_roll_angle!testrig.body_roll_rate!testrig.body_pitch_angle!testrig.body_pitch_rate!testrig.body_yaw_angle!testrig.body_yaw_rate!testrig.body_yaw_acce!testrig.body_side_slip_angle!testrig.steering_wheel_angle!testrig.steering_wheel_velocity!testrig.steering_wheel_acce!testrig.steering_wheel_torque!testrig.steering_rack_travel!testrig.engine_speed!testrig.var_dist_travel!testrig.vas_steering_demand.variable!testrig.vas_throttle_demand.variable!testrig.vas_brake_demand.variable!testrig.vas_gear_demand.variable!testrig.vas_clutch_demand.variable!handling_tire_front_geometry.lft_tire_rolling_radius!handling_tire_front_geometry.rgt_tire_rolling_radius!handling_tire_front_geometry.lft_whl_omega!handling_tire_front_geometry.rgt_whl_omega!handling_tire_rear_geometry.lft_tire_rolling_radius!handling_tire_rear_geometry.rgt_tire_rolling_radius!handling_tire_rear_geometry.lft_whl_omega!handling_tire_rear_geometry.rgt_whl_omega!modified_front_suspension.l_spr_disp!modified_front_suspension.r_spr_disp!modified_front_suspension.l_spr_vel!modified_front_suspension.r_spr_vel!modified_rear_suspension.l_spr_disp!modified_rear_suspension.r_spr_disp!modified_rear_suspension.l_spr_vel!modified_rear_suspension.r_spr_vel' ;
ADAMS_pinput = 'powertrain_modified.Drive_Axle_Torque!modified_humvee_steering.Steering_Wheel_Motion' ;
ADAMS_poutput = 'testrig.plant_output_body_info!testrig.plant_output_steering_info!testrig.plant_output_other!testrig.plant_output_driver_demands!handling_tire_front_geometry.left_tire_rolling_radius!handling_tire_front_geometry.right_tire_rolling_radius!handling_tire_front_geometry.left_whl_omega!handling_tire_front_geometry.right_whl_omega!handling_tire_rear_geometry.left_tire_rolling_radius!handling_tire_rear_geometry.right_tire_rolling_radius!handling_tire_rear_geometry.left_whl_omega!handling_tire_rear_geometry.right_whl_omega!modified_front_suspension.left_spr_disp!modified_front_suspension.right_spr_disp!modified_front_suspension.left_spr_vel!modified_front_suspension.right_spr_vel!modified_rear_suspension.left_spr_disp!modified_rear_suspension.right_spr_disp!modified_rear_suspension.left_spr_vel!modified_rear_suspension.right_spr_vel' ;
ADAMS_uy_ids  = [
                   296
                   297
                   9
                   10
                   11
                   12
                   13
                   14
                   15
                   16
                   17
                   23
                   24
                   21
                   22
                   18
                   19
                   20
                   27
                   31
                   32
                   33
                   30
                   28
                   35
                   8
                   79
                   81
                   83
                   85
                   87
                   184
                   185
                   186
                   187
                   264
                   265
                   266
                   267
                   268
                   269
                   270
                   271
                   272
                   273
                   274
                   275
                ] ;
ADAMS_mode   = 'non-linear' ;
tmp_in  = decode( ADAMS_inputs  ) ;
tmp_out = decode( ADAMS_outputs ) ;
disp( ' ' ) ;
disp( '%%% INFO : ADAMS plant actuators names :' ) ;
disp( [int2str([1:size(tmp_in,1)]'),blanks(size(tmp_in,1))',tmp_in] ) ;
disp( '%%% INFO : ADAMS plant sensors   names :' ) ;
disp( [int2str([1:size(tmp_out,1)]'),blanks(size(tmp_out,1))',tmp_out] ) ;
disp( ' ' ) ;
clear tmp_in tmp_out ;
% Adams / MATLAB Interface - Release 2012.1.2
