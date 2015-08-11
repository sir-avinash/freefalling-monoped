%%%%% Estimating the energy stored in the leaf spring, the height for
%%%%% freefall to generate equivalent energy and other metrics  


%%%%% Leaf Spring props %%%%%
Y = 80*10^9; %% young's modulus
w = 0.03;    %% width of the leaf spring
h = 0.013;   %% thickness of the leaf spring
kbar = 2*Y*w*(h^3);  %% spring constant
L = 0.6;     %% free length of the spring 

%%%%% Leg Props %%%%%
m = 5; %% leg mass
l = 0.7; %% leg free length
g = 9.81; %% accelaration due to gravity
M = m*g; %%  weight

%%%%%

x = 0.075; %% desired spring compression 10 cm
SE = (kbar*x^2)/(2*L*(L-x)^2)   %% corresponding energy stored in the spring

f = (SE-m*g*l)/M %% freefall height




%%%%%%%% Estimating constant spring stiffness for the leg to compress to
%%%%%%%% half stroke when dropped from a height of 2 meters. We also assume
%%%%%%%% that it the system is critically damped. 
f = 2 - 0.7; %%% freefall length
vel = sqrt(2*g*f); %%% velocity at contact
TE = m*g*l + 0.5*m*(vel^2) ; %%% total energy at impact
max_stroke = 0.075; %%% 75 mm - damper's long stroke
x_des = max_stroke/2; %%% desired compression 

%%% spring energy = 0.5*k*x^2

k = (TE*2)/(x_des)^2; %% spring const required
xi = 1; %%damping ratio
c = 2*xi*sqrt(m*k); %% damping coefficient


