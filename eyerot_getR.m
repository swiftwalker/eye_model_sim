function out = eyerot_getR(angel)
%angel(1) angel(2)表示旋转后的极坐标下的z轴坐标
%输出是旋转后的坐标系在原坐标系中的表示out=[x' y' z']

[x, y, z]=sph2cart(angel(1),angel(2),1);
n_vec=[x y z]';
if sum(n_vec==[0 0 1]')==3
    out=eye(3);
    return
end
%将z轴直接转动到n_vec 求出对应的x y轴
theta=acos(dot(n_vec,[0;0;1]));
n_rot=cross([0;0;1],n_vec);
n_rot=n_rot/norm(n_rot);

x=[1;0;0];
y=[0;1;0];
x_r=cos(theta)*x+(1-cos(theta))*(dot(x,n_rot))*n_rot+sin(theta)*cross(n_rot,x);
% x_r=x_r/norm(x_r);
y_r=cos(theta)*y+(1-cos(theta))*(dot(y,n_rot))*n_rot+sin(theta)*cross(n_rot,y);
% y_r=x_r/norm(y_r);
out=[x_r y_r n_vec];
end