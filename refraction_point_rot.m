function out=refraction_point_rot(P_inner,P_outer,rot_R,para)
%R表示眼球的 旋转
%输出为旋转后的折射点在原坐标系中的坐标
R=rot_R;
P_inner=P_inner;
P_outer=inv(R)*P_outer;
p=refraction_point(P_inner,P_outer,para);
out=R*p;
 % out=p;
end