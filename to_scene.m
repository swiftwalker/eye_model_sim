function out = to_scene(P0,P_list,v)
%P0是摄像机光心 P_list是需要成像的点集 v是摄像机成像平面法向量
%输入P0 v 为列向量 P_list为 3 x num 矩阵
%输出out 为 3 x num矩阵

h_list=-P_list+P0;
out=P0+(h_list'./(h_list'*v)*(v'*v))'; %像点
end