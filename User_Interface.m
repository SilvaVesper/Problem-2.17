function User_Int = User_Interface(position, velocity, acceleration, jerk, x_th2, R, Thetas, Theta_Fail, idp)
%% User interface: The brains using the inputs from the user

% Redefining the values solved for in the main prgram for position, 
% velocity, acceleration, and jerk

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

m = 0;  % Setting an initial value for the loop
disp([" Welcome to the Problem 2.17 Project by Team Fruit Loops."])
while(m == 0)   % While this is still true 
Question = input(" What would you like to do? [Type 'Help' for options]: ",'s');
                
   if Question == "Help" 
       fprintf('Options:\n Plot Position (type "PP")\n Plot Velocity (type "PV")\n Plot Acceleration (type "PA")\n Plot Jerk (type "PJ")\n Generate Plot (type "GP")\n FBD for IDP (type "IDP")\n Quit (type "X")\n \n')
      
   elseif Question == "X"
       m = 1;  % When m =/= 0, the code terminates. i.e. Typing X closes the program.
       disp '  Have a nice day.'
       
   elseif Question == "PP"
       %----%----%----%----%--  Initial Plots  --%----%----%----%----%
       Plot_Position(x_th2, xr3, xr4, xr5, xth3, xth4)
       q = 0;         % Setting an initial value for the loop
       while q == 0   % While this is still true 
       Start = input("Would you like to go back to the start? [type 'Y or N']: ",'s');
         if Start == "N"
           disp '  Have a nice day.'
           m = 1;
           q = 1; % Setting both values to a nonzero value terminates the program
         elseif Start == "Y"
           m = 0;
           q = 1; % Terminates the 'go back to start' piece as the user has
                  % made a selection but also loops back to the start of
                  % the program since m still equals 0
         else 
           disp(['  Please input either "Y" or "N". ' newline ' '])
                  % If neither 'Y' or 'N' are typed in (jibberish is
                  % typed in) then the program states your options and
                  % loops back to the question
         end
       end    
       
   elseif Question == "PV"
       %----%----%----%-- 1st Order Kinematic Plots --%----%----%----%
       Plot_Velocity(x_th2, xf3, xf4, xf5, xh3, xh4)
       q = 0;         % Setting an initial value for the loop
       while q == 0   % While this is still true 
       Start = input("Would you like to go back to the start? [type 'Y or N']: ",'s');
         if Start == "N"
           disp '  Have a nice day.'
           m = 1;
           q = 1; % Setting both values to a nonzero value terminates the program
         elseif Start == "Y"
           m = 0;
           q = 1; % Terminates the 'go back to start' piece as the user has
                  % made a selection but also loops back to the start of
                  % the program since m still equals 0
         else 
           disp(['  Please input either "Y" or "N". ' newline ' '])
                  % If neither 'Y' or 'N' are typed in (jibberish is
                  % typed in) then the program states your options and
                  % loops back to the question
         end
       end  
       
   elseif Question == "PA"
       %----%----%----%-- 2nd Order Kinematic Plots --%----%----%----%
       Plot_Acceleration(x_th2, xf3p, xf4p, xf5p, xh3p, xh4p)
       q = 0;         % Setting an initial value for the loop
       while q == 0   % While this is still true 
       Start = input("Would you like to go back to the start? [type 'Y or N']: ",'s');
         if Start == "N"
           disp '  Have a nice day.'
           m = 1;
           q = 1; % Setting both values to a nonzero value terminates the program
         elseif Start == "Y"
           m = 0;
           q = 1; % Terminates the 'go back to start' piece as the user has
                  % made a selection but also loops back to the start of
                  % the program since m still equals 0
         else 
           disp(['  Please input either "Y" or "N". ' newline ' '])
                  % If neither 'Y' or 'N' are typed in (jibberish is
                  % typed in) then the program states your options and
                  % loops back to the question
         end
       end
       
   elseif Question == "PJ"
       %----%----%----%-- 3rd Order Kinematic Plots --%----%----%----%
       Plot_Acceleration(x_th2, xf3pp, xf4pp, xf5pp, xh3pp, xh4pp)
       q = 0;         % Setting an initial value for the loop
       while q == 0   % While this is still true 
       Start = input("Would you like to go back to the start? [type 'Y or N']: ",'s');
         if Start == "N"
           disp '  Have a nice day.'
           m = 1;
           q = 1; % Setting both values to a nonzero value terminates the program
         elseif Start == "Y"
           m = 0;
           q = 1; % Terminates the 'go back to start' piece as the user has
                  % made a selection but also loops back to the start of
                  % the program since m still equals 0
         else 
           disp(['  Please input either "Y" or "N". ' newline ' '])
                  % If neither 'Y' or 'N' are typed in (jibberish is
                  % typed in) then the program states your options and
                  % loops back to the question
         end
       end

   elseif Question == "GP"
       %----%----% Generating a plot on user based Theta 2 %----%----%
       Generate_Plot(position, R, Thetas, Theta_Fail)
       q = 0;         % Setting an initial value for the loop
       while q == 0   % While this is still true 
       Start = input("Would you like to go back to the start? [type 'Y or N']: ",'s');
         if Start == "N"
           disp '  Have a nice day.'
           m = 1;
           q = 1; % Setting both values to a nonzero value terminates the program
         elseif Start == "Y"
           m = 0;
           q = 1; % Terminates the 'go back to start' piece as the user has
                  % made a selection but also loops back to the start of
                  % the program since m still equals 0
         else 
           disp(['  Please input either "Y" or "N". ' newline ' '])
                  % If neither 'Y' or 'N' are typed in (jibberish is
                  % typed in) then the program states your options and
                  % loops back to the question
         end
       end
       
   elseif Question == "IDP"
       %----%----% Generating a plot on user based Theta 2 %----%----%
       IDP_Plot(position,R,Thetas,idp)
       q = 0;         % Setting an initial value for the loop
       while q == 0   % While this is still true 
       Start = input("Would you like to go back to the start? [type 'Y or N']: ",'s');
         if Start == "N"
           disp '  Have a nice day.'
           m = 1;
           q = 1; % Setting both values to a nonzero value terminates the program
         elseif Start == "Y"
           m = 0;
           q = 1; % Terminates the 'go back to start' piece as the user has
                  % made a selection but also loops back to the start of
                  % the program since m still equals 0
         else 
           disp(['  Please input either "Y" or "N". ' newline ' '])
                  % If neither 'Y' or 'N' are typed in (jibberish is
                  % typed in) then the program states your options and
                  % loops back to the question
         end
       end 
       
   else 
       disp(['  Please input a valid option. (See "Help" for available options) ' newline ' '])
                  % If none of the options above are typed in (jibberish is
                  % typed in) then the program states your options and
                  % loops back to the start
   end
end
end

