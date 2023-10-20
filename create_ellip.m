%指定一个法向量方向 旋转角度和长短轴之比 生成椭圆 输出长短轴方向向量
function [a_vec,b_vec]=create_ellip(n_vec,phi,D,r)

n_vec=n_vec/norm(n_vec);
if sum(n_vec==[0 0 1]')==3
    a_vec=[1 0 0]';
    b_vec=[0 1 0]';
    return
end
%将z轴直接转动到n_vec 求出对应的x y轴
theta=acos(dot(n_vec,[0;0;1]));
n_rot=cross([0;0;1],n_vec);
n_rot=n_rot/norm(n_rot);
%罗德里格旋转公式
x=[1;0;0];
y=[0;1;0];
x_r1=cos(theta)*x+(1-cos(theta))*(dot(x,n_rot))*n_rot+sin(theta)*cross(n_rot,x);
y_r1=cos(theta)*y+(1-cos(theta))*(dot(y,n_rot))*n_rot+sin(theta)*cross(n_rot,y);
%然后再绕法向量旋转phi

x_r2=cos(phi)*x_r1+(1-cos(phi))*(dot(x_r1,n_vec))*n_vec+sin(phi)*cross(n_vec,x_r1);
y_r2=cos(phi)*y_r1+(1-cos(phi))*(dot(y_r1,n_vec))*n_vec+sin(phi)*cross(n_vec,y_r1);

a_vec=x_r2/norm(x_r2)*r*D;
b_vec=y_r2/norm(y_r2)*r;

end