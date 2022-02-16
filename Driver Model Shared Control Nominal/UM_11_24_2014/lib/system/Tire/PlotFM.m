function PlotFM(T, KAPPA, ALPHA, FX, FY, FZ, MX, MY, MZ, C)

subplot(3, 3, 1)
hold on;
grid on;
plot(T, KAPPA, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('slip ratio (-)')

subplot(3, 3, 2)
hold on;
grid on;
plot(T, ALPHA, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('slip angle (rad)')

subplot(3, 3, 4)
hold on;
grid on;
plot(T, FX, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('F_x (N)')

subplot(3, 3, 5)
hold on;
grid on;
plot(T, FY, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('F_y (N)')

subplot(3, 3, 6)
hold on;
grid on;
plot(T, FZ, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('F_z (N)')

subplot(3, 3, 7)
hold on;
grid on;
plot(T, MX, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('M_x (N)')

subplot(3, 3, 8)
hold on;
grid on;
plot(T, MY, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('M_y (N)')

subplot(3, 3, 9)
hold on;
grid on;
plot(T, MZ, C, 'Linewidth', 2);
xlabel('time (s)')
ylabel('M_z (N)')