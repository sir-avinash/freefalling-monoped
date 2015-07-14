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
