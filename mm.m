function [x] = mm(y,lamda)

% y 要進行處理的訊號
% x 處理完的訊號

%% Parameter setting
iterations=20;                                                              % 要迭代的次數

y=y.';                                                                      % 轉置(原本y為列向量)
N=length(y);                                                                % 取得要處理的訊號長度

I=speye(N);                                                                 % 建立N*N的單位矩陣
D=I(2:N,:)-I(1:N-1,:);                                                      % D 矩陣
DDT=D*D';
x=y;                                                                        % 初始化x0=y
Dx=D*x;
Dy=D*y;

%% Main
for times=1:iterations
    F=sparse(1:N-1,1:N-1,abs(Dx)/lamda)+DDT;                                % 公式(12)括號內的部分
    x=y-D'*(F\Dy);                                                          % 更新目前的最佳解
    Dx=D*x;            
end


end

