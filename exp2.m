%无折射椭圆重建
clc;clear;
%空间中的椭圆曲线：由参数方程定义，长轴、短轴向量，中心点坐标
%%
%生成空间中的椭圆曲线
% a_vec=[3 12 -2]';
% b_vec=[-9 2 -1.5]';
% a_vec=[3 8 -2]';
% b_vec=[-9 3 -1.5]';
% a_vec=a_vec/norm(a_vec)*6*1.01;
% b_vec=b_vec/norm(b_vec)*6;
addpath('D:\eyetrack_matlab\image_process\ellipse_rebuild');
% for i=1:360
%     for j=1:90+
%         i
%         j
% [x y z]=sph2cart(i*pi/180,j*pi/180,1);
[x y z]=sph2cart(0,pi/2,1);
n_vec=[x y z]';

[a_vec,b_vec]=create_ellip(n_vec,0,1/0.96,10);

% [x y z]=sph2cart(0,pi/2-40*pi/180,100);
ellip_center=[0 0 100]';
% ellip_center=[x y z]';

%%
% n_vec=cross(a_vec,b_vec);
n_vec=n_vec/norm(n_vec)*10;

ellip_points=ellip_curve_points3d(a_vec,b_vec,ellip_center,1000);
% theta=1:360;
% ellip_points=[6*sin(theta/180*pi);6.01*cos(theta/180*pi);100*ones(1,360)];
camera1=[0 0 0]';

v1=[0,0,1]'; 
vx=[1,0,0]';
vy=cross(v1,vx); %以camera1作为新坐标系

ellip_scene_points=to_scene(camera1,ellip_points,v1);


n_rebuild=elps_rebuild(ellip_scene_points')*10;
min(abs(acos((abs(dot(n_rebuild',repmat(n_vec,1,2))./vecnorm(n_rebuild')))/norm(n_vec))*180/pi))
% t(i,j)=min(abs(acos((abs(dot(n_rebuild',repmat(n_vec,1,2))./vecnorm(n_rebuild')))/norm(n_vec))*180/pi));
% plot_exp2;
%     end
% end
