function [END_PTS, EP_LOCAL, EP_POLAR] = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, i)

OBLSPT              = END_PTS(i, 1:2);
OBLEPT              = END_PTS(i, 3:4);
END_PTS(i, 7)       = norm(OBLEPT - OBLSPT);
END_PTS(i, 8)       = atan2((OBLEPT(2) - OBLSPT(2)), (OBLEPT(1) - OBLSPT(1)));

EP_LOCAL(i, 1)      = END_PTS(i, 1) - IPT.VP(1);
EP_LOCAL(i, 2)      = END_PTS(i, 2) - IPT.VP(2);
EP_LOCAL(i, 3)      = END_PTS(i, 3) - IPT.VP(1);
EP_LOCAL(i, 4)      = END_PTS(i, 4) - IPT.VP(2);
EP_LOCAL(i, 5)      = END_PTS(i, 5) - IPT.VP(1);
EP_LOCAL(i, 6)      = END_PTS(i, 6) - IPT.VP(2);
EP_LOCAL(i, 1:2)    = EP_LOCAL(i, 1:2) * IPT.RM_G2L;
EP_LOCAL(i, 3:4)    = EP_LOCAL(i, 3:4) * IPT.RM_G2L;
EP_LOCAL(i, 5:6)    = EP_LOCAL(i, 5:6) * IPT.RM_G2L;

A1                  = atan2(EP_LOCAL(i,2), EP_LOCAL(i,1));
A2                  = atan2(EP_LOCAL(i,4), EP_LOCAL(i,3));
R1                  = norm(EP_LOCAL(i,1:2));
R2                  = norm(EP_LOCAL(i,3:4));

EP_POLAR(i, 1)      = A1;
EP_POLAR(i, 2)      = A2;
EP_POLAR(i, 3)      = R1;
EP_POLAR(i, 4)      = R2;