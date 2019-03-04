% ************ sinal inventado ************
% m= 10;
% soma =0;
% 
% 
% for n =m+1 : 1 : length(ECG)-m
%     for k =-m : 1 :m
%     soma= soma + ECG(n-k);
%     end
%     s(n)= (1/((2*m)+1))*soma;
%     soma=0;
% end
% plot(s);

%******************* ECG 4 filtragens***************
m= 50;
soma =0;
plot(ECG)
var = ECG;
for i = 1 : 4
    
for n =m+1 : length(var)-m
    for k = -m : m
    soma= soma + var(n-k);
    end
    f(n)= (1/((2*m)+1))*soma;
    soma=0;
end
var = f;
%figure(i+1)
%plot(var)
end

ECGsemMedia = ECG(1:end-m) - var;
figure
plot(ECGsemMedia)


