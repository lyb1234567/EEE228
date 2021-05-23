clc;
clear all;
close all;
%%------------DC Analysis--------------
R26 = 6800;
R29 = 1800;
R30 = 440;
range = 50;
RE = linspace(1,470,200);
C1 = linspace(1e-12,50e-12,range);
C2 = linspace(1e-12,50e-12,range);
Vcc = 5;
Vbe = 0.85;
hfe = 95;
IeR30plusVbe = Vcc*(R29/(R26+R29));
Ie = (IeR30plusVbe - Vbe)./RE;
gm = Ie./25e-3;
re = 1./gm;
Rpi = hfe.*re;
Cm = 0.37e-12;

%%------------AC Analsis---------

fc= 200e6;
omega = 2*pi*fc;
Re_Zt = zeros(length(RE),length(C1),length(2));
Im_Zt = zeros(length(RE),length(C1),length(2));
for ix0=1:length(RE)
    for ix1=1:length(C1)
        for ix2=1:length(C2)
            Re_Zt(ix0,ix1,ix2) = ( (gm(ix0)+(1./(RE(ix0)))+(1./(Rpi(ix0))))*(-C2(ix2)) + (C1(ix1)+C2(ix2))*((1./(RE(ix0)))+(1./(Rpi(ix0)))))/((omega^2)*(C1(ix1))*((C2(ix2))^2)+(C1(ix1))*(1/(RE(ix0)) + 1/(Rpi(ix0)))^2);
            Im_Zt(ix0,ix1,ix2) = (-(1./RE(ix0) +1./Rpi(ix0))*(gm(ix0)+ 1/(RE(ix0))+1/(Rpi(ix0))) - (omega^2));
        end
    end
end

%%------------Parallel Calculation of Zt and Cm-----

Xc_Cm = 1i*1/(omega*Cm);
Zt_aux = Re_Zt + 1i*Im_Zt;
Zt = (Zt_aux*Xc_Cm)./(Zt_aux + Xc_Cm);
figure;
Zt_mesh = zeros(length(C1),length(C2));
