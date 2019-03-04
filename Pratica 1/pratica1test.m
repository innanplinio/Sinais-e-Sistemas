janela = 2000;

for i = 1:1:length(sinal)-janela

energia(i)= sum(abs(sinal(i:i+janela-1)).^2);

end

plot(sinal)
hold on
plot(energia,'g-')

limiar =5;
ind = find(energia>limiar);
cont =1;
for j =1:1:length(ind)-1
   if(ind(j+1) - ind(j) >1)
       cont = cont+1;
   end
end
cont
