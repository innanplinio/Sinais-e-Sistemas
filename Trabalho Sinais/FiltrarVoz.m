%Innan Plinio e Ícaro Quintão
%Programa para capturar audio, retirar ruídos e alterar voz
clc;
disp('Preparar para gravar audio em 3 segundos');
pause(3);
recorder = audiorecorder(44100,16,1,1);
get(recorder);
%Gravar voz por 5 segundos
recorder=audiorecorder;
clc;
disp('Gravar audio SEM RUIDO');
recordblocking(recorder,5);
disp('Fim da gravação');
%tocar o que foi gravado
%play(recorder);
voz = getaudiodata(recorder);
clc;
disp('Preparar para gravar audio com ruido em 3 segundos');
pause(3);
recorder2 = audiorecorder(44100,16,1,1);
get(recorder2);
%Gravar voz por 5 segundos
recorder2=audiorecorder;
clc;
disp('Gravar audio COM RUIDO');
recordblocking(recorder2,5);
disp('Fim da gravação');
%tocar o que foi gravado
%play(recorder);
vozcomsacola = getaudiodata(recorder2);

%voz = wavread('voz_audio.wav'); %carrega o áudio voz_audio.wav
%vozcomsacola = wavread('voz_sacola_audio.wav'); %carrega o áudio voz_sacola_audio.wav
fs = 8000; %frequência de amostragem do áudio

%Voz e sacola separados
subplot(421);
plot(voz);
title('Voz e sacola separados sem filtro no domínio do tempo');
xlabel('Tempo(s)');
ylabel('Amplitude');

subplot(422);
my_fft(voz,fs); %fft para plotar no domínio da frequência
title('Voz e sacola separados sem filtro no domínio da frequência');

fpass = 800; %frequência de passagem
fstop = 1000; %frequência de parada

wp = (fpass/(fs/2))*pi; %frequência angular relacionada à frequência de passagem
ws = (fstop/(fs/2))*pi; %frequência angular relacionada à frequência de parada

wt = ws - wp; %frequência de transição
wc = (ws + wp)/2; %frequência de corte ou frequência de canto

M = ceil((6.2*pi/wt)) + 1; %comprimento do filtro
hd = ideal_lp(wc,M); %Criação da 
w_han = hann(M)';    %janela
h = hd.*w_han;       %Hanning 

voz_filtrada = conv(h, voz); %Multiplicação em forma de convolução da janela com o áudio original, retirando as frequências indesejadas
subplot(423);
plot(voz_filtrada);
title('Voz filtrada no domínio do tempo');
xlabel('Tempo(s)');
ylabel('Amplitude');

subplot(424);
my_fft(voz_filtrada,fs);
title('Voz filtrada no domínio da frequência');

%Voz e sacola juntos
subplot(425);
plot(vozcomsacola);
title('Voz e sacola juntos sem filtro no domínio do tempo');
xlabel('Tempo(s)');
ylabel('Amplitude');

subplot(426);
my_fft(vozcomsacola,fs);
title('Voz e sacola juntos sem filtro no domínio da frequência');

vozcomsacola_filtrada = conv(h, vozcomsacola);

subplot(427);
plot(vozcomsacola_filtrada);
title('Voz com sacola filtrada no domínio do tempo');
xlabel('Tempo(s)');
ylabel('Amplitude');

subplot(428);
my_fft(vozcomsacola_filtrada,fs);
title('Voz com sacola filtrada no domínio da frequência');
y = 8000;
%reproduz voz sem ruido
clc;
disp('Reproduzindo som sem sacola')
sound(voz, y);
pause(5);
clc;
%reproduz voz com ruido
disp('Reproduzindo som com sacola');
sound(vozcomsacola,y);
pause(5);
clc;
disp('Reproduzindo som sem sacola filtrado');
%reproduz sem ruido voz filtrada
sound(voz_filtrada, y);
pause(5);
clc;
disp('Reproduzindo som com sacola filtrado');
%reproduz voz com ruido filtrada
sound(vozcomsacola_filtrada,y);
pause(5);

clc;
disp('Alterador de voz:')
disp('Reproduzindo voz gravada mais grave');
sound(voz_filtrada, 6500);
pause(5);
clc;
disp('Alterador de voz:')
disp('Reproduzindo voz gravada mais aguda');
sound (voz_filtrada, 12000);

