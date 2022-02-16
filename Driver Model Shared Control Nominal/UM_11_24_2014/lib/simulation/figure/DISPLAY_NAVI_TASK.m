function DISPLAY_NAVI_TASK(SPEC, SIM)

DISPLAY_MAP(SPEC.MAP.BDY, SPEC.MAP.OBS)

hold on;
plot(SPEC.VP_INIT(1),SPEC.VP_INIT(2),'.','Color',SIM.C10(1,:),'MarkerSize',20)
plot(SPEC.VP_GOAL(1),SPEC.VP_GOAL(2),'.','Color',SIM.C10(1,:),'MarkerSize',20)