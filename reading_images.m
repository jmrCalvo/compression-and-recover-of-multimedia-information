%% Practica01RodriguezCalvoJoseManuel


function practica01JMRC()

%% Paso 1
clear all; close all;
fichero='constitucion española.txt';
fid=fopen(fichero, 'r')
[words count]=fread(fid,inf,'*uint8');
fclose(fid)

histograma= histc(words,[0:255]);
subplot(1,2,1);
plot([0:255],histograma); axis('tight')
% si prefieres puedes usar la función bar
subplot(1,2,2); bar([0:255],histograma);

%% Paso 3
H=entropiaJMRC(histograma);

%% Paso 5
clear all; close all;
A=imread('camera.pgm');
% Mostramos la imagen camera.pgm
subplot(1,2,1); imshow(A);

%% Paso 6
histograma=histc(A(:),[0:255]);
subplot(1,2,2); bar([0:255],histograma)
H2=entropiaJMRC(histograma)

%% Paso 8
clear all; close all; 
A=uint8(zeros(256));
%A(1:10,:)=uint8(180);
subplot(1,2,1); imshow(A)
histograma= histc(A(:),[0:255]);
subplot(1,2,2); bar([0:255],histograma)
H=entropiaJMRC(histograma)

%% Paso 11
clear all; close all;
fichero='camera.pgm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint16');
fclose(fid)
histograma= histc(words,[0:256*256-1]);
bar([0:256*256-1],histograma), axis('tight')
H=entropiaJMRC(histograma)

end

function [resultado]= entropiaJMRC(histograma)
    
suma=sum(histograma);
prob= histograma./suma;
prob(find(prob==0.0))=[];
resultado=-sum(prob.*log2(prob));


end
