%exp2 plot

%画出椭圆
figure(1)
plot3(ellip_points(1,:),ellip_points(2,:),ellip_points(3,:),'r-');
hold on
plot3(ellip_scene_points(1,:),ellip_scene_points(2,:),ellip_scene_points(3,:),'b-');
hold on

% %画出a b向量
% plot3(ellip_center(1)+[0 a_vec(1)],ellip_center(2)+[0 a_vec(2)],ellip_center(3)+[0 a_vec(3)],'r-');
% hold on
% plot3(ellip_center(1)+[0 b_vec(1)],ellip_center(2)+[0 b_vec(2)],ellip_center(3)+[0 b_vec(3)],'r-');
% hold on

plot3(ellip_center(1)+[0 n_rebuild(1,1)],ellip_center(2)+[0 n_rebuild(1,2)],ellip_center(3)+[0 n_rebuild(1,3)],'g-');
hold on
plot3(ellip_center(1)+[0 n_rebuild(2,1)],ellip_center(2)+[0 n_rebuild(2,2)],ellip_center(3)+[0 n_rebuild(2,3)],'g-');
hold on
plot3(ellip_center(1)+[0 n_vec(1)],ellip_center(2)+[0 n_vec(2)],ellip_center(3)+[0 n_vec(3)],'b-');

axis equal
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');