function SIZE = SECTOR_SIZE(EP_POLAR)

SIZE         = EP_POLAR(:,1) - EP_POLAR(:,2);
SIZE1        = atan2(sin(SIZE), cos(SIZE));
SIZE2        = atan2(sin(-SIZE), cos(-SIZE));
SIZE         = min(abs(SIZE1), abs(SIZE2));