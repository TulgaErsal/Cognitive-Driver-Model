function FIGURE_STEP_PLANNED(EXE, SIM)

COLORIDX = mod(SIM.STEPCNT, 30) + 1;

PLOT_TIME = EXE.NAVI_TM + EXE.ADDI_TM;

if SIM.FIG5 == YES
    figure(5)
    plot(PLOT_TIME, EXE.NAVI_SA*180/pi, '-.' ,'Color', SIM.CG(COLORIDX,:))
end

if SIM.FIG6 == YES
    figure(6)
    plot(PLOT_TIME, EXE.NAVI_UX, '-.' ,'Color', SIM.CG(COLORIDX,:))
end

if SIM.FIG8 == YES
    figure(8)
    
    subplot(2,1,1)
    plot(PLOT_TIME, EXE.NAVI_SR*180/pi, '-.' ,'Color', SIM.CG(COLORIDX,:))
    plot(PLOT_TIME(1), EXE.NAVI_SR(1)*180/pi, '.' ,'Color', SIM.C10(3,:),'MarkerSize',10)

    subplot(2,1,2)
    plot(PLOT_TIME, EXE.NAVI_AX, '-.' ,'Color', SIM.CG(COLORIDX,:))
    plot(PLOT_TIME(1), EXE.NAVI_AX(1), '.' ,'Color', SIM.C10(3,:),'MarkerSize',10)
end