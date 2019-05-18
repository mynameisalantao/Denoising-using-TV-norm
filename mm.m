function [x] = mm(y,lamda)

% y �n�i��B�z���T��
% x �B�z�����T��

%% Parameter setting
iterations=20;                                                              % �n���N������

y=y.';                                                                      % ��m(�쥻y���C�V�q)
N=length(y);                                                                % ���o�n�B�z���T������

I=speye(N);                                                                 % �إ�N*N�����x�}
D=I(2:N,:)-I(1:N-1,:);                                                      % D �x�}
DDT=D*D';
x=y;                                                                        % ��l��x0=y
Dx=D*x;
Dy=D*y;

%% Main
for times=1:iterations
    F=sparse(1:N-1,1:N-1,abs(Dx)/lamda)+DDT;                                % ����(12)�A����������
    x=y-D'*(F\Dy);                                                          % ��s�ثe���̨θ�
    Dx=D*x;            
end


end

