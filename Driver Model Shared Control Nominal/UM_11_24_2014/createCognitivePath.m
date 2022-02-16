function pathMatrix=createCognitivePath(fname,firstCol,x,y,z)

% createCognitivePath.m
% File needs to have 5 doubles per record
% Waypoint/time x y z cumulativeDistance
% firstCol,x,y,z need to be row vectors

% TEMP:  Setting vertical distance to zero for now since 
% UM code doesn't use.

z=z*0;

% Compute cumulative distance along path

cumulDist=[0;cumsum(sqrt(diff(x).^2+diff(y).^2+diff(z).^2))];

% Data rearranged into cognitive model coordinate system

% pathMatrix=[firstCol; x; -z; y; [0 cumulDist]];
pathMatrix=[firstCol, x, -z, y, cumulDist]';  % y and z are flipped and z is in the opposite direction of the new y
[m,n]=size(pathMatrix);

newPathMatrix=reshape(pathMatrix,m*n,1);

fid=fopen(fname,'w','ieee-be');
fwrite(fid,newPathMatrix,'float64');
fclose(fid);

% There should be a Matlab file in the stuff you got from me which is called something like create_cognitive_path.m.  
% It has some comments (I think) describing the structure of the path file and performing the coordinate transformation 
% between a path in Jiechao’s coordinate system to the internal coordinate system of the cognitive model.

% If I remember right, the path file is basically a file of double values.  Each group of five doubles specifies a waypoint 
% with t