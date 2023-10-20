function out = reflection_point(P0,g,para)
x1=g(1);
y1=g(2);
z1=g(3);
x0=P0(1);
y0=P0(2);
z0=P0(3);

a0=para(1);
c0=para(2);
X0=[0 0 c0];
f=@(x)eql2(x,[x1,y1,z1],[x0,y0,z0],a0,c0);
options=optimoptions('fsolve','MaxIterations',1e5,'MaxFunctionEvaluations',1e5,'Display','off');
out=fsolve(f,X0,options);
end