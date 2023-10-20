plot3(P_list(1,:),P_list(2,:),P_list(3,:),'r*');
hold on
s1=mean(P_list');
s2=R*center3d+C0;
plot3(s1(1),s1(2),s1(3),'bo');
hold on
plot3(s2(1),s2(2),s2(3),'bx');

% plot(P_list(1,:),P_list(2,:),'r-');
% hold on
% s1=mean(P_list');
% s2=v*[x1;y1];
% plot(s1(1),s1(2),'bo');
% hold on
% plot(s2(1),s2(2),'bx');