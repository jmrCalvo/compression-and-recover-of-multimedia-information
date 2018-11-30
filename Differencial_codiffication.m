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

%% Paso 8
t=max(indx(:))
whos

%% Paso 10

uv = unique(indx);

histograma=histc(indx,uv);
plot(uv,histograma,'.r','Marker','d');
entropie=entropiaJMRC(histograma);

y_trans=reshape(y,1,length(y));
error=sum((y_trans-y2).^2)/length(y);


%% Paso 13

close all; clear all;
x=[0:999]/1000;
y=sin(10*pi*x);
plot(x,y)


[predictor,codebook,partition]=dpcmopt(y,1,8);
indx=dpcmenco(y,codebook,partition,predictor);
y2= dpcmdeco(indx,codebook,predictor);

uv = unique(indx);
histograma=histc(indx,uv);
plot(uv,histograma,'.r','Marker','d');

entropie=entropiaJMRC(histograma);
error=sum((y-y2).^2)/length(y);
%% Paso 16

close all; clear all;
qx=[0:999]/1000;
qy=cos(10*pi*qx);
plot(qx,qy);

%% Paso 18 

y_f=qy(2:length(qy));
y_t=qy(1:length(qy)-1);

predictor=dpcmopt(y_f,1);

%m=ones(2,2);
%m(1,1)=sum(y_f.^2);
%m(2,1)=sum(y_f);
%m(1,2)=sum(y_f);
%m(2,2)=length(y_f);
%m_inv=m^-1;

%n=ones(2,1);

%n(2,1)=sum(y_f.*y_t);
%n(1,1)=sum(y_t);

%sol=m_inv*n;

syms x y

da=sum(y_f.*y_t)-sum(y_t.^2)*x-sum(y_t)*y==0;
db=sum(y_f)-sum(y_t)*x-length(qy)*y==0;

S=solve(da,db,[x y],'ReturnConditions', true)

vpa(S.x)
vpa(S.y)

end


function [resultado]= entropiaJMRC(histograma)

histogramaNZ=histograma;
histogramaNZ(find(histogramaNZ==0.0))=[];
suma=sum(histogramaNZ);
prob= histogramaNZ./suma;
resultado=-sum(prob.*log2(prob));

end
