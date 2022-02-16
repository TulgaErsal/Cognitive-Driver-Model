function CP_Writetxt(PTS, filename)

fid = fopen(filename, 'wt');

fprintf(fid, '%d\n', 1);
fprintf(fid, '%d\n', length(PTS(:,1)));
fprintf(fid, '%d\n', 0);

for i = 1:length(PTS)
    fprintf(fid, '%g %g\n', PTS(i, :));
end

fclose(fid);