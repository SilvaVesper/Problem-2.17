function Plot_Jer = Plot_Jerk(x_th2, xf3pp, xf4pp, xf5pp, xh3pp, xh4pp)
%% ----%----%----%-- 2nd Order Kinematic Plots --%----%----%---- %%
figure           % Opens a separate figure window if another plot is running
subplot(3,2,1)   % Creates a page of 6 slots for plots. Inserts this plot into the first slot
plot(x_th2,xf3pp)
title('f3 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f3 prime (Unitless)')

subplot(3,2,2)   % Inserts this plot into the second slot
plot(x_th2,xf4pp)
title('f4 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f4 prime (Unitless)')

subplot(3,2,3)   % Inserts this plot into the third slot
plot(x_th2,xf5pp)
title('f5 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('f5 prime (Unitless)')

subplot(3,2,4)   % Inserts this plot into the fourth slot
plot(x_th2,xh3pp)
title('h3 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('h3 prime (Unitless)')

subplot(3,2,5)   % Inserts this plot into the fifth slot
plot(x_th2,xh4pp)
title('h4 prime as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('h4 prime (Unitless)')
end
