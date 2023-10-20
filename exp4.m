 %叉乘仿真光斑和相机重合-椭圆边缘折射确定中心

a0=10;c0=8;
N0=1;N1=1.33;
para=[a0,c0,N0,N1]; %参数

% camera1=[5 50 100]';
% camera2=[-5 47 99]';  

camera1=[20 20 40]';
camera2=[10 20 40]';  
% glint1=[20 30 40]';
% glint2=[10 30 40]'; 

v1=[-1,-6,-10]'; 
vx=[-4,-1,1]';
vy=cross(v1,vx); %以camera1作为新坐标系
R1=[vx vy v1];
R1=R1./vecnorm(R1);

v2=[-0.95 -5.9 -10.5]';
vx=[-4 -1 0.92380952]';
vy=cross(v1,vx);
R2=[vx vy v1];
R2=R2./vecnorm(R2);

% glint1=[3 40 105]';
% glint2=[-1 55 97]';
% glint1=[-1.5811 53.2434 101.0811]';
% glint2=[1.5811 43.7566 97.9189]';
pupil=[0,0,6]';

num=16;
t=[1:num]*2*pi/num;
r=2;
pupil_boundPoints=[r*cos(t);r*1.01*sin(t);ones(size(t))*6];


%%

% num=1;
% data=zeros(3,7,num);
% for i=1:num
% theta=rand(1,2)*0.5*pi-0.25*pi;
P=zeros(3,50,50);
for i=1:50
    for j=1:50

theta=[2*pi*i/50 pi/2-pi/3*j/50];
rot_R=eyerot_getR(theta);
pupil_bdrfr_Points1=zeros(3,num);
pupil_bdrfr_Points2=zeros(3,num);

for k=1:num %计算边缘点的折射
pupil_bdrfr_Points1(:,k)=refraction_point_rot(pupil_boundPoints(:,k),camera1,rot_R,para);
pupil_bdrfr_Points2(:,k)=refraction_point_rot(pupil_boundPoints(:,k),camera2,rot_R,para);
end
%计算在成像平面上映射点
pupil_bds_Points1=to_scene(camera1,pupil_bdrfr_Points1,R1(:,3));
pupil_bds_Points2=to_scene(camera2,pupil_bdrfr_Points2,R2(:,3));
% 计算这些点对应的椭圆圆心,构建射线
pupil_cam1=ellip_points2center(pupil_bds_Points1,R1,camera1)-camera1;
pupil_cam2=ellip_points2center(pupil_bds_Points2,R2,camera2)-camera2;

% pupil_cam1=refraction_point_rot(pupil,camera1,rot_R,para)-camera1;
% pupil_cam2=refraction_point_rot(pupil,camera2,rot_R,para)-camera2;
pupil_cam1=refraction_point_rot(pupil,camera1,rot_R,para)-camera1;
pupil_cam2=refraction_point_rot(pupil,camera2,rot_R,para)-camera2;
g1_cam1=reflection_point_rot(camera1,camera1,rot_R,para)-camera1;

g2_cam2=reflection_point_rot(camera2,camera2,rot_R,para)-camera2;
pupil_cam1=pupil_cam1/norm(pupil_cam1);
pupil_cam2=pupil_cam2/norm(pupil_cam2);
g1_cam1=g1_cam1/norm(g1_cam1);
g2_cam2=g2_cam2/norm(g2_cam2);

P(:,i,j)=rot_R(:,3)*40;
p=rot_R(:,3);

% p=[g1_cam1,g2_cam1,g1_cam2,g2_cam2,pupil_cam1,pupil_cam2 rot_R(:,3)];
% p_cam=cordsys_change([vx;vy;v1]',p);
% data(:,:,i)=p_cam;
% data(:,:,i)=p;
% end
% data=reshape(data,21,num);


l1=cross(pupil_cam1,g1_cam1);
l2=cross(pupil_cam2,g2_cam2);
l=cross(l1,l2);
i
j
res(i,j)=abs(acos(abs(l'*p/norm(l)/norm(p))))*180/pi;


    end
    end
