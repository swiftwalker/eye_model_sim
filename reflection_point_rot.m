function out=reflection_point_rot(P0,g,rot_R,para)
R=rot_R;
P0=inv(R)*P0;
g=inv(R)*g;
p=reflection_point(P0,g,para);
out=R*p';
% out=p';
end