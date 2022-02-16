% actr_startup.m - Code to start the Java ACT-R environment in Matlab,
% load a model, alter scenario parameters, and then kick it off

% Filename of ACT-R model
% myModel = strcat(INPUT.baseFolder,'\ACT-R\driving\Driving_utilChange.actr');
% 
% % Add ACT-R base code to Java class path
% temp_string_1 = strcat(INPUT.baseFolder,'\ACT-R\ACT-R\ACT-R.jar');
% javaaddpath(temp_string_1);
% 
% % Add ACT-R driver model code to Java class path
% temp_string_2 = strcat(INPUT.baseFolder,'\ACT-R\new_driving\new_driving.jar');
% javaaddpath(temp_string_2);
% 
% % Import driving package
% 
% import actr.tasks.driving.*

% Create new instance of Scenario and override necessary values

currentScenario=Scenario();

currentScenario.timeDelay=INPUT.SENSING_DELAY_cog;

currentScenario.simcarSpeed=INPUT.U_INIT;
currentScenario.outputBaseName=INPUT.foldername;

currentScenario.autocarSpeed=INPUT.U_INIT;
currentScenario.autocarMode=1;

currentScenario.autocarStraightSeg = 100;   % autocarMode 0 options
currentScenario.autocarPathAmp = 10;        % autocarMode 0 options
currentScenario.autocarPathPeriod = 500;    % autocarMode 0 options

currentScenario.pathFile=INPUT.cogPathFile; % autocarMode 1 option

currentScenario.externalSimCar=true;        % controls whether co-simulation is occurring

currentScenario.thwFollow=2; % far eye point- aggressivness parameter, lower is more (1 is default in paper), it is in seconds how far ahead into the 
currentScenario.autocarStartX=currentScenario.thwFollow*currentScenario.autocarSpeed;

% huck fixed on 8/13/2015 - seems to have been a bug
cognitiveModel.nearPoint=min(10,max(3,currentScenario.autocarStartX/2));  %want far point to be further away than this,
% currentScenario.nearPoint=min(10,max(3,currentScenario.autocarStartX/2));  %want far point to be further away than this,
% huck fixed on 8/13/2015 - seems to have been a bug - changed back to
% original


% Create instance of MatlabInterface
cognitiveModel=MatlabInterface(currentScenario);

% % Set shared control parameter values  (REMOVE BEFORE DELIVERY TO JPL)
% 
% % useSharedControl=true;
% sharedThreatLow=0;      % degrees
% sharedThreatHigh=3;     % degrees
% 
% % Set Alion distraction values 
% cognitiveModel.useCogDelay=false;
% alionScenario=1;
% 
% %Base                   The Base set represents a typical operator using a single asset under normal conditions
% %MultiAsset             More likely to look at Mission area from a different area (checking additional asset)
% %AssetParameters        More likely to look at Status area from a different area due to additional asset parameters (e.g. Mission package functions)
% %AssetPositioning       More likely to look at Position area from a different area to mimic sensitive asset positioning during mission
% %PoorMap                Look longer at the Position (map)  and look more frequently when already looking to mimic low contrast or confusing map information
% %SingleUrbanMovement    This tasks involves moving a single robotic asset through an urban area.
% %SingleUrbanOverwatch   The robotic asset is providing overwatch for another element in an urban environment.
% 
% 
% %                 Frequency Average    SD       Min      Max
% alionScenarioData=[ 0.11     1.022    0.656    0.206    5.807;
%                     0.167    1.81     1.514    0.239    16.373;
%                     0.199    1.056    0.71     0.251    7.239;
%                     0.191    1.518    1.043    0.273    11.599;
%                     0.131    1.941    1.803    0.24     24.927;
%                     0.156    1.164    0.707    0.256    8.11;
%                     0.117    1.734    1.499    0.249    15.572];
% 
% alionDistractionFrequency=alionScenarioData(alionScenario,1);
% alionDistractionMean=alionScenarioData(alionScenario,2);
% alionDistractionSD=alionScenarioData(alionScenario,3);
% 
% cognitiveModel.cogDelayFreq=alionDistractionFrequency;
% 
% % Startup MatlabInterface
% cognitiveModel.startup(myModel);

