function Plot_Acc = Plot_Acceleration(x_th2, xf3p, xf4p, xf5p, xh3p, xh4p)
%% ----%----%----%-- 2nd Order Kinematic Plots --%----%----%---- %%
figure           % Opens a separate figure window if another plot is running
subplot(3,2,1)   % Creates a page of 6 slots for plots. Inserts this plot into the first slot
plot(x_th2,xf3p)
title('f3 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f3 prime (Unitless)')

subplot(3,2,2)   % Inserts this plot into the second slot
plot(x_th2,xf4p)
title('f4 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f4 prime (Unitless)')

subplot(3,2,3)   % Inserts this plot into the third slot
plot(x_th2,xf5p)
title('f5 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f5 prime (Unitless)')

subplot(3,2,4)   % Inserts this plot into the fourth slot
plot(x_th2,xh3p)
title('h3 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('h3 prime (Unitless)')

subplot(3,2,5)   % Inserts this plot into the fifth slot
plot(x_th2,xh4p)
title('h4 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('h4 prime (Unitless)')
end
