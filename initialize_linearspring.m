
clc
clear all

% Initial Conditions
g  = 9.81;
alpha0 = 90*pi/180; %rad  % landing angle 
x0=2;
dy0 = 0; %m/s
dx0 = 0;

% **************** %
% LEG PARAMETERS %
% **************** %

m = 8;
Lleg = 1;

for i=1:4

%%% Free Fall Params %%%
y0 = (2*i)*Lleg; % free fall height

%%% Energy at Impact %%%
v1 = sqrt(2*g*(y0-Lleg));
lx = Lleg/2;


k1 = m*(v1^2 + g*Lleg)/(lx^2);
k = 941;
 
eta = 1; %(v1/4.42)*1.0;  %% critical damping
c = 2*eta*sqrt(m*k1); % 
% c = 173.5;

sim('landing_control')
GRF{i}=grf.Data;
Tg{i}=grf.time;
X{i}=x;
DX{i}=dx.Data;
T{i} =dx.time;
end

%  set(0,'DefaultLineLineWidth',1.5,'DefaultAxesColorOrder',[0 0 1],...
%    'DefaultAxesLineStyleOrder','-|--|:|-.', 'DefaultLineMarkerSize',1)

figure(2)

subplot(1,3,1)
line1 = plot(Tg{1},GRF{1,1},'b-',Tg{2},GRF{1,2},'b--',Tg{3},GRF{1,3},'b:',Tg{4},GRF{1,4},'b-.');
% xlabel('Time (s)')
ylabel('Ground Reaction Force (N)')
axis('tight')

subplot(1,3,2)
line2=plot(T{1},X{1},T{2},X{2},T{3},X{3},T{4},X{4});
% xlabel('Time (s)')
ylabel('Displacement (m)')
axis('tight')
% legend('h=2m','h=4m','h=6m','h=8m')
xlabel('Time (s)')
% figure(4)
subplot(1,3,3)
line3=plot(T{1},DX{1},T{2},DX{2},T{3},DX{3},T{4},DX{4});
% xlabel('Time (s)')
ylabel('Velocity (m/s)')
axis('tight')
% legend('h=2m','h=4m','h=6m','h=8m')

hL = legend('h=2m','h=4m','h=6m','h=8m');

% max_stroke = [Lleg-min(X{1}),Lleg-min(X{2}),Lleg-min(X{3}),Lleg-min(X{4})];
% save('dyn_kc.mat','X','DX','GRF','T','Tg','max_stroke')








%  set(gcf, 'PaperPositionMode', 'manual');
%     set(gcf, 'PaperUnits', 'inches');
%     set(gcf, 'PaperPosition', [0.19 4.33 0.19 1.57]);  % This is the final size of the figure
%     print('-f1','-dpng','test.png')% save figure as png
%     
%     set(gcf, 'PaperUnits','centimeters', 'PaperPosition',[0 0 10.5 4.5])
%     print('-f2','-dpng','test.png')
%     
%     
%     for i=1:4
%     grf=max(GRF{i});
%     grf_pd(i)=grf(2);
% end
% 
% stroke_pd = max_stroke;
% 
% 
% figure(2)
% 
% subplot(1,2,1)
% line1 = plot(height,grf_pd,'r-v',height,grf_ad,'b-o');
% xlabel('Drop height (m)')
% ylabel('Peak Impact Force (N)')
% axis('tight')
% 
% subplot(1,2,2)
% line2=plot(height,stroke_pd,'r-v',height,stroke_ad,'b-o');
% % xlabel('Time (s)')
% ylabel('Peak Displacment (m)')
% axis('tight')
% xlabel('Drop height (m)')
% hL = legend('Passive damping','Active damping');