% Jose Manuel Rodriguez Calvo
% Tiempo: Incluye aquí el tiempo dedicado a realizar el guion
%% Paso 1
function pratica2JMRC()
A=[1:5];
p=[0.2 0.4 0.2 0.1 0.1];
D=huffmandict(A,p);
for i=1:length(A)
    fprintf('Letra Alfabeto %s Código %s\n',num2str(D{i,1}),num2str(D{i,2}))
end    


%% Paso 2

A=[1:5];
p=[0.2 0.4 0.2 0.1 0.1];
D=huffmandict(A,p);
for i=1:length(A)
    fprintf('Letra Alfabeto %s Código %s\n',num2str(D{i,1})+16,num2str(D{i,2}))
end    

%% Paso 3

A=[1:5];
p=[0.2 0.4 0.2 0.1 0.1];
D=huffmandict(A,p,2,'min');

for i=1:length(A)
    fprintf('Letra Alfabeto %s Código %s\n',num2str(D{i,1}),num2str(D{i,2}))
end 

%% Paso 4

A=[1:5];
p=[0.2 0.4 0.2 0.1 0.1];
rng(0);
stream= randsrc(1,10,[A;p])

%% Paso 5

clc; clear all;
fichero= 'Don Quijote de la Mancha - Miguel de Cervantes.txt'
fid=fopen(fichero,'r')
seq=fread(fid,'*uint8');
fclose(fid);
seq=reshape(seq,1,length(seq)); %leidos datos en seq vector fila
fprintf('Tamaño del fichero original en bytes  %d\n',numel(seq))


%% Paso 6

letras=[0:255];
histo=histc(seq,letras); %calculamos histograma e indices
bar(letras,histo);
axis('tight');
xlabel('letras [0:255]');
ylabel('Frecuencias');
title('Histograma');
xlabel('letras [0:255]');
ylabel('Frecuencias');
title('Histograma');

%% paso7 
posiciones=find(histo>0.0);
tam=numel(seq);
prob_letras_usadas=histo(posiciones)./tam;

%% paso8
letras_usadas=letras(posiciones);

[dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; %construimos el diccionario
seq_codificada = huffmanenco(seq,dict); %codificamos la señal
fprintf('Número de letras usadas %d\n',numel(letras_usadas))
fprintf('Longitud la secuencia codificada %d\n', length(seq_codificada))

%% Paso 9

tamagno_comprimido=(length(letras_usadas)+1)*1+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);
fprintf('Tamaño fichero comprimido en bytes  %d\n',tamagno_comprimido)

%% Paso 10

deco=huffmandeco(seq_codificada,dict);

%% Paso 11
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
     isequal(seq,uint8(deco)))
 %% Paso 13

clc; clear all;
N=9;
Fichero=cell(N);
Fichero{1}='constitucion española.txt';
Fichero{2}='Fundacion e Imperio - Isaac Asimov.txt';
Fichero{3}='Cinco semanas en globo - Julio Verne.txt';
Fichero{4}='ptt1.pbm';
Fichero{5}='ptt4.pbm';
Fichero{6}='ptt8.pbm';
Fichero{7}='camera.pgm';
Fichero{8}='bird.pgm';
Fichero{9}='bridge.pgm'; 

for i=1:9
res=HuffmmanJMRC(Fichero{i});
end


%% Paso 15

clc; close all; clear all;
M=256;
img=uint8(zeros(M));
img(:,129:M)=255;
imshow(img);
img16=uint16(img);
img2=255*img16(:,1:2:size(img,2))+img16(:,2:2:size(img,2));
[U,V]=size(img2);
seq=reshape(img2,1,U*V);


%% Paso 16 
[M,N]=size(img);
seq=reshape(img,1,M*N);
letras=[0:256*256-1];
histo=hist(seq,letras);  

pos_hist_posit=find(histo>0);
letras_usadas=letras(pos_hist_posit);  
hist_letras_usadas=histo(pos_hist_posit);  
prob_letras_usadas=hist_letras_usadas/sum(hist_letras_usadas(:));  


[dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; 
seq_codificada = huffmanenco(seq,dict); 

L=(length(letras_usadas)+1)*2+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);

fprintf('Tamaño del fichero original en bytes %d\n',M*N);
fprintf('Tamaño del fichero comprimido en bytes %d\n',L);
deco=huffmandeco(seq_codificada,dict);
fprintf('Factor de compresión %3.5f\n\n',M*N/L)
deco=huffmandeco(seq_codificada,dict);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq,deco))
    
%% Paso 17 


[M,N]=size(img2);
seq=reshape(img2,1,M*N);
letras=[0:256*256-1];
histo=hist(seq,letras);  

pos_hist_posit=find(histo>0);
letras_usadas=letras(pos_hist_posit);  
hist_letras_usadas=histo(pos_hist_posit);  
prob_letras_usadas=hist_letras_usadas/sum(hist_letras_usadas(:));  


[dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; 
seq_codificada = huffmanenco(seq,dict); 

L=(length(letras_usadas)+1)*2+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);

fprintf('Tamaño del fichero original en bytes %d\n',2*M*N);
fprintf('Tamaño del fichero comprimido en bytes %d\n',L);
deco=huffmandeco(seq_codificada,dict);
fprintf('Factor de compresión %3.5f\n\n',M*N*2/L)
deco=huffmandeco(seq_codificada,dict);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq,deco))
%% Paso 19

close all; clear all;
img=imread('goldhill.pgm');
imshow(img);
img16=uint16(img);
img2=255*img16(:,1:2:size(img,2))+img16(:,2:2:size(img,2));

%% Paso 20

close all; clear all;
img=imread('bird.pgm');
imshow(img);
img16=uint16(img);
img2=255*img16(:,1:2:size(img,2))+img16(:,2:2:size(img,2));



[M,N]=size(img);
seq=reshape(img,1,M*N);
letras=[0:256*256-1];
histo=hist(seq,letras);  

pos_hist_posit=find(histo>0);
letras_usadas=letras(pos_hist_posit);  
hist_letras_usadas=histo(pos_hist_posit);  
prob_letras_usadas=hist_letras_usadas/sum(hist_letras_usadas(:));  


[dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; 
seq_codificada = huffmanenco(seq,dict); 

L=(length(letras_usadas)+1)*2+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);

fprintf('Tamaño del fichero original de img en bytes %d\n',2*M*N);
fprintf('Tamaño del fichero comprimido de img en bytes %d\n',L);
deco=huffmandeco(seq_codificada,dict);
fprintf('Factor de compresión de img %3.5f\n\n',M*N*2/L)
deco=huffmandeco(seq_codificada,dict);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq,deco))

[M,N]=size(img2);
seq=reshape(img2,1,M*N);
letras=[0:256*256-1];
histo=hist(seq,letras);  

pos_hist_posit=find(histo>0);
letras_usadas=letras(pos_hist_posit);  
hist_letras_usadas=histo(pos_hist_posit);  
prob_letras_usadas=hist_letras_usadas/sum(hist_letras_usadas(:));  


[dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; 
seq_codificada = huffmanenco(seq,dict); 

L=(length(letras_usadas)+1)*2+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);

fprintf('Tamaño del fichero original de img2 en bytes %d\n',2*M*N);
fprintf('Tamaño del fichero comprimido de img2 en bytes %d\n',L);
deco=huffmandeco(seq_codificada,dict);
fprintf('Factor de compresión de img2 %3.5f\n\n',M*N*2/L)
deco=huffmandeco(seq_codificada,dict);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq,deco))

%% Paso 21

clc, close all; clear all;
file_name = 'miss_am.yuv';
file_format = 'QCIF_PAL';
num_of_frames = 30;
[yuv_movie, yuv_array] = readYUV(file_name, num_of_frames, ...
file_format);
implay(yuv_movie)
fotograma1=yuv_array(:,:,1,1);
fotograma2=yuv_array(:,:,1,2);
figure; imshow(fotograma1);
figure; imshow(fotograma2);


%% Paso 22

[M,N]=size(fotograma1);
seq=reshape(fotograma1,1,M*N);
letras=[0:256*256-1];
histo=hist(seq,letras);  

pos_hist_posit=find(histo>0);
letras_usadas=letras(pos_hist_posit);  
hist_letras_usadas=histo(pos_hist_posit);


subplot(1,1,1); bar([0:256*256-1],histo);


prob_letras_usadas=hist_letras_usadas/sum(hist_letras_usadas(:));  


[dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; 
seq_codificada = huffmanenco(seq,dict); 

L=(length(letras_usadas)+1)*2+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);

fprintf('Tamaño del fichero original de fotograma2 en bytes %d\n',M*N);
fprintf('Tamaño del fichero comprimido de fotograma2 en bytes %d\n',L);
deco=huffmandeco(seq_codificada,dict);
fprintf('Factor de compresión de fotograma2 %3.5f\n\n',M*N/L)
deco=huffmandeco(seq_codificada,dict);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq,deco))




%% Paso 23
f1=int16(fotograma2);
f2=int16(fotograma1);
diferencia=f2-f1;

[M,N]=size(diferencia);
seq=reshape(diferencia,1,M*N);
letras=[1-(256*256):256*256-1];
histo=hist(seq,letras);  

pos_hist_posit=find(histo>0);
letras_usadas=letras(pos_hist_posit);  
hist_letras_usadas=histo(pos_hist_posit);


subplot(1,1,1); bar([1-(256*256):256*256-1],histo);


prob_letras_usadas=hist_letras_usadas/sum(hist_letras_usadas(:));  


[dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; 
seq_codificada = huffmanenco(seq,dict); 

L=(length(letras_usadas)+1)*2+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);

fprintf('Tamaño del fichero original de fotograma2 en bytes %d\n',M*N);
fprintf('Tamaño del fichero comprimido de fotograma2 en bytes %d\n',L);
deco=huffmandeco(seq_codificada,dict);
fprintf('Factor de compresión de fotograma2 %3.5f\n\n',M*N/L)
deco=huffmandeco(seq_codificada,dict);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq,deco))




end


function [resultado]= HuffmmanJMRC(archivo)
    fichero= archivo
    fid=fopen(fichero,'r')
    seq=fread(fid,'*uint8');
    fclose(fid);
    seq=reshape(seq,1,length(seq)); %leidos datos en seq vector fila
    fprintf('Tamaño %d\n',numel(seq))
    letras=[0:255];
    histo=histc(seq,letras); %calculamos histograma e indices
    posiciones=find(histo>0.0);
    tam=numel(seq);
    prob_letras_usadas=histo(posiciones)./tam;
    letras_usadas=letras(posiciones);

    [dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; %construimos el diccionario
    seq_codificada = huffmanenco(seq,dict); %codificamos la señal

    tamagno_comprimido=(length(letras_usadas)+1)*1+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);
    fprintf('Tamaño comprimido  %d\n',tamagno_comprimido)
    
    factorcompresion=numel(seq)/tamagno_comprimido;
    fprintf('factor de compresion %d\n',factorcompresion)
    
    deco=huffmandeco(seq_codificada,dict);
    resultado=isequal(seq,uint8(deco))
    
    
end
