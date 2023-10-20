x=2*pi*[1:200]/200*180/pi;
y=(pi/3*[1:200]/200)*180/pi;
[X ,Y]=meshgrid(x,y);
% % load('res1.mat')
surf(X,Y,res');

% Q=reshape(P,[3 40000])
% plot3(Q(1,:),Q(2,:),Q(3,:),'r*')
% hold on
% plot3(0,0,0,'bx')