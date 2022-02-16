%%
BASIC10_RGB(1,:) = '990000';
BASIC10_RGB(2,:) = '82c341';
BASIC10_RGB(3,:) = 'd82735';
BASIC10_RGB(4,:) = '00753a';
BASIC10_RGB(5,:) = 'faa31b';
BASIC10_RGB(6,:) = '88c6ed';
BASIC10_RGB(7,:) = '394ba0';
BASIC10_RGB(8,:) = 'd54799';
BASIC10_RGB(9,:) = '681e7e';
BASIC10_RGB(10,:) = '000000';

for i = 1:10
    figure(3)
    hold on;
    C10(i,:) = rgbconv(num2str(BASIC10_RGB(i,:)));
    plot([0,10],[i,i],'Color',C10(i,:),'LineWidth', 10)
end
axis([0,10,0,11])
axis off

%%
save COLOR_BASIC10 C10