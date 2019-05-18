%% Denosing
clc;clear

%% 讀音檔 (暫定以1個音檔為限)
[source,fs,SorLen] = read_audio(1,5);                                       % 取1個音檔，時間長度5秒

%% 加入雜訊
Source = awgn(source,20);

%% TV MM 演算法
[p] = TV_mm(Source);

%% 播放
% sound(p,fs)
