function Plot_Gen = Generate_Plot(position, R, Thetas, Theta_Fail)
%% ----%----%----%-- Generate Plots --%----%----%---- %%
GivTh2 = input(" Input a Theta2 angle in Degrees [Integers only]: ");
    % If so, asks user to input an angle at which to solve the mechanism
    
if abs(GivTh2) == GivTh2
    % If the absolute value of the user input theta 2 is a positive value
    while GivTh2 > 360
        GivTh2 = GivTh2 - 360;
    % If the given theta is larger than 360 it iteratively subtracts off 360
    % until it is within the range 0 <= GivTh2 <= 360
    end
end

if -abs(GivTh2) == GivTh2
    % If the absolute value of the user input theta 2 is a negative value
    while GivTh2 < 0
        GivTh2 = GivTh2 + 360;
    % If the given theta is smaller than 0 it iteratively adds 360
    % until it is within the range 0 <= GivTh2 <= 360
    end
end

if (GivTh2) == Theta_Fail(GivTh2)
    disp('     You are plotting a BROKEN value')
    % If the input theta 2 matches one in the Theta_Fail array, that value
    % is already deemed a broken value. i.e. The mechanism cannot
    % operate/is broken at these values
else 
    disp('     You are plotting a WORKING value')
    % If the input theta 2 does not match one in the Theta_Fail array, that 
    % value is already deemed a working value. i.e. The mechanism can
    % operate at these values
end

GivTh2Rad = (GivTh2 + 1) * pi / 180;  % Converts the angle to Radians
fprintf ('\n Input Theta 2 equivalent is: %.4f Degrees or %.4f Radians \n', GivTh2, GivTh2Rad)
                % Displays the user's input in Degrees and Radians to 4
                % decimal points

GivPos = position(:,(GivTh2 + 1)); % Known

r1  = R(1);        % Known
th1 = Thetas(1);   % Known
r2  = R(2);        % Known
th2 = GivTh2Rad;   % Input
r3  = GivPos(1);   % Unknown
th3 = GivPos(4);   % Unknown
r4  = GivPos(2);   % Unknown
th4 = GivPos(5);   % Unknown
r5  = GivPos(3);   % Unknown
th5 = Thetas(5);   % Known
r6  = R(6);        % Known
th6 = Thetas(6);   % Known

r1_x = [0 0];
r1_y = [0 -r1*sin(th1)];
r2_x = [0 r2*cos(GivTh2Rad)];
r2_y = [-r1*sin(th1) r1+r2*sin(GivTh2Rad)]; 
r3_x = [0 r3*cos(th3)];
r3_y = [0 r3*sin(th3)];
r4_x = [0 r4*cos(th4)];
r4_y = [0 r4*sin(th4)];
r5_x = [0 r5*cos(th5)]; 
r5_y = [r1+r6 r1+r6]; 
r6_x = [0 0];
r6_y = [-r1*sin(th1) r1+r6*sin(th6)];
 
% Defining the limits of our x and y values for the graph
xlim([-15 15])
ylim([-2.5 30])

% Red lines mean a reference vector, i.e. not a link
% Blue lines are links
R1_line = line(r1_x, r1_y,'Color','red');
R2_line = line(r2_x, r2_y);
R3_line = line(r3_x, r3_y);
R4_line = line(r4_x, r4_y);
R5_line = line(r5_x, r5_y,'Color','red');
R6_line = line(r6_x, r6_y,'Color','red');

end


