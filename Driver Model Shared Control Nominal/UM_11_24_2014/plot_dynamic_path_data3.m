% analize path data

X = [];
Y = [];

C = summer;
cs = 10;

a = 1;

for n = 1:1:length(PATH_data.COG_path.X)
    
%     if ~isempty(PATH_data.X{n}) && ~isempty(PATH_data.Y{n})
        X_new = PATH_data.COG_path.X{n};
        Y_new = PATH_data.COG_path.Y{n};
        X = [X, X_new];
        Y = [Y, PATH_data.Y{n}];
        if (a+(a-1)*cs) > 64
            a = 1;
        end
        % plot the path
%         figure(1);
        if ~no_steering
            ax(1)=subplot(1,2,1);
        end
        plot(X_new,Y_new,'Color',C((a+(a-1)*cs),:),'linewidth',3);
        hold on
%         pause;
        if n ~= length(PATH_data.X)
            a = a + 1;
        end
%     end
end

