w=2*pi/105;
soma=0;
for k=-52:1:52
    
    for n=1:1:105
        soma=soma +ys(n+106)*exp(-j*w*k*n);
    end
    ak(k+53)=(1/105)*soma;
    soma=0;
end
ak