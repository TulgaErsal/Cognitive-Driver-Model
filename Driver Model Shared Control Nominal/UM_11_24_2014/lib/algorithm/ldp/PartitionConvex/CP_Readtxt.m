function vertices = CP_Readtxt(filename)

fid = fopen(filename, 'rt');

poly_num = fscanf(fid, '%d\n', 1);

vert_num = nan*ones(1, poly_num);

for i = 1:poly_num
    vert_num(i) = fscanf(fid, '%d\n', 1);
    fscanf(fid, '%d\n', 1); % number of holes
    
    vertices{i} = fscanf(fid, '%g %g\n', [2, vert_num(i)]); %#ok<AGROW>
    vertices{i} = vertices{i}'; %#ok<AGROW>
end

fclose(fid);
