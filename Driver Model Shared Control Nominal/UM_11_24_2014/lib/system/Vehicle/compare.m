clear all; clc; close all;

Test{1} = 'Test_3DoF_LINEAR_LTNO';
Test{2} = 'Test_3DoF_LINEAR_LTYES';
Test{3} = 'Test_3DoF_NONLINEAR_LTNO';
Test{4} = 'Test_3DoF_NONLINEAR_LTYES';

figure(1)
hold on;
axis equal
xlabel('x (m)')
ylabel('y (m)')

for i = 1:length(Test)
    load([Test{i}, '.mat'])
    
    plot(STATE(:,1), STATE(:,2), 'Color', [0, 0, i/4], 'LineWidth', 2)
end