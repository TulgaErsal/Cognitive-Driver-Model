function createFOLDER(fp)

if exist(fp, 'dir') ~= 7
    mkdir(fp)
else
    a = dir(fp);
    % delete files from previous simulation
    if ~isempty(a)
        delete([fp, '/*.png'])
        delete([fp, '/*.fig'])
        delete([fp, '/*.mat'])
        delete([fp, '/*.txt'])
    end
end
addpath(fp,'-begin');