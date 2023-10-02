function out=refraction_point(P_inner,P_outer,para)
x1=P_inner(1);
y1=P_inner(2);
z1=P_inner(3);
x0=P_outer(1);
y0=P_outer(2);
z0=P_outer(3);

a0=para(1);
c0=para(2);
N0=para(3);
N1=para(4);
f=@(x)eql(x,[x1,y1,z1],[x0,y0,z0],a0,c0,N0,N1);
X0=direct_point(P_inner,P_outer,para); %迭代起始点
% options=optimoptions('fsolve','MaxIterations',1e5,'MaxFunctionEvaluations',1e5);
options=optimoptions('fsolve','MaxIterations',1e5,'MaxFunctionEvaluations',1e5,'Display','off');
out=fsolve(f,X0,options);
end

function    out=direct_point(P_inner,P_outer,para)
a0=para(1);
c0=para(2);
f=@(t) linepoint_onF(t,P_inner,P_outer,a0,c0);
t=fminbnd(f,0,1);
out=(1-t)*P_inner+t*P_outer;
end

function out=linepoint_onF(t,P_inner,P_outer,a0,c0)
P_at=(1-t)*P_inner+t*P_outer;
out=P_at(1)^2/a0^2+P_at(2)^2/a0^2+P_at(3)^2/c0^2-1;
end