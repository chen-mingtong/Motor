%步进电机梯形算法实现step
%theta为转动角度,alpha为步距角，omega为角速度，角度为°,delta_t为脉冲周期s；
alpha = 1.8;
spr = 200;
delta_t = 1;

%如果每秒发一个脉冲，看100s，第三个参数为点的个数
time = 0:delta_t:100;
amplitude =alpha * time;
%amplitude1 =alpha * time + random('Normal',0,50,[1,101]);

% N=1:1:10;
% R=random('Normal',0,50,[1,10]);
% plot(N,R);


%%
stairs(time,amplitude,"LineWidth",2);
xlabel("time/s");
ylabel("angle/°");
title("Angle with Time Curve in fixed pulse (1Hz)");
grid on;
hold on;
