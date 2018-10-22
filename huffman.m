% Jose Manuel Rodriguez Calvo
% Tiempo: Incluye aquí el tiempo dedicado a realizar el guion
%% Paso 1

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
tam=numel(letras);
prob=posiciones./tam;


