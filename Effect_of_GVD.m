% Group Velocity Dispersion 
c0=3*10^8; e0=8.85*10^-12; L=10; T0=30; n=2.3; vgi=n/c0; psi=[0 30 -40]; % Initialize the speed of light, permittivity of free space, length of waveguide, group velocity dispersion (psi)
F= T0^2./sqrt(T0^4+16*psi.^2*L^2); % Defining parameters for gaussian pulse
T= T0^2/2./F.^2;
Iout=@(t,psi) (1/8).*c0*e0.*F.*exp(-(t-vgi*L).^2./T); % Intensity Variation w r t GVD 
t=-100:100;
figure(1)
hold on
% plot(t,Iout(t,0))
plot(t,Iout(t(:)));
title('Output Intensity Iout(t) wrt time for \psi=0 \psi>0 and \psi<0');
legend('\psi=0','\psi>0 \psi=30', '\psi<0 \psi=-40');
xlabel('Time t');
ylabel('Output Intensity Iout(t)');