function OCPINFO = DER_MAP_ENDP(SETUP, OCPINFO)

% end-points derivative map

%% inputs
XLOC    = SETUP.AUXDATA.mif.XLOC;    
YLOC    = SETUP.AUXDATA.mif.YLOC;     
ALOC    = SETUP.AUXDATA.mif.ALOC; 

NPH     = SETUP.AUXDATA.num.NPH;
NST     = SETUP.AUXDATA.num.NST;
NCT     = SETUP.AUXDATA.num.NCT;
NIN     = SETUP.AUXDATA.num.NIN;
NEV     = SETUP.AUXDATA.num.NEV;

NFS     = 3; % number of relevant final states

%% calculations
NENDPVAR            = 2*sum(NST, 2) + 2*NPH + sum(NIN, 2);

NCONTVAR            = NST + NCT + ones(1, NPH);

%% first-order derivative: counter
CNT_OBJEC_VAR1      = NPH + NFS + 1;

if NPH == 1
    CNT_EVENT_VAR1  = NFS;
elseif NPH > 1
    CNT_EVENT_VAR1  = 2*sum(NST(2:end), 2) + 2*(NPH - 1) + NFS;
end

%% first-order derivative: variable map
if NPH == 1
    % objetive function : final x, final y, final psi, final time, integral
    MAP_OBJEC_VAR1      = [ NST + XLOC, ...
                            NST + YLOC, ...
                            NST + ALOC, ...
                            2*NST + 2, ...
                            2*NST + 3 ];

    % event functions   : final x, final y, final psi
    MAP_EVENT_VAR1      = [ NST + XLOC, ...
                            NST + YLOC, ...
                            NST + ALOC ];
elseif NPH > 1
    % preallocation
    MAP_OBJEC_VAR1      = zeros(1, CNT_OBJEC_VAR1);
    MAP_EVENT_VAR1      = zeros(1, CNT_EVENT_VAR1);
    
    % index pointer for value assignmet of MAP_OBJEC_VAR1
    IDXPO               = 0;
    % index pointer for value assignmet of MAP_EVENT_VAR1
    IDXPE               = 0;
    
    % ===== Phase #1: 
    
    % objective function
    % integral
    IDXPO                   = IDXPO + 1;
    MAP_OBJEC_VAR1(IDXPO)   = 2*NST(1) + 3;
    
    % event functions
    % initial states: not included
    % final states
    IDX_SEQ                 = (IDXPE + 1):(IDXPE + NST(1)); 
    MAP_EVENT_VAR1(IDX_SEQ) = (1:1:NST(1)) + NST(1);
    IDXPE                   = IDX_SEQ(end); 
    % initial time: not included
    % final time
    IDXPE                   = IDXPE + 1;
    MAP_EVENT_VAR1(IDXPE)   = 2*NST(1) + 2;
    
    % ===== Phase #2 - Phase #(NPH - 1)
    if NPH > 2
        for IdxEG = 2:1:NPH - 1
            % start index
            IS              = 2*sum(NST(2:IdxEG), 2) + ...
                              2*(IdxEG - 1) + ...
                              sum(NIN(1:IdxEG - 1), 2);
            
            IDX_IS          = IS + (1:1:NST(IdxEG));
            IDX_FS          = IS + (1:1:NST(IdxEG)) + NST(IdxEG);
            IDX_IT          = IS + 2*NST(IdxEG) + 1;
            IDX_FT          = IS + 2*NST(IdxEG) + 2;
            IDX_IN          = IS + 2*NST(IdxEG) + 3;
            
            % objective function
            IDXPO                   = IDXPO + 1;
            MAP_OBJEC_VAR1(IDXPO)	= IDX_IN;
            
            % event functions
            IDX_SEQ                 = (IDXPE + 1):(IDXPE + 2*NST(IdxEG) + 2); 
            MAP_EVENT_VAR1(IDX_SEQ) = [IDX_IS, IDX_FS, IDX_IT, IDX_FT];
            IDXPE                   = IDX_SEQ(end); 
        end
    end
    
    % Phase #NPH
    IS                          = 2*sum(NST(2:NPH), 2) + ...
                                  2*(NPH - 1) + ...
                                  sum(NIN(1:NPH - 1), 2);
                          
    % objective function
    MAP_OBJEC_VAR1(IDXPO + 1)   = IS + NST(NPH) + XLOC; % final x
    MAP_OBJEC_VAR1(IDXPO + 2)   = IS + NST(NPH) + YLOC; % final y
    MAP_OBJEC_VAR1(IDXPO + 3)   = IS + NST(NPH) + ALOC; % final psi
    MAP_OBJEC_VAR1(IDXPO + 4)   = IS + 2*NST(NPH) + 2;  % final time
    MAP_OBJEC_VAR1(IDXPO + 5)   = IS + 2*NST(NPH) + 3;  % integral
    
    % event functions
    IDX_SEQ                     = (IDXPE + 1):(IDXPE + NST(NPH));
    MAP_EVENT_VAR1(IDX_SEQ)     = IS + (1:1:NST(NPH));  % initial states
    
    IDXPE                       = IDX_SEQ(end); 
    MAP_EVENT_VAR1(IDXPE + 1)   = IS + NST(NPH) + XLOC; % final x
    MAP_EVENT_VAR1(IDXPE + 2)   = IS + NST(NPH) + YLOC; % final y
    MAP_EVENT_VAR1(IDXPE + 3)   = IS + NST(NPH) + ALOC; % final psi
    MAP_EVENT_VAR1(IDXPE + 4)   = IS + 2*NST(NPH) + 1;  % initial time
end

%% first-order derivative: function map
MAP_OBJEC_FUN1 = 1:1:CNT_OBJEC_VAR1;

% preallocate
MAP_EVENT_FUN1(NPH).FIRST = [];

if NPH == 2
    % connector of Phase #1 and Phase #2
    % assumptions: NST(2) <= NST(1)
    
    CNT_FUN = NST(2) + 1; % number of event functions
    
    % preallocation
    FIRST = zeros(CNT_FUN, CNT_EVENT_VAR1);
    
    for Idx = 1:NST(2)
        % final states of Phase #1
        FIRST(Idx, Idx) = Idx;
        % initial states of Phase #2
        FIRST(Idx, (NST(2) + 1) + Idx) = Idx + CNT_FUN;
    end
  	% final time of Phase #1
    IDX_FT = NST(2) + 1;
    FIRST(CNT_FUN, IDX_FT) = CNT_FUN;
  	% initial time of Phase #2
    IDX_IT = (NST(2) + 1) + (NST(2) + 3 + 1); % <--- different
    FIRST(CNT_FUN, IDX_IT) = 2*CNT_FUN;
    MAP_EVENT_FUN1(1).FIRST = FIRST;
    
elseif NPH >= 3
    
    CNT_FUN = NST(2) + 1; % number of event functions
    
    % preallocation
    FIRST = zeros(CNT_FUN, CNT_EVENT_VAR1);
    
    for Idx = 1:NST(2)
        % final states of Phase #1
        FIRST(Idx, Idx) = Idx;
        % initial states of Phase #2
        FIRST(Idx, (NST(2) + 1) + Idx) = Idx + CNT_FUN;
    end
  	% final time of Phase #1
    IDX_FT = NST(2) + 1;
    FIRST(CNT_FUN, IDX_FT) = CNT_FUN;
  	% initial time of Phase #2
    IDX_IT = (NST(2) + 1) + (2*NST(2) + 1); % <--- different
    FIRST(CNT_FUN, IDX_IT) = 2*CNT_FUN; 
    MAP_EVENT_FUN1(1).FIRST = FIRST;
    
    for IdxEG = 2:NPH - 2
        
        CNT_FUN = NST(IdxEG + 1) + 1; % number of event functions
        
        % preallocation
        FIRST = zeros(CNT_FUN, CNT_EVENT_VAR1);
        
        if IdxEG == 2
            IS = (NST(2) + 1) + NST(3);
        else
            IS = (NST(2) + 1) + 2*sum(NST(3:IdxEG),2) +...
                 2*(IdxEG - 2) + NST(IdxEG + 1);
        end
        
        for Idx = 1:NST(IdxEG + 1)
            % final states of Phase #IdxPH
            FIRST(Idx, IS + Idx) = Idx;
            % initial states of Phase #(IdxPH + 1)
            FIRST(Idx, IS + NST(IdxEG + 1) + 2 + Idx) = Idx + CNT_FUN;
        end
        
        % final time of Phase #IdxPH
        IDX_FT = IS + NST(IdxEG + 1) + 2;
     	FIRST(CNT_FUN, IDX_FT) = CNT_FUN;
        % initial time of Phase #(IdxPH + 1)
        IDX_IT = IS + NST(IdxEG + 1) + 2 + 2*NST(IdxEG + 1) + 1;
        FIRST(CNT_FUN, IDX_IT) = 2*CNT_FUN;
        MAP_EVENT_FUN1(IdxEG).FIRST = FIRST;
    end
    
    CNT_FUN = NST(NPH) + 1; % number of event functions
    
	% preallocation
    FIRST = zeros(CNT_FUN, CNT_EVENT_VAR1);
    
    if NPH == 3
        IS = (NST(2) + 1) + NST(3);
    elseif NPH > 3
        IS = (NST(2) + 1) + 2*sum(NST(3:NPH-1), 2) +...
             2*(NPH - 3) + NST(NPH);
    end
    
    for Idx = 1:NST(NPH)
        % final states of Phase #(NPH - 1)
        FIRST(Idx, IS + Idx) = Idx;
        % initial states of Phase #NPH
        FIRST(Idx, IS + NST(NPH) + 2 + Idx) = Idx + CNT_FUN;
    end
    % final time of Phase #(NPH - 1)
    IDX_FT = IS + NST(NPH) + 2;
        FIRST(CNT_FUN, IDX_FT) = CNT_FUN;
    % initial time of Phase #NPH
    IDX_IT = IS + NST(NPH) + 2 + NST(NPH) + 3 + 1;
        FIRST(CNT_FUN, IDX_IT) = 2*CNT_FUN;
    MAP_EVENT_FUN1(NPH - 1).FIRST = FIRST;
end

if NEV(end) ~= 0
    % preallocation
    MAP_EVENT_FUN1(NPH).FIRST = zeros(NEV(end), CNT_EVENT_VAR1);

    Idx = 0;
    for IdxST = NFS:-1:1
        for IdxEV = 1:NEV(end)
            Idx = Idx + 1;
            if NPH > 1
                MAP_EVENT_FUN1(NPH).FIRST(IdxEV, CNT_EVENT_VAR1 - IdxST) = Idx;
            elseif NPH == 1
                MAP_EVENT_FUN1(NPH).FIRST(IdxEV, CNT_EVENT_VAR1 - IdxST + 1) = Idx;
            end
        end
    end
end

%% second-order derivative
CNT_ENDP_VAR2   = (NFS + 1)*NFS/2;

if NPH == 1
    ENDP_VAR2_SEQ = [   MAP_EVENT_VAR1(CNT_EVENT_VAR1 - 2),...
                        MAP_EVENT_VAR1(CNT_EVENT_VAR1 - 1),...
                        MAP_EVENT_VAR1(CNT_EVENT_VAR1 - 0)];
else
    ENDP_VAR2_SEQ = [   MAP_EVENT_VAR1(CNT_EVENT_VAR1 - 3),...
                        MAP_EVENT_VAR1(CNT_EVENT_VAR1 - 2),...
                        MAP_EVENT_VAR1(CNT_EVENT_VAR1 - 1)];
end

MAP_ENDP_VAR2	= zeros(2, CNT_ENDP_VAR2);

Idx = 0;
for outer = 1:NFS
    for inner = 1:NFS
        if inner <= outer
            Idx = Idx + 1;
            MAP_ENDP_VAR2(1, Idx) = ENDP_VAR2_SEQ(outer);
            MAP_ENDP_VAR2(2, Idx) = ENDP_VAR2_SEQ(inner);
        end
    end
end

CNT_OBJEC_VAR2  = CNT_ENDP_VAR2;
CNT_OBJEC_NNZ2  = CNT_OBJEC_VAR2;
MAP_OBJEC_VAR2  = MAP_ENDP_VAR2; %#ok<NASGU>
MAP_OBJEC_FUN2  = 1:1:CNT_OBJEC_NNZ2;

CNT_EVENT_VAR2  = CNT_ENDP_VAR2;
CNT_EVENT_NNZ2  = [zeros(1, NPH-1), NEV(end)*CNT_EVENT_VAR2];
MAP_EVENT_VAR2  = MAP_ENDP_VAR2; %#ok<NASGU>
MAP_EVENT_FUN2(NPH).SECOND = [];

if NPH > 1
    for IdxEG = 1:NPH - 1
        MAP_EVENT_FUN2(IdxEG).SECOND = zeros(NST(IdxEG + 1) + 1, CNT_EVENT_VAR2);
    end
end

if NEV(end) ~= 0
    MAP_EVENT_FUN2(NPH).SECOND = reshape(1:CNT_EVENT_NNZ2(end), NEV(end), CNT_EVENT_VAR2);
end

%% outputs
OCPINFO.NENDPVAR                    = NENDPVAR;
OCPINFO.NCONTVAR                 	= NCONTVAR;

OCPINFO.DER_MAP.CNT_OBJEC_VAR1  	= CNT_OBJEC_VAR1;
OCPINFO.DER_MAP.ENDP1.OBJEC_VAR1  	= MAP_OBJEC_VAR1; 
OCPINFO.DER_MAP.ENDP1.OBJEC_FUN1  	= MAP_OBJEC_FUN1;

OCPINFO.DER_MAP.CNT_EVENT_VAR1    	= CNT_EVENT_VAR1; 
OCPINFO.DER_MAP.ENDP1.EVENT_VAR1 	= MAP_EVENT_VAR1; 
OCPINFO.DER_MAP.ENDP1.EVENT_FUN1  	= MAP_EVENT_FUN1;

OCPINFO.DER_MAP.CNT_ENDP_VAR2     	= CNT_ENDP_VAR2; 
OCPINFO.DER_MAP.ENDP2.ENDP_VAR2    	= MAP_ENDP_VAR2;

OCPINFO.DER_MAP.ENDP2.OBJEC_FUN2   	= MAP_OBJEC_FUN2;
OCPINFO.DER_MAP.ENDP2.EVENT_FUN2  	= MAP_EVENT_FUN2;