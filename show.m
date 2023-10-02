
figure(1)
plot3(P1_list(:,1),P1_list(:,2),P1_list(:,3),'r-');
hold on
plot3(Prf_list(:,1),Prf_list(:,2),Prf_list(:,3),'b-');
hold on
plot3(Ps_list(:,1),Ps_list(:,2),Ps_list(:,3),'m-');
plot3(P0(1),P0(2),P0(3),'go');
hold on 
plane=P0+v;
plot3([P0(1),plane(1)],[P0(2),plane(2)],[P0(3),plane(3)],'g-');

axis equal
% axis([-10 10 -Inf Inf -Inf Inf]);
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');

% figure(2)
% 
% plot3(Ps_list(:,1),Ps_list(:,2),Ps_list(:,3),'b-');
% hold on
% plot3(P0(1),P0(2),P0(3),'go');
% xlabel('X轴');
% ylabel('Y轴');
% zlabel('Z轴');
axis equal