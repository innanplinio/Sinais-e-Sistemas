 janela = 1000;  %% tamanho da janela a ser calculado a energia
 
 
 for  i=1 : 1 : size(sinal)-janela % laço que vai ate 719000
     
     energia(i) =  sum(abs(sinal(i:i+janela-1).^2)); 
     
 end
 
 limiar = 5;
 resp=1;
 ind = find(energia>limiar);
%  for k = 1 : 1 : size(energia)
%  ind = find(energia>limiar);
%  end
 
 dif = ind(2:end) - ind(1:end-1); 
 local_descont = find(dif > 1);
 n_descont = length(local_descont);
 n_exp = n_descont + 1;
 nirm = n_exp*60/90; 
 
plot(sinal)
hold on;
plot(energia, 'g-')

 