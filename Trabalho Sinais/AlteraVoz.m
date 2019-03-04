recorder = audiorecorder(44100,16,1,1);
get(recorder);
%Gravar voz por 5 segundos
recorder=audiorecorder;
clc;
disp('Começe falar');
recordblocking(recorder,2);
disp('Fim da gravação');
%tocar o que foi gravado
%play(recorder);
x = getaudiodata(recorder);
