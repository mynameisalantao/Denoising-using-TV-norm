%% Denosing
clc;clear

%% Ū���� (�ȩw�H1�ӭ��ɬ���)
[source,fs,SorLen] = read_audio(1,5);                                       % ��1�ӭ��ɡA�ɶ�����5��

%% �[�J���T
Source = awgn(source,20);

%% TV MM �t��k
[p] = TV_mm(Source);

%% ����
% sound(p,fs)
