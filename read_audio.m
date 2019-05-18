function [source,fs,SorLen] = read_audio(SorNum,SorSec)
% SorNum 為要讀取的音檔個數
% SorSec 為要讀取的音檔長度(sec)

pathname='C:\Users\USER\Desktop\matlab test\Denoising 20190217\';  % 路徑
% PS. 路徑後面記得要加上"\"

 %% 讀取第一個音檔
if SorNum>=1
%     [SorTemp,fs]=audioread([pathname 'cut_source2.wav']);                   % 讀取音檔(內容與取樣率)
        [SorTemp,fs]=audioread([pathname 'cut_source4.wav']);                   % 讀取音檔(內容與取樣率)
    
    SorLen = fs*SorSec;                                                     % Length of source (取樣的點數) fs 為音檔取樣頻率
    if length(SorTemp) > SorLen
        source(1,:)=SorTemp(1:SorLen,1);                                    % 音檔的點數 > 預設的點數 (SorLen) ;後面的１是選音軌
    elseif length(SorTemp) < SorLen
        source(1,:)=[SorTemp ; zeros(SorLen-length(SorTemp),1)];            % 音檔的點數 < 預設的點數 (SorLen)→補0
    else
        source(1,:)=SorTemp;
    end
    % ------------因為source1較弱--------------------%
%     source(1,:)=source(1,:).*1.65;
    source(1,:)=source(1,:).*0.5;

end

 %% 讀取第二個音檔
if SorNum>=2
%     [SorTemp,fs]=audioread([pathname 'cut_source1.wav']);                   % 讀取音檔(內容與取樣率)

    [SorTemp,fs]=audioread([pathname 'cut_source5.wav']);                   % 讀取音檔(內容與取樣率)
    
    
    SorLen = fs*SorSec;                                                     % Length of source (取樣的點數) fs 為音檔取樣頻率
    if length(SorTemp) > SorLen
        source(2,:)=SorTemp(1:SorLen,1);                                    % 音檔的點數 > 預設的點數 (SorLen) ;後面的１是選音軌
    elseif length(SorTemp) < SorLen
        source(2,:)=[SorTemp ; zeros(SorLen-length(SorTemp),1)];            % 音檔的點數 < 預設的點數 (SorLen)→補0
    else
        source(2,:)=SorTemp;
    end
    
end




end

