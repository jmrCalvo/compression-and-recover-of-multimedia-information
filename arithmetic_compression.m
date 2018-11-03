% Jose Manuel Rodriguez Calvo
% Tiempo: Incluye aquí el tiempo dedicado a realizar el guion

function pratica3JMRC()
%% Paso 1

close all; clear all; clc;
alf=['x' 'y' 'z'];
seqob=['y' 'z' 'x' 'z' 'z'];

%% Paso 2


indseqob=[2 3 1 3 3];

%% Paso 3

indseqob=zeros(1,numel(seqob),'uint16');

%% Paso 4
aux=ones(1,length(seqob));
aux=aux.*119;
indseqob=seqob-aux;

%% Paso 5

counts=[29 48 100];
code=arithenco(indseqob,counts)

%% Paso 6

indseqdec=arithdeco(code,counts,numel(indseqob));
seqdecf=alf(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seqob,seqdecf))

%% Paso 7

close all; clear all;
seqob=[1 1];
counts=[1 1];
code=arithenco(seqob,counts);
fprintf('Longitud de la secuencia codificada %d\n',...
    numel(code))

%% Paso 9 

close all; clear all;
seqob=[1 1];
counts=[50 50];
code=arithenco(seqob,counts);
fprintf('Longitud de la secuencia codificada %d\n',...
    numel(code))

%% Paso 11

clear all;close all; clc;
maximo= 0.0;
minimo=0.0;
rng(0);
while maximo==minimo
seq=randsrc(1,100000,[1 2; 0.01 0.99]);
maximo=max(seq(:));
minimo=min(seq(:));
end
histo=histc(seq,[1 2]);
bar([1 2],histo);

%% Paso 12

code=arithenco(seq,histo);
fprintf('Longitud de la secuencia codificada %d\n',numel(code));
indseqdec=arithdeco(code,histo,numel(seq));
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq,indseqdec))

%% Paso 13

clear all;close all; clc;
sol=[]
medias=[]
entropias=[]
rng(0);
for j=1:6
    sol_partial=[]
   for i=1:5
    maximo= 0.0;
    minimo=0.0;
    while maximo==minimo
    seq=randsrc(1,10^j,[1 2; 0.1 0.9]);
    maximo=max(seq(:));
    minimo=min(seq(:));
    end
    histo=histc(seq,[1 2]);
    %%bar([1 2],histo);
    code=arithenco(seq,histo);
    %%fprintf('Longitud de la secuencia codificada %d\n',numel(code));
    sol_partial=[sol_partial,numel(code)];
    entropias=[entropias,entropiaJMRC(histo)]
   end
   sol=[sol,sol_partial]
   media=median(sol_partial)
   medias=[medias,media]
end

subplot(1,3,1);plot(entropias);%dibujar por puntos
subplot(1,3,2);bar([1:30],sol);
subplot(1,3,3);bar([1:6],medias);


%% Paso 14 
%%texto10
clear all;close all; clc;

fichero='texto10.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
counts  = histc(seq_original,uv);

aux=ones(1,length(seq_original));
aux=aux.*47;
seq=seq_original-uint8(aux);

code=arithenco(seq,counts);

indseqdec=arithdeco(code,counts,length(seq));
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));


%% texto100
clear all;close all; clc;

fichero='texto100.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
counts  = histc(seq_original,uv);

aux=ones(1,length(seq_original));
aux=aux.*47;
seq=seq_original-uint8(aux);

code=arithenco(seq,counts);

indseqdec=arithdeco(code,counts,length(seq));
%definir alfa
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));
%% texto1000
clear all;close all; clc;

fichero='texto1000.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
counts  = histc(seq_original,uv);

aux=ones(1,length(seq_original));
aux=aux.*47;
seq=seq_original-uint8(aux);

code=arithenco(seq,counts);

indseqdec=arithdeco(code,counts,length(seq));
%definir alfa
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));

%% texto10000
clear all;close all; clc;

fichero='texto10000.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
counts  = histc(seq_original,uv);

aux=ones(1,length(seq_original));
aux=aux.*47;
seq=seq_original-uint8(aux);

code=arithenco(seq,counts);

indseqdec=arithdeco(code,counts,length(seq));
%definir alfa
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))

fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));

%% texto100000
clear all;close all; clc;

fichero='texto100000.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
counts  = histc(seq_original,uv);

aux=ones(1,length(seq_original));
aux=aux.*47;
seq=seq_original-uint8(aux);

code=arithenco(seq,counts);

indseqdec=arithdeco(code,counts,length(seq));
%definir alfa
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));

%% texto1000000
clear all;close all; clc;

fichero='texto1000000.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
counts  = histc(seq_original,uv);

aux=ones(1,length(seq_original));
aux=aux.*47;
seq=seq_original-uint8(aux);

code=arithenco(seq,counts);

indseqdec=arithdeco(code,counts,length(seq));
%definir alfa
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));


%% Paso 15

%% cinco semanas en globo
clear all;close all; clc;

fichero='Cinco Semanas en globo - Julio Verne.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
[counts,seq_index]  = histc(seq_original,uv);

code=arithenco(seq_index,counts);

indseqdec=arithdeco(code,counts,length(seq_index));

bar([1:numel(counts)],counts);
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))
fprintf('tamaño original %d\n',numel(seq_original));
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));
fprintf('factor de compresion %d\n',numel(seq_original)/numel(code));
HuffmmanJMRC(fichero)
%% constitucion española
clear all;close all; clc;

fichero='constitucion española.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
[counts,seq_index]  = histc(seq_original,uv);

code=arithenco(seq_index,counts);

indseqdec=arithdeco(code,counts,length(seq_index));

bar([1:numel(counts)],counts);
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))

fprintf('tamaño original %d\n',numel(seq_original));
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));
fprintf('factor de compresion %d\n',numel(seq_original)/numel(code));
HuffmmanJMRC(fichero)
%% FUNDACION E IMPERIO - Isaac Asimov
clear all;close all; clc;

fichero='FUNDACION E IMPERIO - Isaac Asimov.txt'
fid=fopen(fichero, 'r')
bits=fread(fid,inf,'*uint8');
fclose(fid)


seq_original=reshape(bits,1,length(bits));

uv = unique(seq_original);
[counts,seq_index]  = histc(seq_original,uv);

code=arithenco(seq_index,counts);

indseqdec=arithdeco(code,counts,length(seq_index));

bar([1:numel(counts)],counts);
seqdecf=uv(indseqdec);
fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
    isequal(seq_original,seqdecf))

fprintf('tamaño original %d\n',numel(seq_original));
fprintf('Longitud de Bit por simbolo %d\n',numel(code)/numel(seq_original));
fprintf('factor de compresion %d\n',numel(seq_original)/numel(code));
HuffmmanJMRC(fichero)


%% Paso 16


end

function [resultado]= HuffmmanJMRC(archivo)
    fichero= archivo
    fid=fopen(fichero,'r')
    seq=fread(fid,'*uint8');
    fclose(fid);
    seq=reshape(seq,1,length(seq)); %leidos datos en seq vector fila
    fprintf('Huffman: Tamaño %d\n',numel(seq))
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
    fprintf('Huffman: Bits por dato  %d\n',tamagno_comprimido/numel(seq))
    
    factorcompresion=numel(seq)/tamagno_comprimido;
    fprintf('Huffman: factor de compresion %d\n',factorcompresion)
    
    deco=huffmandeco(seq_codificada,dict);
    resultado=isequal(seq,uint8(deco))
    
    
end
function [resultado]= entropiaJMRC(histograma)
    
suma=sum(histograma);
prob= histograma./suma;
prob(find(prob==0.0))=[];
resultado=-sum(prob.*log2(prob));

end
