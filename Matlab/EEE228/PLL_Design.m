%charge pump current
I_max=2.5e-3;
% bandwidth
fb=1e3;
wp=2*pi*fb;
%Prescaler value
P=8;
%PLL Open Loop Phase Margin
phase=(55/180)*pi;
% chosen design frequency
f=201e6;

%Kphi
Kphi=I_max/(2*pi);

%Kvco
Kvco=3e6;
%Reference frequency
Fref=10e6;

%comparsion frequency
Fcom=100e3;

%Loop division raito
N=f/Fcom;

%T1
T1=(sec(phase)-tan(phase))/(wp);

%T2
T2=1/(T1*wp*wp);


%C1
C1=(T1/T2)*((Kphi*Kvco)/(N*wp*wp))*sqrt((1+(wp*T2)^2)/(1+(wp*T1)^2));


%C2
C2=C1*((T2/T1)-1);

%R1
R1=T2/C2;

%C3
R2=5600;
C3=1/(10*wp*R2);


fprintf('wp:%.3f rads/s',wp);
fprintf('\n');
fprintf('\n');
fprintf('Kvco:%.d',Kvco);
fprintf('\n');
fprintf('\n')
fprintf('N:%.d',N);
fprintf('\n');
fprintf('\n')
fprintf('k_phi:%.4f',Kphi);
fprintf('\n')
fprintf('\n');
fprintf('phase margin:%.3f rad ',phase);
fprintf('\n');
fprintf('T1:');
disp(T1);
fprintf('T2:');
disp(T2);
fprintf('R1:   %.2f ',R1);
fprintf('\n');
fprintf('\n');
fprintf('C1:');
disp(C1)
fprintf('C2:');
disp(C2);
fprintf('C3:');
disp(C3)




