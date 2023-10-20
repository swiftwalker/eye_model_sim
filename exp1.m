%叉乘仿真-椭圆中心直接折射

a0=10;c0=8;
N0=1;N1=1.33;
para=[a0,c0,N0,N1]; %参数

% camera1=[5 50 100]';
% camera2=[-5 47 99]';  

camera1=[20 20 40]';
camera2=[10 20 40]';  
glint1=[20 30 40]';
glint2=[10 30 40]';

v1=[-1,-6,-10]; 
vx=[-4,-1,1];
vy=cross(v1,vx); %以camera1作为新坐标系

v2=[-0.95 -5.9 -10.5];

% glint1=[3 40 105]';
% glint2=[-1 55 97]';
% glint1=[-1.5811 53.2434 101.0811]';
% glint2=[1.5811 43.7566 97.9189]';
pupil=[0,0,6]';

%%
% pupil_cam1=refraction_point(pupil,camera1,para)-camera1;
% pupil_cam2=refraction_point(pupil,camera2,para)-camera2;
% g1_cam1=reflection_point(camera1,glint1,para)'-camera1;
% g2_cam1=reflection_point(camera1,glint2,para)'-camera1;
% g1_cam2=reflection_point(camera2,glint1,para)'-camera2;
% g2_cam2=reflection_point(camera2,glint2,para)'-camera2;
a1=glint1-camera1;
a2=glint2-camera1;
a3=glint1-camera2;
a4=glint2-camera2;
% 
% l1=cross(cross(cross(a1,g1_cam1),cross(a2,g2_cam1)),pupil_cam1);
% l2=cross(cross(cross(a3,g1_cam2),cross(a4,g2_cam2)),pupil_cam2);
% l=cross(l1,l2);
%%

num=1;
% data=zeros(3,7,num);
% for i=1:num
% theta=rand(1,2)*0.5*pi-0.25*pi;
P=zeros(3,200,200);
for i=1:200
    for j=1:200

theta=[2*pi*i/200 pi/2-pi/3*j/200];
rot_R=eyerot_getR(theta);

pupil_cam1=refraction_point_rot(pupil,camera1,rot_R,para)-camera1;
pupil_cam2=refraction_point_rot(pupil,camera2,rot_R,para)-camera2;
 g1_cam1=reflection_point_rot(camera1,glint1,rot_R,para)-camera1;
g2_cam1=reflection_point_rot(camera1,glint2,rot_R,para)-camera1;
g1_cam2=reflection_point_rot(camera2,glint1,rot_R,para)-camera2;
g2_cam2=reflection_point_rot(camera2,glint2,rot_R,para)-camera2;
pupil_cam1=pupil_cam1/norm(pupil_cam1);
pupil_cam2=pupil_cam2/norm(pupil_cam2);
g1_cam1=g1_cam1/norm(g1_cam1);
g2_cam1=g2_cam1/norm(g2_cam1);
g1_cam2=g1_cam2/norm(g1_cam2);
g2_cam2=g2_cam2/norm(g2_cam2);
P(:,i,j)=rot_R(:,3)*40;
p=rot_R(:,3);

% p=[g1_cam1,g2_cam1,g1_cam2,g2_cam2,pupil_cam1,pupil_cam2 rot_R(:,3)];
% p_cam=cordsys_change([vx;vy;v1]',p);
% data(:,:,i)=p_cam;
% data(:,:,i)=p;
% end
% data=reshape(data,21,num);


l1=cross(cross(cross(a1,g1_cam1),cross(a2,g2_cam1)),pupil_cam1);
l2=cross(cross(cross(a3,g1_cam2),cross(a4,g2_cam2)),pupil_cam2);
l=cross(l1,l2);
i
j
% acos(abs(l'*p/norm(l)/norm(p)))*180/pi
% % t1=inv(rot_R)*ca
% if p(2)>0
%     res(i,j)=-1;
% else
    res(i,j)=acos(abs(l'*p/norm(l)/norm(p)))*180/pi;
% end


    end
    end
