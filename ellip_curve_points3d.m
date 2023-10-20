function out = ellip_curve_points3d(a_vec,b_vec,center,num)
%根据参数方程产生num个采样点，输出为3 x num
t=[1:num]*2*pi/num;
p=a_vec*cos(t)+b_vec*sin(t);
out=p+center;
end