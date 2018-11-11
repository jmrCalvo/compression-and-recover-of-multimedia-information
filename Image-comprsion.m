%% Practica05RodriguezJoseManuel

% Tiempo: Incluye aquí el tiempo dedicado a realizar el guion

function pratica3JMRC()

%% Paso 2
close all; clear all;
img=imread("bird.pgm");

for i = 5:5:100 
    filename=sprintf('result/bird%i.jpeg',i)
    imwrite(img, filename, 'Quality', i);
end


%% Paso 4
close all; clear all;

imgOriginal=imread("bird.pgm");
[Mo,No]=size(imgOriginal);
seqOriginal=uint8(reshape(imgOriginal,1,Mo*No));

tasas=[]
distorsiones=[]

for i = 5:5:100 
    filename=sprintf('result/bird%i.jpeg',i);
    img=imread(filename);
    [M,N]=size(img);
    seq=uint8(reshape(img,1,M*N));
    uv = uint8(unique(seq));
    counts=histc(seq,uv);
    tam=numel(counts);
    prob=counts./tam;
    tasa=sum(prob./(M*N*0.125));
    
    dif=seqOriginal-seq;
    dif_cuadratic=dif.^2;
    
    error=sum(dif_cuadratic)/(M*N);
    
    fprintf('La razon de bird %i es %3.5f y el error es %3.5f\n\n',i,tasa,error)
    tasas=[tasas,tasa];
    distorsiones=[distorsiones,error];
    
    plot(tasas,distorsiones,'.r');
end
%% Paso 6
close all; clear all;clc;


img=imread("bird.pgm");

for i = 2:2:40 
    filename=sprintf('result/bird%i.jp2',i)
    imwrite(img,filename,'CompressionRatio',i);
    
end

%% Paso 7
close all; clear all;

imgOriginal=imread("bird.pgm");
[Mo,No]=size(imgOriginal);
seqOriginal=uint8(reshape(imgOriginal,1,Mo*No));

tasas=[]
distorsiones=[]

for i = 40:-2:2 
    filename=sprintf('result/bird%i.jp2',i);
    img=imread(filename);
    [M,N]=size(img);
    seq=uint8(reshape(img,1,M*N));
    uv = uint8(unique(seq));
    counts=histc(seq,uv);
    tam=numel(counts);
    prob=counts./tam;
    tasa=sum(prob./(M*N*0.125));
    
    dif=seqOriginal-seq;
    dif_cuadratic=dif.^2;
    
    error=sum(dif_cuadratic)/(M*N);
    
    fprintf('La razon de bird %i es %3.5f y el error es %3.5f\n\n',i,tasa,error)
    tasas=[tasas,tasa];
    distorsiones=[distorsiones,error];
    
    plot(tasas,distorsiones,'.r');
end

%% Paso 10
close all; clear all;

imgOriginal=imread("bird.pgm");
[Mo,No]=size(imgOriginal);
seqOriginal=uint8(reshape(imgOriginal,1,Mo*No));

tasasJPEG=[]
distorsionesJPEG=[]
tasasJPEG2000=[]
distorsionesJPEG2000=[]

for i = 5:5:100 
    filename=sprintf('result/bird%i.jpeg',i);
    img=imread(filename);
    [M,N]=size(img);
    seq=uint8(reshape(img,1,M*N));
    uv = uint8(unique(seq));
    counts=histc(seq,uv);
    tam=numel(counts);
    prob=counts./tam;
    tasa=sum(prob./(M*N*0.125));
    
    dif=seqOriginal-seq;
    dif_cuadratic=dif.^2;
    
    error=sum(dif_cuadratic)/(M*N);
    tasasJPEG=[tasasJPEG,tasa];
    distorsionesJPEG=[distorsionesJPEG,error];
    
    
end
for i = 40:-2:2 
    filename=sprintf('result/bird%i.jp2',i);
    img=imread(filename);
    [M,N]=size(img);
    seq=uint8(reshape(img,1,M*N));
    uv = uint8(unique(seq));
    counts=histc(seq,uv);
    tam=numel(counts);
    prob=counts./tam;
    tasa=sum(prob./(M*N*0.125));
    
    dif=seqOriginal-seq;
    dif_cuadratic=dif.^2;
    
    error=sum(dif_cuadratic)/(M*N);
    tasasJPEG2000=[tasasJPEG2000,tasa];
    distorsionesJPEG2000=[distorsionesJPEG2000,error];
    
    
end

    plot(tasasJPEG,distorsionesJPEG,tasasJPEG2000,distorsionesJPEG2000);

end
