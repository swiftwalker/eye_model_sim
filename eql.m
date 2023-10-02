%该函数给出三个等式约束
function F=eql(X,P1,P2,a0,c0,N0,N1)
x1=P1(1); y1=P1(2) ;z1 =P1(3);
x0=P2(1) ;y0=P2(2)  ;z0=P2(3);
x=X(1); y=X(2); z =X(3);
n1=[x-x1,y-y1,z-z1];
n2=[x0-x,y0-y,z0-z];
n0=[x/a0^2,y/a0^2,z/c0^2];
F(1)=(x^2+y^2)/a0^2+z^2/c0^2-1;
F(2)=dot(cross(n1,n2),n0);
F(3)=norm(cross(n1,n0))*norm(n2)-norm(cross(n2,n0))*N0/N1*norm(n1);
end