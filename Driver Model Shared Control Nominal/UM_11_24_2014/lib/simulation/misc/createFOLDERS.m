function [SIM, ERROR] = createFOLDERS(INPUT)

ERROR = false;

%% check inputs
% foldername
if ~isfield(INPUT, 'foldername')
    disp('error: The field "foldername" is required')
    ERROR = true;
else
    if ~ischar(INPUT.foldername)
        disp('error: foldername should be a char array')
        ERROR = true;
    end
end

% rootpath
if ~isfield(INPUT, 'rootpath')
    disp('error: The field "rootpath" is required')
    ERROR = true;
else
    if ~ischar(INPUT.rootpath)
        disp('error: rootpath should be a char array')
        ERROR = true;
    end
end

if ERROR == true
    SIM = [];
    return;
end

%% create a folder to save the simulation results
logfolder = [INPUT.rootpath, '/', INPUT.foldername];

if exist(logfolder, 'dir') ~= 7
    mkdir(logfolder)
% else
    %     disp(['The specified folder ', INPUT.foldername, ' exists.'])
    %     disp('This folder may contain previous simulation results.')

%     pathCell = regexp(INPUT.rootpath, pathsep, 'split');
%     if ispc  % Windows is not case-sensitive
%         onPath = any(strcmpi(INPUT.foldername, pathCell));
%     else
%         onPath = any(strcmp(INPUT.foldername, pathCell));
%     end
%     if onPath
%         rmpath(INPUT.foldername)
%     end


% used to do this...
%     rmdir(logfolder,'s')
%     mkdir(logfolder)


    % CONFIRM = input('Enter "y" to continue the simulation? \n', 's');
    % if ~ strcmp(CONFIRM, 'y')
    %     ERROR = true;
    %     return;
    % end
end
addpath(logfolder, '-begin');

%% create a folder to store files for debugging
errorfolder = [logfolder, '/Error'];
createFOLDER(errorfolder);

fname = [errorfolder, '/error.txt'];
if exist(fname, 'file') == 2
    fid = fopen(fname, 'wt');
    fclose(fid);
    delete(fname);
end

%% create a folder to store optimal control problem formulations
fmlfolder = [logfolder, '/Formulation'];
createFOLDER(fmlfolder);

%% create a folder to convex partition files
cvxfolder = [logfolder, '/CVXPartition'];
createFOLDER(cvxfolder);

%% create a folder to store the solution guess for steering-towards-goal
guessfolder = [INPUT.rootpath, '/Results/Solution Guess'];
createFOLDER(guessfolder);

%% create a folder to store control commands calculated in previous step
cmdfolder = [INPUT.rootpath, '/Results/Commands'];
createFOLDER(cmdfolder);

%%
SIM.logfolder 	= logfolder;
SIM.errorfolder = errorfolder;
SIM.fmlfolder   = fmlfolder;
SIM.cvxfolder   = cvxfolder;
SIM.guessfolder = guessfolder;
SIM.cmdfolder   = cmdfolder;
