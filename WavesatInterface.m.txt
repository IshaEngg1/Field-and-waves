% the electric field intensities, E^2 (2D plot) of the plane wave in both media for the angles i1= 30 degree, and i2 = 53:13 degree, for both s- and p-polarization waves
n1=1.5; n2=2; fi=[30 atand(n2/n1)]; c0=3*10^8; lam=540e-9; k2=n2*2*pi/(lam*c0); k1=n1*2*pi/(lam*c0); w=2*pi/lam;
x=0:0.01:1;
y=0:0.01:1;
% [X,Y]=meshgrid(x,y);
Exi=zeros(101,101); Exr=zeros(101,101); Eyi=zeros(101,101); Eyr=zeros(101,101); Ezi=zeros(101,101); Ezr=zeros(101,101); Ezt=zeros(101,101); Ext=zeros(101,101); Eyt=zeros(101,101);
cosft=zeros(1,2); sinft=zeros(1,2);
for l=1:1:2
rs=(n1.*cosd(fi(l))-sqrt(n2^2-n1^2.*sind(fi(l)).^2))/(n1.*cosd(fi(l))+sqrt(n2^2-n1^2.*sind(fi(l)).^2));
rp=(n1*sqrt(n2^2-n1^2.*sind(fi(l)).^2)-n2^2.*cosd(fi(l)))/(n1*sqrt(n2^2-n1^2.*sind(fi(l)).^2)+n2^2.*cosd(fi(l)));
ts=1+rs;
tp=(1+rp)*n1/n2;
cosft(l)=sqrt(n2^2-n1^2.*sind(fi(l)).^2)/n2;
sinft(l)=sind(fi(l)).*n1/n2;
for n=1:1:101
    for m=1:1:101
        %p polarization
Exi(n,m)=cosd(fi(l)).^2.*exp(-2.*1i*(k1.*sind(fi(l)).*x(n)-k1.*cosd(fi(l)).*y(m)));
Exr(n,m)=rp^2.*cosd(fi(l)).^2.*exp(-2.*1i*(k1.*sind(fi(l)).*x(n)+k1.*cosd(fi(l)).*y(m)));
Eyi(n,m)=sind(fi(l)).^2.*exp(-2.*1i*(k1.*sind(fi(l)).*x(n)-k1.*cosd(fi(l)).*y(m)));
Eyr(n,m)=rp^2.*sind(fi(l))^2.*exp(-2.*1i*(k1.*sind(fi(l)).*x(n)+k1.*cosd(fi(l)).*y(m)));
Ext(n,m)=tp^2.*cosft(l).^2.*exp(-2.*1i*(k2.*sinft(l).*x(n)-k2.*cosft(l).*y(n)));
Eyt(n,m)=tp^2.*sinft(l).^2.*exp(-2.*1i*(k2.*sinft(l).*x(n)-k2.*cosft(l).*y(n)));
%s polarization
Ezi(n,m)=exp(-2.*1i*(k1.*sind(fi(l)).*x(n)-k1.*cosd(fi(l)).*y(m)));
Ezr(n,m)=rs^2.*exp(-2.*1i*(k1.*sind(fi(l)).*x(n)+k1.*cosd(fi(l)).*y(m)));
Ezt(n,m)=ts^2.*exp(-2.*1i*(k2.*sinft(l).*x(n)-k2.*cosft(l).*y(n)));
    end
end
figure(1)
subplot(2,2,2*l-1)
imagesc(x,y,real(Exr+Eyr+Exi+Eyi));
title(['p-polarization medium 1  ',num2str(fi(l)),'\circ'])
xlabel('X Direction')
ylabel('Y Directon')
zlabel('Electric Field Intensity E^2')
subplot(2,2,2*l)
imagesc(x,y,real(Ext+Eyt));
title(['p-polarization medium 2  ',num2str(fi(l)),'\circ'])
xlabel('X Direction')
ylabel('Y Directon')
zlabel('Electric Field Intensity E^2')
figure(2)
subplot(2,2,2*l-1)
imagesc(x,y,real(Ezr+Ezi));
title(['s-polarization medium 1  ',num2str(fi(l)),'\circ'])
xlabel('X Direction')
ylabel('Y Directon')
zlabel('Electric Field Intensity E^2')
subplot(2,2,2*l)
imagesc(x,y,real(Ezt));
title(['s-polarization medium 2  ',num2str(fi(l)),'\circ'])
xlabel('X Direction')
ylabel('Y Directon')
zlabel('Electric Field Intensity E^2')
end