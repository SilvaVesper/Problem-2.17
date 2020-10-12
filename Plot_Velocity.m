function Plot_Vel = Plot_Velocity(x_th2, xf3, xf4, xf5, xh3, xh4)
%% ----%----%----%-- 1st Order Kinematic Plots --%----%----%---- %%
figure           % Opens a separate figure window if another plot is running
subplot(3,2,1)   % Creates a page of 6 slots for plots. Inserts this plot into the first slot
plot(x_th2,xf3)
title('f3 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f3 (Unitless)')

subplot(3,2,2)   % Inserts this plot into the second slot
plot(x_th2,xf4)
title('f4 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f4 (Unitless)')

subplot(3,2,3)   % Inserts this plot into the third slot
plot(x_th2,xf5)
title('f5 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f5 (Unitless)')

subplot(3,2,4)   % Inserts this plot into the fourth slot
plot(x_th2,xh3)
title('h3 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('h3 (Unitless)')

subplot(3,2,5)   % Inserts this plot into the fifth slot
plot(x_th2,xh4)
title('h4 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('h4 (Unitless)')

end
