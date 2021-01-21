% the reflectances, Rs and Rp, for s- and p-polarized plane waves as a function of the incident angle.
Z1=251.33; Z2=188.5;
x=0:1:90;
for n=1:91
Rp(n)= (( (Z2*cosd(asind(0.75*sind(x(n)))))  - (Z1*cosd(x(n))) )/( (Z2*cosd(asind(0.75*sind(x(n))))) + (Z1*cosd(x(n))) )).^2;
Rs(n)= (( (Z2*cosd(x(n))) - (Z1*cosd(asind(0.75*sind(x(n))))) )/( (Z2*cosd(x(n))) + (Z1*cosd(asind(0.75*sind(x(n))))) )).^2;
end
plot(x,Rp,'b',x,Rs,'g');
legend('p-polarization','s-polarization')
xlabel('incident angle \phii');
ylabel('Reflectance Rp and Rs');
title('Reflectance Rp and Rs Vs incident angle \phii')