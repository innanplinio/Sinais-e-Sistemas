function [X, frequency] = my_fft(x,fs)
% normal - normalizar o eixo das abscissas
normal = length(x);
v_aux = 0:normal-1;% vetor auxiliar
T = normal/fs;
frequency = v_aux/T; % redimensiona o eixo das abscissas   
X = fft(x)/normal; % normalizar
fc = ceil(normal/2); % frequência de corte para ajustar os dados do vetor   
X = X(1:fc);   
plot(frequency(1:fc), abs(X)); % abs retorna o módulo do sinal no domínio da frequência   
title('Análise do Espectro no domínio da frequência');
xlabel('Frequência Hz');   
ylabel('Amplitude');
end