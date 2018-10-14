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
%% Paso 13

clear all; close all;
fichero='camera.pgm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint8');
fclose(fid)
histograma= histc(words,[0:255]);
H=entropiaJMRC(histograma)

%% Paso 15

%% Bird.pgm 1 orden
clear all; close all;
fichero='Bird.pgm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint8');
fclose(fid)
histograma= histc(words,[0:255]);
H=entropiaJMRC(histograma)

%% Bird.pgm 2 orden
clear all; close all;
fichero='Bird.pgm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint16');
fclose(fid)
histograma= histc(words,[0:256*256-1]);
H=entropiaJMRC(histograma)
%% ppt1.pbm 1 orden
clear all; close all;
fichero='ptt1.pbm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint8');
fclose(fid)
histograma= histc(words,[0:255]);
H=entropiaJMRC(histograma)

%% ppt1.pbm 2 orden
clear all; close all;
fichero='ptt1.pbm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint16');
fclose(fid)
histograma= histc(words,[0:256*256-1]);
H=entropiaJMRC(histograma)

%% texto10000.txt 1 orden
clear all; close all;
fichero='texto10000.txt'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint8');
fclose(fid)
histograma= histc(words,[0:255]);
H=entropiaJMRC(histograma)

%% texto10000.txt 2 orden
clear all; close all;
fichero='texto10000.txt'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint16');
fclose(fid)
histograma= histc(words,[0:256*256-1]);
H=entropiaJMRC(histograma)

%% Cinco semanas en globo - Julio Verne.txt 1 orden
clear all; close all;
fichero='Cinco semanas en globo - Julio Verne.txt'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint8');
fclose(fid)
histograma= histc(words,[0:255]);
H=entropiaJMRC(histograma)

%% Cinco semanas en globo - Julio Verne.txt 2 orden
clear all; close all;
fichero='Cinco semanas en globo - Julio Verne.txt'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint16');
fclose(fid)
histograma= histc(words,[0:256*256-1]);
H=entropiaJMRC(histograma)

%% Paso 17

%% subpaso 1
clear all; close all;
A=imread('bird.pgm');
histograma= histc(A,[0:255]);
H=entropiaJMRC(histograma)/255;

%% subpaso 2
A_dif=int8(A);   
A_dif=A_dif(2:256,:)-A_dif(1:255,:);

%% subpaso 3
histograma= histc(A_dif,[0:255]);
subplot(1,2,1); imshow(A_dif);
subplot(1,2,2);bar([0:255],histograma);

%% subpaso4
H=entropiaJMRC(histograma)/255

%% Paso 20

clear all; close all;
letras=['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' ...
    'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' 'á' 'é' 'í' 'ñ' 'ó' 'ú' 'ü']

elem_alf=numel(letras);
M=100;  %Numero de palabras
N=4;  % letras en cada palabra

rng(0); %Mira para qué sirve esta orden
codigosMxN=randsrc(M,N,[1:elem_alf;ones(1,elem_alf)/elem_alf]);
palabrasMxN=letras(codigosMxN);

fid = fopen('palabras4letrasgeneradasuniformemente.txt','w');
for i=1:M
    fprintf(fid,'%s\n',palabrasMxN(i,:) );
end
fclose(fid);


%% Paso 23

clear all; close all;
fid = fopen('PalabrasDRAE.4letras.txt', 'r')
letras=fscanf(fid,'%s');
letras2num=uint16(letras); %observa la conversión de los dos bytes

%% Paso 24
histograma=histc(letras2num,[0:256*256-1]); %observa el rango
indicespos=find(histograma>0);
probabilidades=histograma(indicespos)/sum(histograma(indicespos));

%% Paso 25
tam=numel(indicespos)
M=100;
N=4;  
rng(0); 
codigosMxN=randsrc(M,N,[1:tam;probabilidades(1,:)]);
palabrasMxN=letras2num(indicespos(codigosMxN));

fid = fopen('palabras4letrasgeneradasRAE.txt','w');
for i=1:M
    fprintf(fid,'%s\n',palabrasMxN(i,:) );
end
fclose(fid);
end

function [resultado]= entropiaJMRC(histograma)
    
suma=sum(histograma);
prob= histograma./suma;
prob(find(prob==0.0))=[];
resultado=-sum(prob.*log2(prob));


end
