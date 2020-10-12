clear; clc; close all
%%% Problem 2.17 %%%
%% Nekita Pitts %%

%%% Citation: .txt file opening code tweaked from Dr. Walker's example code 
fID = fopen('Problem_2_17_Data.txt','r'); 
% Opens the file as read-only.  fID is a unique ID to that file

Nlink = 6;              % 6 linkages (i.e., 6 vectors)
mydata = fscanf(fID,'%f, %f',[2,Nlink]);  
% Read in file data to an array. 2 numbers per line, 6 lines

% Extract length R and angle theta for the 6 vectors
R = mydata(1,:);        % lengths - r
Thetas = mydata(2,:);   % angles - theta
 
fclose(fID);            % Close link to the text file to free up memory

%-------------------
% Display results
fprintf('   R(links)            Thetas\n')
fprintf('  .-*-.-*-            .-*-.-*-\n')
disp([R.' Thetas.'])

% Known: r1, r2, r6, theta1, theta5, theta6
% Unknowns: r3, r4, r5, theta3, theta4                Input: theta2
% r [centimeters], theta [radians]

r1 = R(1);                    % Taking the r and theta values from the  1 = 4
r2 = R(2);                    % .txt file and setting them to variables 2 = 6
r3 = R(3);                    % for use in this code  6 = 4
r4 = R(4);
r5 = R(5);
r6 = R(6);

th1 = Thetas(1);
th2 = Thetas(2);
th3 = Thetas(3);
th4 = Thetas(4);
th5 = Thetas(5);
th6 = Thetas(6);

%----%----%----%----%----%----%----%----%----%----%----%----%----%----%

x_0 = [r3; r4; r5; th3; th4];        % Unknown column vector 
error = 1;                           % Set initial error 

theta2 = 0:1:360;                    % Cycle theta2 from 0 to 360 degrees, step 1
theta2 = theta2 * pi/180;            % Convert the array to radians

%----%----%----%----%----%----%----%----%----%----%----%----%----%----%

Theta_Fail = zeros(1,360);   % Creating an array of 0s with 360 values to 
                             % represent the failed values from 1 to 360 degrees
f = 0;         % Setting an initial counter for the entire array
xyz = 0;       % Setting an initial counter for the failed values
for th2 = 0:1:360
    if -r2*sind(th2) > r1    % Failing condition 1
        fprintf('This mechanism fails at [in degrees]');
        disp(th2);   % Displaying to the console which theta the mechanism fails at
        Theta_Fail(f) = th2; % Setting the array spot to the broken value
        xyz = xyz + 1;       % Increase the broken value counter by 1
        
    elseif r2*sind(th2) > r6 % Failing condition 2
        fprintf('This mechanism fails at [in degrees]');
        disp(th2);   % Displaying to the console which theta the mechanism fails at  
        Theta_Fail(f) = th2; % Setting the array spot to the broken value
        xyz = xyz + 1;       % Increase the broken value counter by 1
    else 
               % Do nothing -> The mechanism will work at this theta 2 value
    end
    f = f + 1; % Increase the array counter by 1 to move to the next theta value
end

for th2 = 0   % Doing a special iteration to check at th2 = 0
    if -r2*sind(th2) > r1    % Failing condition 1
        fprintf('This mechanism fails at [in degrees]');
        disp(0);   % Displaying to the console which theta the mechanism fails at
        Theta_Fail_Z = 400;  % Setting a Theta Fail variable for the broken value 
        xyz = xyz + 1;       % Increase the broken value counter by 1
        
    elseif r2*sind(th2) > r6 % Failing condition 2
        fprintf('This mechanism fails at [in degrees]');
        disp(th2);   % Displaying to the console which theta the mechanism fails at  
        Theta_Fail_Z = 400;  % Setting a Theta Fail variable for the broken value 
        xyz = xyz + 1;       % Increase the broken value counter by 1
    else 
        Theta_Fail_Z = 0;    % Do nothing to the array -> The mechanism will work at 0
    end
end

fprintf('From 0 to 360 degrees the mechanism fails (times)')
disp(xyz)
plot(Theta_Fail)           % Plotting all broken values at a slope of y = x
title('Broken values of Theta 2 given the link lengths from the text file')

hold on
x = [0 1];
y = -Theta_Fail_Z * x + Theta_Fail_Z;
plot(x,y,'color','blue')   % Plotting the 0 special case
legend('Broken values: y = x; Working values y = 0','Broken value for th2 = 0: y = 400; Working value: y = 0')
hold off

% Plots the broken values versus each other. If the angle works, it
% displays 0. If the angle is broken it displays the value of that angle.
% **Excluding Zero. 0 is a special case. In the scenario that 0 fails, 400 is
% displayed

%% ----%----%----%----%----%----%----%----%----%----%----%----%----%---- %%


position = ones(5, 360);             % Create an empty array to enter position solution into
velocity = ones(5, 360);             % Create an empty array to enter velocity solution into
acceleration = ones(5, 360);         % Create an empty array to enter acceleration solution into
jerk = ones(5, 360);                 % Create an empty array to enter jerk solution into

for i = 1:361                        % For all the angles in the array
    error = 1;                       % Restating the error
    th2 = theta2(i);                 % theta2 cycles through all angles 
    
    while error > 0.00001            % Until the error is very small

        % Vector Loop equations
        Fpos = [ r3*cos(th3) - r2*cos(th2);
              r3*sin(th3) - r2*sin(th2) - r1;
              r4*cos(th4) - r5;
              r4*sin(th4) - r6 - r1;
              th3 - th4];

        % A part of Ax = b position matrix
        A = [cos(th3)    0         0    -r3*sin(th3)      0;      
             sin(th3)    0         0     r3*cos(th3)      0;
                0     cos(th4)    -1          0     -r4*sin(th4);
                0     sin(th4)     0          0      r4*cos(th4);
                0        0         0          1          -1];     

        x_1 = x_0 - A\Fpos;    
        % (New x value) = (Old x value) - (solution of linear system (Ax = F))

        error = norm(x_1 - x_0) / norm(x_1);  
        % New error is the difference of the old and new x values, divided
        % by the new x value 

        x_0 = x_1;       % Set the old error to the new error

        r3 = x_1(1);     % Reset the r and th values as per the new calculated 
        r4 = x_1(2);     % unknown column vector 
        r5 = x_1(3);
        th3 = x_1(4);
        th4 = x_1(5);
    
        %----%----%-- Velocity Calculation --%----%----%
        Fvel = [-r2*sin(th2); r2*cos(th2); 0; 0; 0];      
        % b part of Ax = b velocity matrix
    
        xvel = A\Fvel;                                      
        % Solving unknowns of velocity matrix 
            
        f3 = xvel(1);    % Reset the f and h values as per the new calculated
        f4 = xvel(2);    % unknown column vector
        f5 = xvel(3);
        h3 = xvel(4);
        h4 = xvel(5);
        
        %----%----%-- Acceleration Calculation --%----%----%
        Facc = [-r2*cos(th2) + r3*(f3^2)*cos(th3) + 2*h3*f3*sin(th3);
                -r2*sin(th2) + r3*(f3^2)*sin(th3) + 2*h3*f3*cos(th3);
                r4*(h4^2)*cos(th4) - 2*f4*h4*sin(th4); 
                r4*(h4^2)*sin(th4) + 2*f4*h4*cos(th4); 
                0];      
        % b part of Ax = b acceleration matrix
    
        xacc = A\Facc;                                      
        % Solving unknowns of acceleration matrix 
            
        f3p = xacc(1);    % Reset the f prime and h prime values as per the new calculated
        f4p = xacc(2);    % unknown column vector
        f5p = xacc(3);
        h3p = xacc(4);
        h4p = xacc(5);

        %----%----%-- Jerk Calculation --%----%----%
        Fjer = [r2*sin(th2)  + cos(th3)*(r3*f3p*h3 + f3^3) + sin(th3)*(h3p*h3 - r3*f3^2*h3 + 2*h3^2*f3 + f3p*f3);
                -r2*cos(th2) + sin(th3)*(r3*f3p*h3 + f3^3) - cos(th3)*(h3p*h3 - r3*f3^2*h3 + 2*h3^2*f3 + f3p*f3);
                cos(th4)*(r4*h4p*h4 + h4^2*f4) + sin(th4)*(f4p*h4 - r4*h4^3 - 2*h4^2*f4 + h4p*f4);
                sin(th4)*(r4*h4p*h4 + h4^2*f4) - cos(th4)*(f4p*h4 - r4*h4^3 - 2*h4^2*f4 + h4p*f4); 
                0];      
        % b part of Ax = b acceleration matrix
    
        xjer = A\Fjer;                                      
        % Solving unknowns of acceleration matrix 
            
        f3pp = xjer(1);    % Reset the f prime and h prime values as per the new calculated
        f4pp = xjer(2);    % unknown column vector
        f5pp = xjer(3);
        h3pp = xjer(4);
        h4pp = xjer(5);
        
    end
    
    position(:,i) = [r3; r4; r5; th3; th4];
    % Link lengths and thetas solved at the angles 0 to 2pi

    velocity(:,i) = [f3; f4; f5; h3; h4]; 
    % First order Kinematic Coefficients solved at the angles 0 to 2pi
    
    acceleration(:,i) = [f3p; f4p; f5p; h3p; h4p]; 
    % Second order Kinematic Coefficients solved at the angles 0 to 2pi
    
    jerk(:,i) = [f3pp; f4pp; f5pp; h3pp; h4pp]; 
    % Third order Kinematic Coefficients solved at the angles 0 to 2pi

end

xr3  = position(1,:);
xr4  = position(2,:);
xr5  = position(3,:);
xth3 = position(4,:);
xth4 = position(5,:);

xf3  = velocity(1,:);
xf4  = velocity(2,:);
xf5  = velocity(3,:);
xh3  = velocity(4,:);
xh4  = velocity(5,:);

xf3p = acceleration(1,:);
xf4p = acceleration(2,:);
xf5p = acceleration(3,:);
xh3p = acceleration(4,:);
xh4p = acceleration(5,:);

xf3pp = jerk(1,:);
xf4pp = jerk(2,:);
xf5pp = jerk(3,:);
xh3pp = jerk(4,:);
xh4pp = jerk(5,:);

for n = 1:361                             
    % For 360 angle intervals for theta 2 
x_th2(n,1) = (n - 1) * (pi/180);         
end

%% ----%----%----%----%----%----%----%----%----%----%----%----%----%---- %%
%%%%% IDP Calculation %%%%%

%%% Citation: .txt file opening code tweaked from Dr. Walker's example code 
fID = fopen('Problem_2_17_IDP_Data.txt','r'); 
% Opens the file as read-only.  fID is a unique ID to that file

Nrow = 10;
mydata = fscanf(fID,'%f, %f',[2,Nrow]);  
% Read in file data to an array. 2 numbers per line, 10 lines

% Extract length R and angle theta for the 6 vectors
Force = mydata(1,:);        % lengths - r
Misc = mydata(2,:);   % angles - theta

fclose(fID);            % Close link to the text file to free up memory
%-------------------

% Display results
fprintf('    Forces              Masses, T2, and omega2\n')
fprintf('   .-*-.-*-            .-*-.-*-.-*-\n')
disp([Force.' Misc.'])

% Defining the forces and miscellaneous from the .txt file
F12x = Force(1);
F12y = Force(2);
F23x = Force(3);
F23y = Force(4);
F34  = Force(5);
r7   = Force(6);
F14x = Force(7);
F14y = Force(8);
F45  = Force(9);
F5   = Force(10);

m2 = Misc(1);
m3 = Misc(2);
m4 = Misc(3);
T2 = Misc(4); % Input Torque 2
w2 = Misc(5); % Input omega 2 (angular velocity)

%----%----%----%----%----%----%----%
x_IDP = [F12x; F12y; F23x; F23y; F34; r7; F14x; F14y; F45; F5];  % Unknown column vector 
error = 1;                           % Set initial error 

theta2 = 0:1:360;                    % Cycle theta2 from 0 to 360 degrees, step 1
theta2 = theta2 * pi/180;            % Convert the array to radians
%----%----%----%----%----%----%----%
%%% Valuable constants %%%
r9 = 0.5 * r2;
r4min = xr4(91);                      % r4 minimum value at th2 = 90 degrees

fgp2x = -r9*cos(th2);
fgp2y = -r9*sin(th2);
fgp3x = -r2*cos(th2);
fgp3y = -r2*sin(th2);
fgp4x = -r2*cos(th2) - f3p*sin(th3)*h3 - f3*cos(th3)*h3^2 - f3*sin(th3)*h3p + (r4min/2)*cos(th3)*h3^2 - (r4min/2)*sin(th3)*h3p;
fgp4y = -r2*sin(th2) - f3p*cos(th3)*h3 + f3*sin(th3)*h3^2 - f3*cos(th3)*h3p + (r4min/2)*sin(th3)*h3^2 - (r4min/2)*cos(th3)*h3p;

a2gx  = fgp2x * w2^2;
a2gy  = fgp2y * w2^2;
a3gx  = fgp3x * w2^2;
a3gy  = fgp3y * w2^2;
a4gx  = fgp4x * w2^2;
a4gy  = fgp4y * w2^2;

alp2 = 0;
alp3 = h3p * w2^2;
alp4 = h4p * w2^2;
alp5 = 0;

IG2 = (m2 * r2^2)/12;
IG3 = (m3 * 16)/12;
IG4 = (m4 * r4^2)/12;

%----%----%----%----%----%----%----%
idp = ones(10, 360);

for j = 1:361                        % For all the angles in the array
    th2 = theta2(j);                 % theta2 cycles through all angles 

        Fidp = [m2 * a2gx;
                m2 * a2gy + w2;
                m3 * a3gx;
                m3 * a3gy + (w2*h3);
                m4 * a4gx;
                m4 * a4gy;
                0.001;
                T2;
                IG3 * alp3;
                IG4 * alp4];

        % A part of Ax = b idp matrix
        A_IDP = [1 0  1  0     0     0 0 0 0 0;      
             0 1  0 -1     0     0 0 0 0 0;
             0 0 -1  0 -sin(th3) 0 0 0 0 0;
             0 0  0  1  cos(th3) 0 0 0 0 0;
             0 0  0  0  sin(th4) 0 1 0 sin(th4) 0;
             0 0  0  0 -cos(th4) 0 0 1 cos(th4) 0;
             0 0  0  0     0     0 0 0 sin(th4) 1;
     (0.5*r2*cos(th2))   (-0.5*r2*sin(th2))   (0.5*r2*sin(th2))   (-0.5*r2*cos(th2)) 0 0 0 0 0 0;
             0 0  0  0     0 (2*cos(th3)*sin(th3)) 0 0 0 0;
             0 0  0  0 (-2*(r3-r4)*sin(th4)*cos(th4)) (-2*sin(th3)*cos(th3)) (0.5*r4min*cos(th4)) (-0.5*r4min*sin(th4)) (r4min*cos(th4)*sin(th4)) 0];
             
        x_IDP = A_IDP\Fidp;    

        F12x = x_IDP(1);     % Reset the force and r values as per the new calculated 
        F12y = x_IDP(2);     % unknown column vector 
        F23x = x_IDP(3);
        F23y = x_IDP(4);
        F34  = x_IDP(5);
        r7   = x_IDP(6);
        F14x = x_IDP(7);
        F14y = x_IDP(8);
        F45  = x_IDP(9);
        F5   = x_IDP(10);

      idp(:,j) = [F12x; F12y; F23x; F23y; F34; r7; F14x; F14y; F45; F5];
end
%----%----%----%----%----%----%----%----%----%----%----%----%----%----%

User_Interface(position, velocity, acceleration, jerk, x_th2, R, Thetas, Theta_Fail, idp)

