%graphically or numerically, and find the propagation wave number,beta of the first propagating mode with lambda0 = 1:5um.
%Dielevctric Slab Waveguide
%Even and Odd modes
%Mode profile
c0=3*10^8; n1=1.5; n2=1.2; lambda0=1.5*10^-6; c1=c0/n1;   %initialization
lambda1=lambda0/n1; w=c1/lambda1; h=4*10^-6; k0=w/c1; h1=5*10^-6;

%Find the Graphical Solution to wavenumber and modes in the dielectric waveguide
f1=@(x) x.*(n2^2/n1^2).*tan(x/2);
f2=@(x) -x.*(n2^2/n1^2).*cot(x/2);
r=k0^2*h^2*sqrt(n1^2-n2^2);
r1=k0^2*h1^2*sqrt(n1^2-n2^2);
y=0; x1=0;
th=0:pi/100:pi/2; xunit=r*cos(th)+x1; yunit=r*sin(th)+y;
xunit1=r1*cos(th)+x1; yunit1=r1*sin(th)+y;
x=0:0.001:15;
%plot(x,f1(x(:)),'*')
fplot(f1)
hold on
fplot(f2)
%plot(x,f2(x(:)),'*')
hold on
plot(xunit,yunit);
% plot(xunit1,yunit1);
line([0 15],[0 0]);
axis([0 15 -40 40]);
% % % legend('tan')
% k1x=x(Inter);
k1x=[2.885/h 5.719/h  8.464/h 11.24/h 13.55/h];
beta=sqrt((k0^2*n1^2)-k1x.^2);
