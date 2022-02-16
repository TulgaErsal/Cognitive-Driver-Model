function EP_LOCAL = LIDAR_DP_EPLOCAL(IPT, END_PTS)

EP_LOCAL(:, 1)      = END_PTS(:, 1) - IPT.VP(1);
EP_LOCAL(:, 2)      = END_PTS(:, 2) - IPT.VP(2);
EP_LOCAL(:, 3)      = END_PTS(:, 3) - IPT.VP(1);
EP_LOCAL(:, 4)      = END_PTS(:, 4) - IPT.VP(2);
EP_LOCAL(:, 5)      = END_PTS(:, 5) - IPT.VP(1);
EP_LOCAL(:, 6)      = END_PTS(:, 6) - IPT.VP(2);
EP_LOCAL(:, 1:2)    = EP_LOCAL(:, 1:2) * IPT.RM_G2L;
EP_LOCAL(:, 3:4)    = EP_LOCAL(:, 3:4) * IPT.RM_G2L;
EP_LOCAL(:, 5:6)    = EP_LOCAL(:, 5:6) * IPT.RM_G2L;