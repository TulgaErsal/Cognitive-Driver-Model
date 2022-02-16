function FIGURE_SAVE(SIM)

if SIM.FIG1 == YES && SIM.SAVEFIG1 == YES
    figure(1)
    saveas(gcf,[SIM.logfolder,'/FIG1_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG1_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG2 == YES && SIM.SAVEFIG2 == YES
    figure(2)
    saveas(gcf,[SIM.logfolder,'/FIG2_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG2_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG3 == YES && SIM.SAVEFIG3 == YES
    figure(3)
    saveas(gcf,[SIM.logfolder,'/FIG3_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG3_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG4 == YES && SIM.SAVEFIG4 == YES
    figure(4)
    saveas(gcf,[SIM.logfolder,'/FIG4_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG4_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG5 == YES && SIM.SAVEFIG5 == YES
    figure(5)
    saveas(gcf,[SIM.logfolder,'/FIG5_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG5_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG6 == YES && SIM.SAVEFIG6 == YES
    figure(6)
    saveas(gcf,[SIM.logfolder,'/FIG6_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG6_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG7 == YES && SIM.SAVEFIG7 == YES
    figure(7)
    saveas(gcf,[SIM.logfolder,'/FIG7_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG7_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG8 == YES && SIM.SAVEFIG8 == YES
    figure(8)
    saveas(gcf,[SIM.logfolder,'/FIG8_STEP',num2str(SIM.STEPCNT)],'fig')
    saveas(gcf,[SIM.logfolder,'/FIG8_STEP',num2str(SIM.STEPCNT)],'png')
end

if SIM.FIG1 == YES && ishandle(SIM.h1)
    close(SIM.h1);
end

if SIM.FIG2 == YES && ishandle(SIM.h2)
    close(SIM.h2);
end