function PTS = MAP_RECTANGLE(ORIGIN, WIDTH, LENGTH)

PTS = [ ORIGIN; 
        ORIGIN + [WIDTH, 0]; 
        ORIGIN + [WIDTH, LENGTH];
        ORIGIN + [0, LENGTH]; 
        ORIGIN ];
