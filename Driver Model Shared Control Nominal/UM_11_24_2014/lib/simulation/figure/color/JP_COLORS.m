% http://www.colordic.org/w/

%% PINK
PINK_RGB(1,:) = 'fdeff2';
PINK_RGB(2,:) = 'f6bfbc';
PINK_RGB(3,:) = 'f5b199';
PINK_RGB(4,:) = 'f2a0a1';
PINK_RGB(5,:) = 'ee827c';
PINK_RGB(6,:) = 'e5abbe';
PINK_RGB(7,:) = 'c97586';
PINK_RGB(8,:) = 'a25768';
PINK_RGB(9,:) = 'a86965';
PINK_RGB(10,:) = 'b88884';

for i = 1:10
    figure(1)
    hold on;
    COLOR_PINK(i,:) = rgbconv(num2str(PINK_RGB(i,:)));
    plot([0,10],[i,i],'Color',COLOR_PINK(i,:),'LineWidth', 10)
end

%% RED
RED_RGB(1,:) = 'ec6d71';
RED_RGB(2,:) = 'e9546b';
RED_RGB(3,:) = 'eb6ea5';
RED_RGB(4,:) = 'c85179';
RED_RGB(5,:) = 'd0576b';
RED_RGB(6,:) = 'c53d43';
RED_RGB(7,:) = 'e83929';
RED_RGB(8,:) = 'e2041b';
RED_RGB(9,:) = 'c9171e';
RED_RGB(10,:) = 'b7282e';

for i = 1:10
    figure(2)
    hold on;
    COLOR_RED(i,:) = rgbconv(num2str(RED_RGB(i,:)));
    plot([0,10],[i+10,i+10],'Color',COLOR_RED(i,:),'LineWidth', 10)
end

%%
YELLOW_RGB(1,:) = 'ffea00';
YELLOW_RGB(2,:) = 'ffd900';
YELLOW_RGB(3,:) = 'fbd26b';
YELLOW_RGB(4,:) = 'ebd842';
YELLOW_RGB(5,:) = 'e6b422';
YELLOW_RGB(6,:) = 'f08300';
YELLOW_RGB(7,:) = 'ec6800';
YELLOW_RGB(8,:) = 'e17b34';
YELLOW_RGB(9,:) = 'dd7a56';
YELLOW_RGB(10,:) = 'd66a35';

for i = 1:10
    figure(3)
    hold on;
    COLOR_YELLOW(i,:) = rgbconv(num2str(YELLOW_RGB(i,:)));
    plot([0,10],[i,i],'Color',COLOR_YELLOW(i,:),'LineWidth', 10)
end


%%
GREEN_RGB(1,:) = 'b8d200';
GREEN_RGB(2,:) = 'e0ebaf';
GREEN_RGB(3,:) = 'c7dc68';
GREEN_RGB(4,:) = '99ab4e';
GREEN_RGB(5,:) = '7b8d42';
GREEN_RGB(6,:) = '69821b';
GREEN_RGB(7,:) = 'aacf53';
GREEN_RGB(8,:) = 'b0ca71';
GREEN_RGB(9,:) = '839b5c';
GREEN_RGB(10,:) = '82ae46';
GREEN_RGB(11,:) = 'a8c97f';
GREEN_RGB(12,:) = '9ba88d';
GREEN_RGB(13,:) = 'c1d8ac';
GREEN_RGB(14,:) = '769164';
GREEN_RGB(15,:) = '69b076';
GREEN_RGB(16,:) = '93b69c';
GREEN_RGB(17,:) = '47885e';
GREEN_RGB(18,:) = '316745';
GREEN_RGB(19,:) = '68be8d';
GREEN_RGB(20,:) = '3eb370';
GREEN_RGB(21,:) = '007b43';
GREEN_RGB(22,:) = '92b5a9';
GREEN_RGB(23,:) = '028760';
GREEN_RGB(24,:) = '00552e';
GREEN_RGB(25,:) = '005243';
GREEN_RGB(26,:) = '00a381';
GREEN_RGB(27,:) = '38b48b';
GREEN_RGB(28,:) = '5c9291';
GREEN_RGB(29,:) = '43676b';
GREEN_RGB(30,:) = '1f3134';

for i = 1:30
    figure(4)
    hold on;
    COLOR_GREEN(i,:) = rgbconv(num2str(GREEN_RGB(i,:)));
    plot([0,10],[i,i],'Color',COLOR_GREEN(i,:),'LineWidth', 10)
end

%%
BASIC10_RGB(1,:) = 'ee827c';
BASIC10_RGB(2,:) = 'c9171e';
BASIC10_RGB(3,:) = '006e54';
BASIC10_RGB(4,:) = 'e95295';
BASIC10_RGB(5,:) = '0095d9';
BASIC10_RGB(6,:) = 'b8d200';
BASIC10_RGB(7,:) = '16160e';
BASIC10_RGB(8,:) = '65318e';
BASIC10_RGB(9,:) = '19448e';
BASIC10_RGB(10,:) = 'f08300';

for i = 1:10
    figure(5)
    hold on;
    COLOR_BASIC10(i,:) = rgbconv(num2str(BASIC10_RGB(i,:)));
    plot([0,10],[i,i],'Color',COLOR_BASIC10(i,:),'LineWidth', 10)
end

%%
save JP_COLOR COLOR_PINK COLOR_RED COLOR_YELLOW COLOR_GREEN COLOR_BASIC10