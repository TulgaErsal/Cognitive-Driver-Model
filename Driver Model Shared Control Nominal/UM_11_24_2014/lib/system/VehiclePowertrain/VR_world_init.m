
Parameter_load;
myworld = vrworld('Environ_testing2.wrl');
open(myworld);
f = vrfigure(myworld);
set(f, 'Name', 'Virtual Driving interface');
set(f, 'NavPanel', 'none');
set(f, 'Position', [10 200 1215 750]);

TrialNum = 0;

