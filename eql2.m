function F=eql2(X,P0,g,a0,c0)
x1=g(1); y1=g(2) ;z1 =g(3);
x0=P0(1) ;y0=P0(2)  ;z0=P0(3);
x=X(1); y=X(2); z =X(3);
n1=[x1-x,y1-y,z1-z];
n2=[x0-x,y0-y,z0-z];
n0=[x/a0^2,y/a0^2,z/c0^2];
F(1)=(x^2+y^2)/a0^2+z^2/c0^2-1;
F(2)=dot(cross(n1,n2),n0);
F(3)=dot(n1,n0)*norm(n2)-dot(n2,n0)*norm(n1);
end