%% Practica07RodriguezJoseManuel

function pratica7JMRC()
%% Paso 1
clc;clear all;close all;

[y,fs]=audioread('lazyrn.16bits.wav');

%% Paso 2

plot(y);
sound(y,fs);

%% Paso 3

predictor=dpcmopt(y,1)

%% Paso 4

[predictor,codebook,partition]=dpcmopt(y,1,4);

%% Paso 5

indx=dpcmenco(y,codebook,partition,predictor);

%% Paso 6

y2= dpcmdeco(indx,codebook,predictor);
sound(y2,fs);

%% Paso 7

plot(y(1:150),'b')
hold on; 
plot(y2(1:150),'r'); 
error = y(:)-y2(:);
plot(error(1:150),'g'); 
legend('original', 'reconstruida', 'error')
sound(error,fs)

%% Paso 10
uv = unique(y);
histograma=histc(y,uv);
plot(uv,histograma);
entropie=entropiaJMRC(histograma);

y_trans=reshape(y,1,length(y));
error=sum((y_trans-y2).^2)/length(y);


%% Paso 13

close all; clear all;
x=[0:999]/1000;
y=sin(10*pi*x);
plot(x,y)


[predictor,codebook,partition]=dpcmopt(y,1,9);
indx=dpcmenco(y,codebook,partition,predictor);
y2= dpcmdeco(indx,codebook,predictor);

uv = unique(y);
histograma=histc(y,uv);
plot(uv,histograma);

entropie=entropiaJMRC(histograma);
error=sum((y-y2).^2)/length(y);
%% Paso 16

close all; clear all;
x=[0:999]/1000;
y=cos(10*pi*x);
plot(x,y);

%% Paso 18 
y_min_1=y(1:length(y)-1);

y_norm=y(2:length(y));
N=length(y_norm);

s_min_1=sum(y_min_1);
s=sum(y_norm);
m1=[s_min_1*s,s];

m2=inv([-s_min_1^2,-s_min_1;-N*s_min_1,-N])

sol=m1*m2;
a=sol(1);b=sol(2);


end


function [resultado]= entropiaJMRC(histograma)

histogramaNZ=histograma;
histogramaNZ(find(histogramaNZ==0.0))=[];
suma=sum(histogramaNZ);
prob= histogramaNZ./suma;
resultado=-sum(prob.*log2(prob));

end
