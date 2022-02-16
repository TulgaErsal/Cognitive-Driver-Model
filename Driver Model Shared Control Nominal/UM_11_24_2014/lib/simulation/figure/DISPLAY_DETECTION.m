function DISPLAY_DETECTION(VP, PTS, Color)

X = PTS(:,1);
Y = PTS(:,2);

hold on;
plot(X,Y,'Color',Color,'LineWidth',2)
plot([VP(1), X(1)],[VP(2),Y(1)],'--','Color',Color,'LineWidth',2)
plot([VP(1), X(end)],[VP(2),Y(end)],'--','Color', Color,'LineWidth',2)