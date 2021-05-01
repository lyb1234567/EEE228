
  C2 = linspace(1e-12,50e-12,50);
  C1 = linspace(1e-12,50e-12,50);
  [X,Y]=meshgrid(C1,C2);
  Ie = 3e-3;
  gm = Ie/25e-3;
  Rpi = (1/gm)*95;
  fc=200e6;
  w =2*pi*fc;
  Lt=22e-9;
  Q=70;
  Rp=Q*w*Lt;
  C3a=4.7e-12;
  C3b=47e-12;
  Cpara=9e-12;
  Cm=0.3e-12;
  Ct=linspace(1e-12,50e-12,1000);
%   Graph_plotting of Re(Zt) and Im(Zt)
  for RE = linspace(100,470,200)
   Re = (((gm+(1/RE)+(1/Rpi)).*(-Y))+((X+Y)*((1/RE)+(1/Rpi))))./(((w^2)*X.*(Y.^2))+X*(((1/RE)+(1/Rpi))^2));
   Im = ((-((1/RE)+(1/Rpi))*((gm+(1/RE)+(1/Rpi))))-((w^2)*(X+Y).*Y))./(((w^3).*X.*(Y.^2))+(w.*X.*(((1/RE)+(1/Rpi))^2)));
 subplot(3,2,1);mesh(X,Y,Re);t=xlabel('C1');t.Color='red';t=ylabel('C2');t.Color='red';title("RE:"+RE);
 zlim([-300 -100]);
 subplot(3,2,2); mesh(X,Y,Im);t=xlabel('C1');t.Color='red';t=ylabel('C2');t.Color='red';title('Im(Zt)');
 zlim([-300 -100]);
 pause(0.01);
  end
%   choose initial value of C1,C2,RE
RE=470;
 C2 = 18e-12;
 C1 = 46e-12;
Re = (((gm+(1/RE)+(1/Rpi))*(-C2))+((C1+C2)*((1/RE)+(1/Rpi))))/(((w^2)*C1*(C2^2))+C1*(((1/RE)+(1/Rpi))^2));
Im = ((-((1/RE)+(1/Rpi))*((gm+(1/RE)+(1/Rpi))))-((w^2)*(C1+C2)*C2))/(((w^3)*C1*(C2^2))+(w*C1*(((1/RE)+(1/Rpi))^2)));

%Zot
Zot = ((1/(1i*w*C3a))+((50*(1/(1i*w*C3b)))/(50+(1/(1i*w*C3b)))));
Yot = 1/Zot;

%Zr
Yr = (((1i*w)*(Cm+Cpara))+(1/(1i*w*Lt))+(1/Rp)+(1i*w*Ct)+Yot);
Zr = 1./Yr;

% K and Zt
 Zt = complex (Re,Im);
 K = (Zr+Zt);
 subplot(3,2,3);
 plot(Ct,real(K));
 grid on
 grid minor
 t=xlabel('Ct');
 t.Color='red';
 t=ylabel('Re(K)');
 t.Color='red';
 subplot(3,2,4);
 plot(Ct,imag(K));
 grid on
 ax = gca;
 ax.GridAlpha = 0.9;
 ax.GridColor = [0.1, 0.7, 0.2];
 grid minor
 t=xlabel('Ct');
 t.Color='red';
 t=ylabel('Im(K)');
 t.Color='red';

 
 % Graph of grain against Ct
 gain=abs(real(Zt)./real(Zr));
 subplot(3,2,5);
 plot(Ct,gain);
 t=xlabel('Ct');
 t.Color='red';
 t= ylabel('gain');
 t.Color='red';
 grid on
 grid minor
 
 %Before simulation
 Ct=4.44623e-12;
 C30=20e-12;
 CD2=4.44e-12;
 C25=Ct*(CD2+C30)/(CD2+C30-Ct);
 
 %Caculate R26 and R26
 Ie=3e-3;
IR29=10*Ie;
Vbe=0.75;
R30=RE;
Vcc=5;
R29=(Vbe+Ie*R30)/(IR29);
R26=((5*R29)/(Ie*R30+Vbe))-R29;

  


  