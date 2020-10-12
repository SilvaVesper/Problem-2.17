function IDP_Plot = IDP_Plot(position, R, Thetas,idp)
%% ----%----%----%-- IDP Plots --%----%----%---- %%
xr3  = position(1,:);
xr4  = position(2,:);
xr5  = position(3,:);
xth3 = position(4,:);
xth4 = position(5,:);

r1  = R(1);        % Known
th1 = Thetas(1);   % Known
r2  = R(2);        % Known
th2 = pi/4;        % Input
r3  = xr3(46);     % Known
th3 = xth3(46);    % Known
r4  = xr4(46);     % Known
th4 = xth4(46);    % Known
r5  = xr5(46);     % Known
th5 = Thetas(5);   % Known
r6  = R(6);        % Known
th6 = Thetas(6);   % Known

r2_x = [0 r2*cos(th2)];
r2_y = [-r1*sin(th1) r1+r2*sin(th2)]; 
r4_x = [0 r4*cos(th4)];
r4_y = [0 r4*sin(th4)];

% x and y values for the FBD of link 2
f12xx = [0.2 0.333];
f12xy = [0.36 0.36];
f12yx = [0.332 0.332];
f12yy = [0.2 0.36];
f23xx = [0.55 0.67];
f23xy = [0.71 0.71];
f23yx = [0.668 0.668];
f23yy = [0.55 0.71];
w2x   = [0.5 0.5];
w2y   = [0.542 0.375];

% x and y values for the FBD of link 4
f14xx = [0.15 0.245];
f14xy = [0.2 0.2];
f14yx = [0.245 0.245];
f14yy = [0.1 0.2];
f45x  = [0.7 0.78];
f45y  = [0.95 0.834];
f34x  = [0.55 0.63];
f34y  = [0.78 0.66];
w4x   = [0.5 0.5];
w4y   = [0.5 0.4];

% x and y values for the FBD of slider 5
f15x = [0.5 0.5];
f15y = [0.2 0.38];
f5x  = [0.8 0.7];
f5y  = [0.52 0.52];
w5x  = [0.5 0.5];
w5y  = [0.8 0.65];
f45x = [0.6 0.5];
f45y = [0.4 0.5];
%%%%% FBD OF LINK 2 %%%%%
figure
R2_line = line(r2_x, r2_y,'Color','black');
F12x = annotation('arrow',f12xx,f12xy,'Color','red');
F12y = annotation('arrow',f12yx,f12yy,'Color','cyan');
F23x = annotation('arrow',f23xx,f23xy,'Color','blue');
F23y = annotation('arrow',f23yx,f23yy,'Color','green');
W2   = annotation('arrow',w2x,w2y,'Color','magenta'); 
title('FBD of Link 2 at theta 2 = 45 degrees')
legend('Red: F12x, Cyan: F12y, Blue: F23x, Green: F23y, Magenta: W2 *Note: Torque T2 at the point (0,12.4)')
xlim([-2 6])
ylim([10 18])

%%%%% FBD OF LINK 4 %%%%%
figure
R4_line = line(r4_x, r4_y,'Color','black');
F14x = annotation('arrow',f14xx,f14xy,'Color','red');
F14y = annotation('arrow',f14yx,f14yy,'Color','cyan');
F45  = annotation('arrow',f45x,f45y,'Color','blue');
F34  = annotation('arrow',f34x,f34y,'Color','green');
W4   = annotation('arrow',w4x,w4y,'Color','magenta');
title('FBD of Link 4 at theta 2 = 45 degrees')
legend('Red: F14x, Cyan: F14y, Blue: F45, Green: -F34, Magenta: W4')
xlim([-1 6])
ylim([-3 25])

%%%%% FBD OF SLIDER 5 %%%%%
figure
rectangle('Position',[1.4 2 3 2])
F15 = annotation('arrow',f15x,f15y,'Color','red');
F5  = annotation('arrow',f5x,f5y,'Color','cyan');
W5  = annotation('arrow',w5x,w5y,'Color','blue');
F45 = annotation('arrow',f45x,f45y,'Color','green'); 
title('FBD of Slider 5 at theta 2 = 45 degrees')
%%% legend('Red: F15, Cyan: F5, Blue: W5, Green: -F45');
% Note: Legend does not seem to be compatible with the rectangle function. 
xlim([0 6])
ylim([0 6])


%%%%% FBD OF SLIDER 3 %%%%%
figure
rectangle('Position',[1.4 2 3 2])
title('FBD of Slider 3 at theta 2 = 45 degrees')
xlim([0 6])
ylim([0 6])
end



