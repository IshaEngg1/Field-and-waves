%Finding roots to the bessel function and Plotting the bessel function for circular waveguides
syms p
x=0:0.1:20;
Jm=@(x,m) (-1).^p.*(x/2).^(2*p+m)./(factorial(m+p).*factorial(p));
Jma=@(x) sqrt(2./(pi.*x));
Nma=@(x) -sqrt(2./(pi.*x));
J=zeros(201,5);
N=zeros(201,5);
% for n=1:3
for m=0:1:4
% J(1:201,m+1)=symsum(Jm(x(:),m),p,[0 inf]);
J(1:201,m+1)=besselj(m,x);
N(1:201,m+1)=bessely(m,x);
% Ja(1:201,m+1)=besseli(m,x,1);
% Na(1:201,m+1)=besselk(m,x,1);
A=sqrt(J.^2+N.^2);
end
subplot(1,2,1)
line([0,20],[0,0],'color','black');
hold on
plot(x,J(1:201,1),x,J(1:201,2),x,J(1:201,3),x,J(1:201,4),x,J(1:201,5),x,Jma(x(1:201)));
legend('J_0','J_1','J_2','J_3','J_4','Asymptotic');
xlabel('x');
ylabel('Bessel function');
title('Bessel Function for Modes m=0,1,2,3,4');
subplot(1,2,2)
line([0,20],[0,0],'color','black');
hold on
plot(x,N(1:201,1),x,N(1:201,2),x,N(1:201,3),x,N(1:201,4),x,N(1:201,5),x,Nma(x(1:201)),x,Jma(x(1:201)));
axis([-0.1 20.2 -2 0.6])
legend('N_0','N_1','N_2','N_3','N_4','Asymptotic');
xlabel('x');
ylabel('Neumann function');
title('Neumann Function for Modes m=0,1,2,3,4');

% Roots of Bessel Function
for m=0:1
    for i =1:4
        initialJ=2+m+(i-1)*pi;
        initialN=2.4+1.2474*m+(i-1)*pi;
        rJ(i,m+1)=fzero(@(z) besselj(m,z),initialJ);
        rN(i,m+1)=fzero(@(z) bessely(m,z),initialN);
    end
end
fprintf('Roots of Bessel Functon of 1st kind are.');
rJ
fprintf('Roots of Bessel Functon of 2nd kind are.');
rN