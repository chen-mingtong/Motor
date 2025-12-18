%% 递归函数，可以表示数列，通过符号变量表达
clear all;
clc;
a = 5;  % 假设初值 A0 = 5
n = 10; % 计算前10项
B= zeros(1, n);

syms c; %初值为c;
C = cell(1,n); %cell数组存储符号变量
C_simplified = cell(1,n);
D = cell(1,n);
D_simplified = cell(1,n);

for i = 1:n
    C{i} = recursive_sequence(i, c);
    C_simplified{i} = vpa(recursive_sequence(i, c),5);
    C_correct{i} =vpa(0.676* C_simplified{i},3);
end
disp('数组值为（用符号变量表示）：')
disp(C_simplified);
disp('数组值为（修正后）：')
disp(C_correct);

for i = 1:n
    D{i} =c*(sqrt(i+1)-sqrt(i));
    D_simplified{i} = vpa(c*(sqrt(i+1)-sqrt(i)),5);
end
disp('数组值为（用符号变量表示）,无麦克劳林变换：')
disp(D_simplified);

for j=1:10
c_value = j*0.1;
for i = 1:n
 C_value(i) = subs(C_simplified{i},c,c_value);
 D_value(i) = subs(D_simplified{i},c,1);
end


x=linspace(1,10,10);
subplot(5,2,j)
plot(x,C_value,'LineWidth',2,'DisplayName','麦克劳林展开');
hold on;
plot(x,D_value,'LineWidth',2,'DisplayName','真实值');
hold on;
text(2,0.5,sprintf('修正系数= %.2f',c_value));
xlabel('n(n=1,2,3....)');
ylabel('Cn');
title('Cn(计数器Counter与n的关系，控制激励脉冲的频率)')
xlim([1,10]);
ylim([0,0.61]);
legend('show','FontSize', 12);
end


%%递归函数

function A = recursive_sequence(n,a)
    if n == 0
        A = a;  
    else
        A = recursive_sequence(n-1,a) - 2*recursive_sequence(n-1,a)/(4*n+1);
    end
end
