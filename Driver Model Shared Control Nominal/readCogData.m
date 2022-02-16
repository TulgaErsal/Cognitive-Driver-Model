function data = readCogData(filename)
% Read in data written out by driver cognitive model

% Open file
fp=fopen(filename);

if fp == -1,

% If can't open file, display error message

disp('Error opening file');
data=[];

else

% Read in data and reformat 

data=fscanf(fp,'%f');

[m,n]=size(data);

data=reshape(data,14,m/14);

end;

% Close file
fclose(fp);

% Data variable definitions
% Row		Variable
%  1		t
%  2		simCar x position
%  3		simCar z position
%  4		simCar x heading
%  5		simCar z heading
%  6		simCar speed (m/s)
%  7		simCar cognitive steering angle (requires conversion)
%  8		simCar accelerator 	(fraction of max value)
%  9		simCar braking	   	(fraction of max value)
% 10		autoCar x position 	(Represents far eye point)
% 11		autoCar z position	(Represents far eye point)
% 12		autoCar x heading
% 13		autoCar z heading
% 14		autoCar speed (m/s)