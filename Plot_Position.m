function Plot_Pos = Plot_Position(x_th2, xr3, xr4, xr5, xth3, xth4)
%% ----%----%----%-- Initial Plots --%----%----%---- %%
figure
subplot(3,2,1)   % Creates a page of 6 slots for plots. Inserts this plot into the first slot
plot(x_th2,xr3)
title('R3 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('R3 (cm)')

subplot(3,2,2)   % Inserts this plot into the second slot
plot(x_th2,xr4)
title('R4 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('R4 (cm)')

subplot(3,2,3)   % Inserts this plot into the third slot
plot(x_th2,xr5)
title('R5 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('R5 (cm)')

subplot(3,2,4)   % Inserts this plot into the fourth slot
plot(x_th2,xth3)
title('Theta 3 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('Theta 3 (Radians)')

subplot(3,2,5)   % Inserts this plot into the fifth slot
plot(x_th2,xth4)
title('Theta 4 as Theta 2 Changes')
xlabel('Theta 2 (Radians)')
ylabel('Theta 4 (Radians)')

end
