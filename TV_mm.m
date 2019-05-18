function [p] = TV_mm(Source)

% Source�u�������n��(��@�C�V�q)�A����h�n��

%% Parameter
SorLen=length(Source);                                                      % �����I������
p=zeros(1,SorLen);                                                          % �hļ��������
lamda=0.8;                                                                 % regularization term

%% �N�T�������h�Ӥp�q�i��TV�t��k
NWIN=3;                                                                     % �C����5���I
hopsize=NWIN-1;                                                             % overlap 1���I
NumOfFrame=floor(SorLen/hopsize)-1;                                         % �`�@�n�i��h�֦�

%% TV
for FrameNo=1:NumOfFrame                                                    % �̧ǳB�z�C��Frame
    
    %% Time segment
    t_start=(FrameNo-1)*hopsize;
    tt=(t_start+1):(t_start+NWIN);
    %% Denoising
    
    x=mm(Source(tt),lamda);                                                 % �N�oNWIN���I���hļ�ÿ�Xx
    x=x.';                                                                  % ���V�q��^�C�V�q
    
    %% Overlap and Add
    tt2 = 1:NWIN;
    p(t_start+tt2)=p(t_start+tt2)+x(tt2);
    
end


end

