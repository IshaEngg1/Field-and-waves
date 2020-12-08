% Mode profile for circular waveguide Bessel function 
c=3*10^8; R=0.01; w=30*10e6; e=8.85*10^-12; u=4*pi*10e-7;
jmnd(1,1)=3.8317; jmnd(2,1)=1.8412; jmnd(3,1)=3.0542;
kc=jmnd./R; kz=sqrt(w^2*e*u-kc.^2); wc=kc.*c;
syms x
Jm=@(x,m) besselj(m,x); 
Jmd=@(x,m) (besselj(m-1,x) - besselj(m+1,x))/2;
roh=0:0.001:0.01;
phi=0:pi/30:(2*pi);
phi0=pi/2;

for m=0:2
        for i=1:1:11
            for j=1:1:61
       Ex(j,i,m+1)=((w.*u./kc(m+1,1)^2./roh(i)).*m.*Jm(kc(m+1,1)*roh(i),m)*sin(m.*phi(j)+phi0)).^2;
       Ey(j,i,m+1)=((w.*u/kc(m+1,1)).*Jmd(kc(m+1,1)*roh(i),m+1)*cos(m.*phi(j)+phi0)).^2;
            end
        end
end
[roh,phi]=meshgrid(0:0.001:0.01,0:pi/30:(2*pi));
x=roh.*cos(phi);
y=roh.*sin(phi);
h=polar(x,y);
subplot(1,3,1)
surf(x,y,Ex(:,:,1)+Ey(:,:,1));
view(2)
title('TE_0_1')
subplot(1,3,2)
surf(x,y,Ex(:,:,2)+Ey(:,:,2));
title('TE_1_1')
view(2)
subplot(1,3,3)
surf(x,y,Ex(:,:,3)+Ey(:,:,3));
title('TE_2_1')
view(2)