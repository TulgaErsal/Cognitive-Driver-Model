% execute_test.m - Load in simulation parameter file for UM autonomous code and run
% appropriate set

function imDone=execute_test(paramFile,startIndex,nRun)

% load parameter file
eval(['load ' paramFile]);

[m,n]=size(runParams);

if startIndex>0 && startIndex <=m && nRun<=m,
    
    for i=startIndex:min(startIndex+nRun-1,m),
        
        tmpParams=runParams{i,:};
        
        imDone=MAIN_function(tmpParams{1},tmpParams{2},tmpParams{3},tmpParams{4},tmpParams{5},tmpParams{6},tmpParams{7},tmpParams{8},tmpParams{9},tmpParams{10},tmpParams{11},tmpParams{12},tmpParams{13},tmpParams{14},tmpParams{15},tmpParams{16},tmpParams{17},tmpParams{18},tmpParams{19},tmpParams{20});
        
        % Commands for spawning another instance of Matlab to handle
        % co-simulation
        
        %functionCommandString=['imDone=MAIN_function(tmpParams{1},tmpParams{2},tmpParams{3},tmpParams{4},tmpParams{5},tmpParams{6},tmpParams{7},tmpParams{8},tmpParams{9},tmpParams{10},tmpParams{11},tmpParams{12},tmpParams{13},tmpParams{14},tmpParams{15},tmpParams{16},tmpParams{17},tmpParams{18},tmpParams{19},tmpParams{20})'];
        %systemCommandString=['matlab -automation -r "' functionCommandString '" &'];
        %system(systemCommandString);
    
    end;
    
    imDone = 1;
    
else
    disp('Problem with input parameters');
end;
