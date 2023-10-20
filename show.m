[x,y,z]=ellipsoid(0,0,0,a0,a0,c0,20);

figure(1)
s=surf(x,y,z);
s.FaceAlpha=0;
s.LineStyle=":";
s.LineWidth=0.25;
hold on
plot3(P1_list(:,1),P1_list(:, 2),P1_list(:,3),'r-');
hold on
plot3(Prfr_list(:,1),Prfr_list(:,2),Prfr_list(:,3),'b-');
hold on
plot3(Ps_list_refraction(:,1),Ps_list_refraction(:,2),Ps_list_refraction(:,3),'m-');
plot3(P0(1),P0(2),P0(3),'go');
hold on 
plane=P0+v;
plot3([P0(1),plane(1)],[P0(2),plane(2)],[P0(3),plane(3)],'g-');

axis equal
axis([-50 50 -Inf Inf -Inf Inf]);
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');
%%
figure(2)
s=surf(x,y,z);
s.FaceAlpha=0;
s.LineStyle=":";
s.LineWidth=0.25;
hold on
plot3(P0(1),P0(2),P0(3),'go');
hold on 
plot3(glint(1),glint(2),glint(3),'ro');
hold on 
plot3(g_rfl(1),g_rfl(2),g_rfl(3),'rx');
hold on 
plot3(g_scene(1),g_scene(2),g_scene(3),'r*');
hold on 
plane=P0+v;
plot3([P0(1),plane(1)],[P0(2),plane(2)],[P0(3),plane(3)],'g-');
axis equal
axis([-50 50 -Inf Inf -Inf Inf]);
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');