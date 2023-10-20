function out=ellip_fit_center(P_list)
%输入P_list 2 x n
%求解椭圆ax^2+by^2+cxy+dx+ey=1的参数 a b c d e
%输出椭圆的中心
X=[P_list(1,:).*P_list(1,:);P_list(2,:).*P_list(2,:);P_list(1,:).*P_list(2,:);P_list(1,:);P_list(2,:)];
b=ones(size(P_list,2),1);
t1=(X*X')\(X*b);
M=[t1(1) t1(3)/2;t1(3)/2 t1(2)];
[v,d]=eig(M);
l1=d(1,1);
l2=d(2,2);
K=[t1(4) t1(5)]*v;
x1=-K(1)/2/l1;
y1=-K(2)/2/l2;
% testplot; 
out=v*[x1;y1];

end