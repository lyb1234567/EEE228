
  C2 = linspace(1e-12,50e-12,50);
  C1 = linspace(1e-12,50e-12,50);
  [X,Y]=meshgrid(C1,C2);
  Ie = 3e-3;
  gm = Ie/25e-3;
  Rpi = (1/gm)*95;
  fc=200e6;
  w =2*pi*fc;
  Lt=18e-9;
  Q=62;
  Rp=Q*w*Lt;
  C3a=4.7e-12;
  C3b=47e-12;
  Cpara=9e-12;
  Cm=0.3e-12;
  Ct=linspace(1e-12,50e-12,20000);
  Ctot=Cm+Cpara+((C3a*C3b)/(C3a+C3b))+Ct;
  
%   Graph_plotting of Re(Zt) and Im(Zt)
  for RE =190
  Re = (((gm+(1/RE)+(1/Rpi)).*(-Y))+((X+Y)*((1/RE)+(1/Rpi))))./(((w^2)*X.*(Y.^2))+X*(((1/RE)+(1/Rpi))^2));
  Im = ((-((1/RE)+(1/Rpi))*((gm+(1/RE)+(1/Rpi))))-((w^2)*(X+Y).*Y))./(((w^3).*X.*(Y.^2))+(w.*X.*(((1/RE)+(1/Rpi))^2)));
%  subplot(4,2,1);
%  mesh(X,Y,Re);
%  t=xlabel('C1/F');
%  t.Color='red';t=ylabel('C2/F');
%  t.Color='red';
%  t=zlabel('Re(zt)/Ω');
%  t.Color='red';
%  title("RE:"+RE+"Ω");
%  zlim([-300 -100]);
%  subplot(4,2,2); 
% mesh(X,Y,Im);t=xlabel('C1/F');t.Color='red';t=ylabel('C2/F');t.Color='red'; t=zlabel('Im(Zt)/Ω'); t.Color='red';
%  title("RE:"+RE);
%  zlim([-300 -100]);
 pause(0.0001);
  end
%   choose initial value of C1,C2,RE after optimization.
RE=190;
C2=25.6e-12;
C1=9.61e-12;
Re = (((gm+(1/RE)+(1/Rpi))*(-C2))+((C1+C2)*((1/RE)+(1/Rpi))))/(((w^2)*C1*(C2^2))+C1*(((1/RE)+(1/Rpi))^2));
Im = ((-((1/RE)+(1/Rpi))*((gm+(1/RE)+(1/Rpi))))-((w^2)*(C1+C2)*C2))/(((w^3)*C1*(C2^2))+(w*C1*(((1/RE)+(1/Rpi))^2)));

fprintf('Re:%.20f',Re);
fprintf('\n');
fprintf('Im:%.20f',Im);
fprintf('\n');

Ct=linspace(1e-12,50e-12,200);
fc=linspace(195e6,205e6,200);
w=2*pi*fc;
[A,B]=meshgrid(Ct,fc);
% Zot
Zot = ((1./(1i*2*pi*B*C3a))+((50*(1./(1i*2*pi*B*C3b)))./(50+(1./(1i*2*pi*B.*C3b)))));
Yot = 1./Zot;
% 
% 
% %Zr
Rp=Q*2*pi*B*Lt;
Yr = (1i*2*pi*B).*(Cm+Cpara)+1./(1i*Lt*2*pi*B)+1./Rp+1i*2*pi*B.*A+Yot;
Zr = 1./Yr;
% 
% % K and Zt
 Zt = complex(Re,Im);
 K = (Zr+Zt);
 
%  K as a function of Ct and Frequency
%  mesh(A,B,real(K));
%  t=xlabel('Ct/F');t.Color='red';t=ylabel('Fc/Hz');t.Color='red'; t=zlabel('Re(K)/Ω'); t.Color='red';
%   mesh(A,B,imag(K));
%  t=xlabel('Ct/F');t.Color='red';t=ylabel('Fc/Hz');t.Color='red'; t=zlabel('Im(K)/Ω'); t.Color='red';
%  subplot(4,2,3);
%  plot(Ct,real(K));
%  grid on
%  grid minor
%  t=xlabel('Ct/F');
%  t.Color='red';
%  t=ylabel('Re(K)/Ω');
%  t.Color='red';
%  subplot(4,2,4);
%  plot(Ct,imag(K));
%  grid on
%  ax = gca;
%  ax.GridAlpha = 0.9;
%  ax.GridColor = [0.1, 0.7, 0.2];
%  grid minor
%  t=xlabel('Ct/F');
%  t.Color='red';
%  t=ylabel('Im(K)/Ω');
%  t.Color='red';


 
%  Graph of gain against Ct
%  gain=abs(real(Zt)./real(Zr));
% %  subplot(4,2,5);
%  plot(Ct,gain);
%  ylim([10 50]);
%  t=xlabel('Ct/F');
%  t.Color='blue';
%  t= ylabel('gain');
%  t.Color='blue';
%  grid on
%  grid minor
%  
 
 


% Zr
% Yr = (((1i*w)*(Cm+Cpara))+(1/(1i*w*Lt))+(1/Rp)+(1i*w*Ct)+Yot);
% Zr = 1./Yr;

% K and Zt
%  Zt = complex (Re,Im);
%  K = (Zr+Zt);
%  C30=linspace(1e-12,50e-12,2000);
%  C25=linspace(1e-12,50e-12,2000);
%  [A,B]=meshgrid(C30,C25);
%  CD2=4.44e-12;
%  Ct=((CD2+A).*B)./(CD2+A+B);
%  subplot(4,2,6);mesh(A,B,Ct);t=xlabel('C30');t.Color='red';t=ylabel('C25');t.Color='red';title("Ct");
%  gain=abs(real(Zt)./real(Zr));
%  %Caculate R29 and R26
%  Ie=3e-3;
% IR29=10*Ie;
% Vbe=0.75;
% R30=RE;
% Vcc=5;
% R29=(Vbe+Ie*R30)/(IR29);
% R26=((5*R29)/(Ie*R30+Vbe))-R29;

%fix C30 and CD2,check C25 and Ct
% C30=13e-12;
% CD2=18.18e-12;
% % Ct=17.06e-12;
Ct=linspace(6e-12,18e-12,1000);
C25=(Ct.*(CD2+C30))./(CD2+C30-Ct);
% subplot(4,2,7);
% plot(Ct,C25);
% t=xlabel('Ct/F');
%  t.Color='blue';
%  t= ylabel('C25/F');
%  t.Color='blue';
%   grid on
%  grid minor
 
 %fix Ct and C30,check CD2 and C25;
 Ct=17.062e-12;
 C30=13e-12;
 CD2=[37.35 25.88 18.18 12.08 7.27 4.44 3.4 2.96 2.72 2.5 2.38];
 C25=(Ct.*(CD2+C30))./(CD2+C30-Ct);
%  subplot(4,2,8);
 plot(CD2,C25);
 t=xlabel('CD2/pF');
 t.Color='blue';
 t= ylabel('C25/F');
 t.Color='blue';
  grid on
 grid minor

 
%  Yr = (((1i*w)*(Cm+Cpara))+(1/(1i*w*Lt))+(1/Rp)+(1i*w*Ct)+Yot);
%  Zr = 1/Yr;
%  Zt = complex (Re,Im);
%  K = (Zr+Zt);
%  gain=abs(real(Zt)./real(Zr));
%  format shortE
%  fprintf('Ct:%.20f',Ct);
%  fprintf('\n');
%  fprintf('imag(K):%.3f',imag(K));
%  fprintf('\n');
%  fprintf('gain:%.20f',gain);
%  fprintf('\n');
%  fprintf('RE:%d',RE);
%  fprintf('\n');
%  fprintf('C1:%.20f',C1);
%  fprintf('\n');
%  fprintf('C2:%.20f',C2);
%  fprintf('\n');
%  fprintf('R26:%.3f',R26);
%  fprintf('\n');
%  fprintf('R29:%.3f',R29);
%  fprintf('\n')
%  



%
% Vpk_to_pk=778e-3;
% Vrms=Vpk_to_pk/(2*sqrt(2));
% P=Vrms^2/50;
% %print Ct1 Ct2 and Ct3
% fprintf('Ct1:%.20f',Ct1)
% fprintf('\n')
% fprintf('F1:%.4f',F1)
% fprintf('\n')
% fprintf('Ct2:%.20f',Ct2)
% fprintf('\n')
% fprintf('F2:%.4f',F2)
% fprintf('\n')
% fprintf('Ct3:%.20f',Ct3);
% fprintf('\n')
% fprintf('F3:%.4f',F3)
% fprintf('\n')
% fprintf('P:%.10f',P);
% fprintf('\n');

  


  