function out=ellip_fit3d(P_list)
if size(P_list,1)~=3
    P_list=P_list';
end
%输入P_list 3 x n
%输出椭圆的圆心 长/短轴方向向量
line1=P_list(:,1)-P_list(:,3);
line2=P_list(:,1)-P_list(:,5);
ex=line1;
ez=cross(line1,line2);
ey=cross(ez,ex);
R=[ex ey ez];
R=R./vecnorm(R);
C0=P_list(:,1);

p1=R\(P_list-C0); %变换到新坐标系 z坐标相同
% z=mean(p1(3,:));
p2=p1(1:2,:);

para=ellip_fit2d(p2);
A=para(1);
B=para(2);
theta=para(3);
center2d=[para(4:5);0];

rot2d=[cos(theta) -sin(theta);sin(theta) cos(theta)];
a_vec2d=[rot2d(:,1);0];
b_vec2d=[rot2d(:,2);0];
a_vec3d=R*a_vec2d*A;
b_vec3d=R*b_vec2d*B;
center3d=R*center2d+C0;
out=[a_vec3d b_vec3d center3d];
% center2d=ellip_fit_center(p2);
% center3d=[center2d;z];
% out=R*center3d+C0;

end