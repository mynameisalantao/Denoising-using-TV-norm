function [p] = TV_mm(Source)

% Source只接受單聲源(單一列向量)，不能多聲源

%% Parameter
SorLen=length(Source);                                                      % 取樣點的長度
p=zeros(1,SorLen);                                                          % 去躁完的音檔
lamda=0.8;                                                                 % regularization term

%% 將訊號切成多個小段進行TV演算法
NWIN=3;                                                                     % 每次取5個點
hopsize=NWIN-1;                                                             % overlap 1個點
NumOfFrame=floor(SorLen/hopsize)-1;                                         % 總共要進行多少次

%% TV
for FrameNo=1:NumOfFrame                                                    % 依序處理每個Frame
    
    %% Time segment
    t_start=(FrameNo-1)*hopsize;
    tt=(t_start+1):(t_start+NWIN);
    %% Denoising
    
    x=mm(Source(tt),lamda);                                                 % 將這NWIN個點做去躁並輸出x
    x=x.';                                                                  % 把行向量轉回列向量
    
    %% Overlap and Add
    tt2 = 1:NWIN;
    p(t_start+tt2)=p(t_start+tt2)+x(tt2);
    
end


end

