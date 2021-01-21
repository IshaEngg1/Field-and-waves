% Radiation Pattern for dipole antenna
u0=4*pi*10^-7; w=500*10^6; Z=377; c=3*10^8; lam=c/w; r=20; k=2*pi/lam; d=[lam/4 lam/2 3*lam/4 lam 3*lam/2];
S=@(Q,m) ((u0*w*(cos(k.*d(m).*cos(Q))-cos(k.*d(m)))./(r.*sin(Q).*pi)).^2./(8.*Z));
Q=0:0.01:2*pi;
figure(2)
polar(Q,S(Q,5));
title('Radiation Pattern 3\lambda/2');
figure(1)
for m=1:4
subplot(2,2,m)
polar(Q,S(Q,m));
n=[1 1 3 1];
de=[4 2 4 1];
title(['Radiation Pattern d = h/2 = ',num2str(n(m)),'\lambda/',num2str(de(m))])
end