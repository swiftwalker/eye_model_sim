%建立直角坐标系xyz
%相机光心在z正半区，坐标(x0,y0,z0) z0>0
%相机成像平面平行于xy平面
%角膜折射面建模为旋转椭球面 椭球面三个轴线分别与xyz轴平行且中心是坐标原点
%上述假设下椭球面的方程为x^2/a0^2+y^2/a0^2+z^2/c0^2=1

%瞳孔建模为椭圆区域，过椭圆中心的椭圆法向量与角膜椭球面的z轴方向中轴线重合

%以上模型方程作为眼球无转动时的基准模型

%眼球内部折射率为n1 空气折射率为n0

%眼球旋转时，坐标轴也旋转得到新的坐标系x'y'z'，过渡矩阵为R (e1' e2' e3')=(e1 e2 e3)R 
%(x y z)=R(x' y' z')

a0=12;c0=11;
N0=1;N1=1.33;
para=[a0,c0,N0,N1]; %参数

% P1=[0 0 5]; %内点
P0=[0 10 100]; %摄像机光心
% Prf=refraction_point(P1,P0,para);%计算出折射点的位置

%瞳孔平面距离角膜顶点大概5mm
%瞳孔直径大约在1.5-8mm
%瞳孔建模为垂直z轴，中心在z轴上的椭圆 (x^2+y^2/a2^2)/r^2=1 z2=6
a2=1.00;
z2=6;
r=2;
num=100;
t=[1:num]*2*pi/num;
P1_list=[r*cos(t);r*a2*sin(t);ones(size(t))*z2]';%对瞳孔边缘点的采样
Prfr_list=zeros(size(P1_list));
for i=1:num
    Prfr_list(i,:)=refraction_point(P1_list(i,:),P0,para);  %折射点
end
%v是相机成像平面的法向量
v=[0,0,-10];
v=v/norm(v)*80;
vx=[-4,-1,1];
vy=cross(v,vx);

Ps_list_refraction=to_scene(P0',Prfr_list',v')'; %像点
v1=ellip_fit3d(Ps_list_refraction);
v2=vecnorm(v1)
v2(1)/v2(2)
%%
%光斑
glint=[50 20 20];
g_rfl=reflection_point(P0,glint,para);
g_scene=to_scene(P0',g_rfl',v');
