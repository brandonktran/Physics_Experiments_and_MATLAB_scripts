%%
forward_1=[0 0.3 0.5 0.8 1.0 1.3 1.5 1.8 2 2.3 2.5];
forward_2=[2.5 2.3 2 1.8 1.5 1.3 1 0.8 0.5 0.3 0];
reverse_1=[0.3 0.5 0.8 1 1.3 1.5 1.8 2 2.3 2.5];
reverse_2=[2.5 2.3 2 1.8 1.5 1.3 1 0.8 0.5 0.3 0];
B_1=[0 7.44 12.46 20.89 26.87 34.8 40.7 49.4 55.3 64 69.8];
B_2=[69.8 65 57.2 51.6 43.3 37.6 29.5 23.77 15.04 9.4 0.83];
B_3=[-7.5 -13.02 -21.86 -27.5 -35.8 -41.6 -50.7 -56.5 -65.1 -70.7];
B_4=[-70.7 -66.2 -58.2 -52.7 -44 -38.3 -30.1 -24.78 -16.18 -10.39 -2.22];

x = linspace(0,2.5);
p1 = polyfit(forward_1,B_1,1);
y1 = polyval(p1,x);
p2 = polyfit(forward_2,B_2,1);
y2 = polyval(p2,x);
p3 = polyfit(reverse_1,B_3,1);
y3 = polyval(p3,x);
p4 = polyfit(reverse_2,B_4,1);
y4 = polyval(p4,x);

figure(1)
hold on
plot(x,y1, 'k')
plot(x,y2, '-.k')
plot(x,y3, 'r')
plot(x,y4, '-.r')
plot(forward_1, B_1, 'kx')
plot(forward_2, B_2, 'k*')
plot(reverse_1, B_3, 'rx')
plot(reverse_2, B_4, 'r*')
ylabel('Magnetic Field B (mT)')
xlabel('Current (A)')
title('Magnetic Field Strength B vs Magnet Current I_{m}')
legend(sprintf('Increasing Current, y=%.3f{}x%.3f',p1(1),p1(2)), sprintf('Decreasing Current, y=%.3f{}+x%.3f',p2(1),p2(2)),sprintf('Increasing Current, y=%.3f{}+x%.3f',p3(1),p3(2)),sprintf('Decreasing Current, y=%.3f{}x%.3f',p4(1),p4(2)), 'Location','NorthWest'); 
grid on
hold off 

%%
forward_1=[0 0.3 0.5 0.8 1.0 1.3 1.5 1.8 2 2.3 2.5];
forward_2=[2.5 2.3 2 1.8 1.5 1.3 1 0.8 0.5 0.3 0];
reverse_1=[0.3 0.5 0.8 1 1.3 1.5 1.8 2 2.3 2.5];
reverse_2=[2.5 2.3 2 1.8 1.5 1.3 1 0.8 0.5 0.3 0];
B_1=[0 7.44 12.46 20.89 26.87 34.8 40.7 49.4 55.3 64 69.8]*10;
B_2=[69.8 65 57.2 51.6 43.3 37.6 29.5 23.77 15.04 9.4 0.83]*10;
B_3=[-7.5 -13.02 -21.86 -27.5 -35.8 -41.6 -50.7 -56.5 -65.1 -70.7]*10;
B_4=[-70.7 -66.2 -58.2 -52.7 -44 -38.3 -30.1 -24.78 -16.18 -10.39 -2.22]*10;

x = linspace(0,2.5);
p1 = polyfit(forward_1,B_1,1);
p1
y1 = polyval(p1,x);
p2 = polyfit(forward_2,B_2,1);
y2 = polyval(p2,x);
p3 = polyfit(reverse_1,B_3,1);
y3 = polyval(p3,x);
p4 = polyfit(reverse_2,B_4,1);
y4 = polyval(p4,x);

figure(2)
hold on
err=4*ones(1,11)
err1=4*ones(1,10)
plot(x,y1, 'k')
plot(x,y2, '-.k')
plot(x,y3, 'r')
plot(x,y4, '-.r')
errorbar(forward_1, B_1, err, 'kx')
errorbar(forward_2, B_2,err, 'k*')
errorbar(reverse_1, B_3,err1, 'rx')
errorbar(reverse_2, B_4,err, 'r*')
ylabel('Magnetic Field B (G)')
xlabel('Current (A)')
title('Magnetic Field Strength B vs Magnet Current I_{m}')
legend(sprintf('Increasing Current, y=%.3f{}x%.3f',p1(1),p1(2)), sprintf('Decreasing Current, y=%.3f{}x+%.3f',p2(1),p2(2)),sprintf('Increasing Current, y=%.3f{}x+%.3f',p3(1),p3(2)),sprintf('Decreasing Current, y=%.3f{}x%.3f',p4(1),p4(2)), 'Location','NorthWest'); 
grid on
hold off 

%% reduced chisquared for gauss
chi1=[];
 for i=1:length(forward_1)
     z = (B_1(i)-(p1(1)*forward_1(i)+p1(2)))^2;
     chi1= [chi1; z];
 end
 reducedchi1=(sum(chi1))/9

 chi2=[];
 for i=1:length(forward_2)
     z = (B_2(i)-(p2(1)*forward_2(i)+p2(2)))^2;
     chi2= [chi2; z];
 end
 reducedchi1=(sum(chi2))/9
 
  chi3=[];
 for i=1:length(reverse_1)
     z = (B_3(i)-(p3(1)*reverse_1(i)+p3(2)))^2;
     chi3= [chi3; z];
 end
 reducedchi1=(sum(chi3))/8

  chi4=[];
 for i=1:length(reverse_2)
     z = (B_4(i)-(p4(1)*reverse_2(i)+p4(2)))^2;
     chi4= [chi4; z];
 end
 reducedchi1=(sum(chi4))/9