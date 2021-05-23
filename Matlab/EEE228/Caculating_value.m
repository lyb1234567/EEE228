    
  RE = 330;
  C2 = 27e-12;
  C1 = 15e-12;
  Ie = 3e-3;
  gm = Ie/25e-3;
  Rpi = (1/gm)*95;
  fc=200e6;
  w =2*pi*fc;
  Lt=22e-9;
  Q=62;
  Rp=Q*w*Lt;
  C3a=4.7e-12;
  C3b=47e-12;
  Cpara=9e-12;
  Cm=0.3e-12;
  Ct=0.00000000004999019951;

% %5.1
Re = (((gm+(1/RE)+(1/Rpi))*(-C2))+((C1+C2)*((1/RE)+(1/Rpi))))/(((w^2)*C1*(C2^2))+C1*(((1/RE)+(1/Rpi))^2));

% %5.2
Im = ((-((1/RE)+(1/Rpi))*((gm+(1/RE)+(1/Rpi))))-((w^2)*(C1+C2)*C2))/(((w^3)*C1*(C2^2))+(w*C1*(((1/RE)+(1/Rpi))^2)));

% %5.4
Zot = ((1/(1i*w*C3a))+((50*(1/(1i*w*C3b)))/(50+(1/(1i*w*C3b)))));
Yot = 1/Zot;

% %5.3
Yr = (((1i*w)*(Cm+Cpara))+(1/(1i*w*Lt))+(1/Rp)+(1i*w*Ct)+Yot);
Zr = 1/Yr;

% %5.5
Zt = complex (Re,Im);
k = (Zr+Zt);

%5.6
% v = ((Vcc*(R29/(R26+R29)))-(Ie*RE));
% r = ((Vbe+(Ie*RE))/Vcc);

%5.7
% gm = (1/re);
% gm = (Ie/25e-3);

%5.8
% Rpi = (B*re);

%5.9
% Ct = (((CD2+C30)*C25)/((CD2+C30)+C25));

%5.10
Cot=(C3a*C3b)/(C3a+C3b);

%5.11
Fr=fc;
Ct=1.45434072e-11;
 C30=35e-12;
 CD2=4.44e-12;
 C25=(Ct*(CD2+C30))/(CD2+C30-Ct);

%5.12
gain=abs(real(Zt)/real(Zr));


fprintf('Re:%f',Re)
fprintf('\n')
fprintf('Im:%f',Im)
fprintf('\n')
fprintf('\n')
fprintf('gain:%f',gain);
fprintf('\n')
fprintf('k:%f%+fj\n', real(k), imag(k));



% When you go to graph the real and imaginary functions, just look them up
%  in the matlab documentation in the top right search bar

% This isn't my actual loop for plotting my graph but the code can be
% adapted to allow it to work for the design exercise

% for i=1:1e-2:10
% y = (i^2);
%
% plot(i,y,'c--.');
%
% end