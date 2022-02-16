clear all; close all; clc;

% parameters
MAP_NAME    = 'MAP_2OB';
MAP_ORIGIN  = [-700, -200];
% MAP_WIDTH   = 800;
% MAP_LENGTH  = 800;
MAP_WIDTH   = 1500;
MAP_LENGTH  = 1200;

% boundary
MAP_BDY = MAP_RECTANGLE(MAP_ORIGIN, MAP_WIDTH, MAP_LENGTH);

% obstacles
CNT_OBD = 0;

% In case of NO obstacles in the path use the following two lines
CNT_OBD = CNT_OBD + 1;
MAP_OBS(CNT_OBD).PTS = [];

% CNT_OBD = CNT_OBD + 1;
% MAP_OBS(CNT_OBD).PTS  = MAP_RECTANGLE([310, 300], 100, 10);
% 
% CNT_OBD = CNT_OBD + 1;
% MAP_OBS(CNT_OBD).PTS  = MAP_RECTANGLE([390, 430], 100, 10);

% display map
figure(1)
hold on;
axis equal;
xlabel('x (m)')
ylabel('y (m)')

DISPLAY_MAP(MAP_BDY, MAP_OBS)

MAP.NAME = MAP_NAME;
MAP.BDY  = MAP_BDY;
MAP.OBS  = MAP_OBS;

save([MAP_NAME, '.mat'], 'MAP')
clear all
