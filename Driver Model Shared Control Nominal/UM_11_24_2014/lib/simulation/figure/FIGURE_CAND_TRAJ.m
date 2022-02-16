function FIGURE_CAND_TRAJ(SIM, RES, COLOR)

if SIM.FIG1 == YES && SIM.FIG1_CANDXY == YES
    figure(1)
    plot(RES.OPTX, RES.OPTY, 'LineWidth', 2, 'Color', COLOR)
end

if SIM.FIG2 == YES && SIM.FIG2_CANDXY == YES
    figure(2)
    plot(RES.OPTX, RES.OPTY, 'LineWidth', 2, 'Color', COLOR)
end

if SIM.FIG3 == YES && SIM.FIG3_CANDXY == YES
    figure(3)
    plot(RES.OPTX, RES.OPTY, 'LineWidth', 2, 'Color', COLOR)
end

if SIM.FIG4 == YES
    figure(4)
    plot(RES.OPTX, RES.OPTY, 'LineWidth', 2, 'Color', COLOR)
end
