function [source,fs,SorLen] = read_audio(SorNum,SorSec)
% SorNum ���nŪ�������ɭӼ�
% SorSec ���nŪ�������ɪ���(sec)

pathname='C:\Users\USER\Desktop\matlab test\Denoising 20190217\';  % ���|
% PS. ���|�᭱�O�o�n�[�W"\"

 %% Ū���Ĥ@�ӭ���
if SorNum>=1
%     [SorTemp,fs]=audioread([pathname 'cut_source2.wav']);                   % Ū������(���e�P���˲v)
        [SorTemp,fs]=audioread([pathname 'cut_source4.wav']);                   % Ū������(���e�P���˲v)
    
    SorLen = fs*SorSec;                                                     % Length of source (���˪��I��) fs �����ɨ����W�v
    if length(SorTemp) > SorLen
        source(1,:)=SorTemp(1:SorLen,1);                                    % ���ɪ��I�� > �w�]���I�� (SorLen) ;�᭱�����O�ﭵ�y
    elseif length(SorTemp) < SorLen
        source(1,:)=[SorTemp ; zeros(SorLen-length(SorTemp),1)];            % ���ɪ��I�� < �w�]���I�� (SorLen)����0
    else
        source(1,:)=SorTemp;
    end
    % ------------�]��source1���z--------------------%
%     source(1,:)=source(1,:).*1.65;
    source(1,:)=source(1,:).*0.5;

end

 %% Ū���ĤG�ӭ���
if SorNum>=2
%     [SorTemp,fs]=audioread([pathname 'cut_source1.wav']);                   % Ū������(���e�P���˲v)

    [SorTemp,fs]=audioread([pathname 'cut_source5.wav']);                   % Ū������(���e�P���˲v)
    
    
    SorLen = fs*SorSec;                                                     % Length of source (���˪��I��) fs �����ɨ����W�v
    if length(SorTemp) > SorLen
        source(2,:)=SorTemp(1:SorLen,1);                                    % ���ɪ��I�� > �w�]���I�� (SorLen) ;�᭱�����O�ﭵ�y
    elseif length(SorTemp) < SorLen
        source(2,:)=[SorTemp ; zeros(SorLen-length(SorTemp),1)];            % ���ɪ��I�� < �w�]���I�� (SorLen)����0
    else
        source(2,:)=SorTemp;
    end
    
end




end

