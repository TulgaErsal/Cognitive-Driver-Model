function FIGURE_FORMULATION(OCP, TITLE, LENGTH, COLORS)

figure
hold on
% axis equal
title(TITLE)
if ~isempty(LENGTH)
    axis([-LENGTH-10, LENGTH+10, -10, LENGTH+10])
end

if OCP.OCPType == 1
    for j = 1:length(OCP.SecType)
        if     OCP.SecType(j) == 1 || OCP.SecType(j) == 0
            patch([OCP.Points(j, 1), OCP.Points(j, 3), OCP.Points(j, 5)], ...
                  [OCP.Points(j, 2), OCP.Points(j, 4), OCP.Points(j, 6)], ...
                  COLORS(j,:))
        elseif OCP.SecType(j) == -1
            AA1 = linspace(OCP.Polar(j, 1), OCP.Polar(j, 2),100);
            RR1 = min(OCP.Polar(j, 3:4));
            XX1 = RR1*cos(AA1);
            YY1 = RR1*sin(AA1);
            patch([XX1, OCP.Points(j, 5)], [YY1, OCP.Points(j, 6)], COLORS(j,:));
        end
    end
elseif OCP.OCPType == 2
    A_SEQ = linspace(OCP.P1_Angle(1), OCP.P1_Angle(2),100);
    patch([OCP.P1_Radius*cos(A_SEQ), 0], [OCP.P1_Radius*sin(A_SEQ), 0], COLORS(1,:));

    for j = 1:length(OCP.SecType)
        if     OCP.SecType(j) == 1 || OCP.SecType(j) == 0
            if norm(OCP.Points(j, 5:6)) < 1
                AA = linspace(OCP.Polar(j, 2), OCP.Polar(j, 1),100);
                XX = OCP.P1_Radius*cos(AA);
                YY = OCP.P1_Radius*sin(AA);
                patch([OCP.Points(j, 1), OCP.Points(j, 3), XX], ...
                      [OCP.Points(j, 2), OCP.Points(j, 4), YY], ...
                      COLORS(j+1,:))
            else
                patch([OCP.Points(j, 1), OCP.Points(j, 3), OCP.Points(j, 5)], ...
                      [OCP.Points(j, 2), OCP.Points(j, 4), OCP.Points(j, 6)], ...
                      COLORS(j+1,:))
            end
        elseif OCP.SecType(j) == -1
            AA1 = linspace(OCP.Polar(j, 1), OCP.Polar(j, 2),100);
            RR1 = min(OCP.Polar(j, 3:4));
            XX1 = RR1*cos(AA1);
            YY1 = RR1*sin(AA1);

            if norm(OCP.Points(j, 5:6)) < 1
                AA2 = linspace(OCP.Polar(j, 2), OCP.Polar(j, 1),100);
                XX2 = OCP.P1_Radius*cos(AA2);
                YY2 = OCP.P1_Radius*sin(AA2);
                patch([XX1, XX2], [YY1, YY2], COLORS(j+1,:));
            else
                patch([XX1, OCP.Points(j, 5)], [YY1, OCP.Points(j, 6)], COLORS(j+1,:));
            end
        end
    end
elseif OCP.OCPType == 3
    for j = 1:length(OCP.SecType)
        patch([OCP.Points(j, 1), OCP.Points(j, 3), OCP.Points(j, 5)], ...
              [OCP.Points(j, 2), OCP.Points(j, 4), OCP.Points(j, 6)], ...
              COLORS(j,:))
    end
elseif OCP.OCPType == 4 || OCP.OCPType == 5
    for j = 1:length(OCP.SecType)
        patch(OCP.Points(OCP.Indexes{OCP.PolySeq(j)}, 1), ...
              OCP.Points(OCP.Indexes{OCP.PolySeq(j)}, 2), ...
              COLORS(j,:))
    end
end

hold off