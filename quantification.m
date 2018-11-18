%Jose Manuel Rodriguez Calvo

function pratica6JMRC()
%% Paso 1
close all; clear all;


X=[0:255];
for i=0:8
  factor=2^i;
  Q_X=uint8(floor(factor*(floor(X/factor)+0.5)));          
  subplot(3,3,i+1)
  plot(X,Q_X); axis('tight');
  title(['factor de cuantificación ',num2str(factor)])
end

%% Paso 2
close all; clear all;
adouble=double(imread("bridge.pgm"));
errors=[];
entropias=[];
[M,N]=size(adouble);
for i=0:8
    factor=2^i;
    Q_X=double(floor(factor*(floor(adouble(:)/factor)+0.5)));
    img=reshape(Q_X,[256,256]);
    error=sum(reshape((adouble-img).^2,1,M*N))/(M*N);
    errors=[errors,error];
    entropia=entropiaJMRC(img);
    entropias=[entropias,entropia];
end
plot(entropias,errors,'.r');


%% Paso 4

clear all;close all;
A=imread('camera.pgm');
imhist(A)
%% Paso 5

dA=double(A);
frontera_particion =[127];
valores_cuantizados=[63 , 192];
[index,quants]=quantiz(dA(:),frontera_particion,valores_cuantizados); 
dqA=reshape(quants,size(dA));
qA=uint8(dqA);
subplot(1,2,1), imshow(A); title('Imagen Original')
subplot(1,2,2), imshow(qA); title('Cuantificación uniforme con dos niveles')
error=(dA-dqA).*(dA-dqA);
qerror=sum(error(:))/numel(error);
fprintf('Error cuadrático medio de cuantificación %e\n',qerror);

%% Paso 6

[particion, vcuantizada,qerror] = lloyds(dA(:),2);
[index,quants]=quantiz(dA(:),particion,vcuantizada); 
qA=uint8(reshape(quants,size(A)));
subplot(1,2,1), imshow(A); title('Imagen Original')
subplot(1,2,2), imshow(qA); title('Cuantificación Max-Lloyd con dos niveles')
formatspc='Partición= %4.2f; V. cuantizadas =%4.2f, %4.2f; Error =%4.2f.\n';
fprintf(formatspc,particion,vcuantizada(1),vcuantizada(2),qerror)

%% Paso 7

close all; clear all;
rng('default')
X=2*rand(1000,1)-1; %entiende este paso
hist(X); title('Histograma 1000 realizaciones U(-1,1)')
%% Paso 8

var=sum((X-mean(X)).*(X-mean(X)))/numel(X)


%% Paso 9

errors=[];
errorsTeoric=[]
[M,N]=size(X);
X_O=double(reshape(X,1,M*N));
n=[1:8];
for i=1:8
    factor=2^i;
    particion=linspace(min(X),max(X),factor);
    vcuantizados=linspace(min(X),max(X),factor+1);
    
    [index,Q_X]= quantiz(X_O,particion,vcuantizados);
    error=sum((X_O-Q_X).^2)/M;
    errors=[errors,error];
    
    varianza=((particion(2)-particion(1))^2)/12;
    errorsTeoric=[errorsTeoric,varianza]
end
plot(n,errors,n,errorsTeoric);
legend('error medio','error teorico')

%% Paso 11

close all; clear all; rng('default');
X=laprnd(1000,1,0,sqrt(1/30));
X=X(X>=-1 & X<=1);
hist(X); title('Histograma 2000 realizaciones Laplace(0,1/30)')

%% paso 12
errors=[];

[M,N]=size(X);
X_O=double(reshape(X,1,M*N));
n=[1:8];
for i=1:8
    factor=2^i;
    particion=linspace(min(X),max(X),factor);
    vcuantizados=linspace(min(X),max(X),factor+1);
    
    [index,Q_X]= quantiz(X_O,particion,vcuantizados);
    error=sum((X_O-Q_X).^2)/M;
    errors=[errors,error];
    
end
plot(n,errors);
legend('error medio')
%% paso 13

errors=[]
n=[1:8];
for i=1:8
    factor=2^i;
    rng('default');
    Valor=double(rand(1,factor).*max(X));
    minv=ones(1,length(Valor))*min(X);
    Valor=Valor+minv;
    %it is the first random values
    old_Valor=zeros(1,length(Valor));
    Zero=zeros(1,length(Valor));
    while (round(Valor-old_Valor,3)~=Zero)
        tam=[];
        groups=[];
        groups=zeros(length(X),factor);
        
        for k=1:length(X)
            position_i=near(Valor,X(k));
            position_j=find(groups(:,position_i)==0,1);
            groups(position_j,position_i)=X(k);
        end
        
        sumatori=sum(groups);
        for j=1:factor
            tam=[tam,length(find(groups(:,j)~=0))]
        end
        
        old_Valor=Valor;
        Valor=sumatori./tam;
          
    
    error=0
    
    end
    
    for m=1:factor
        error=error+sum((groups(:,m)-Valor(m)).^2)
    end
    
    
    error=error/length(X);
    errors=[errors,error];
end
plot(n,errors);
legend('error medio')    

end


function [approached]=near(group,valor)
    approached_partial=0;
    min_valor=100000;
    
    for i=1:length(group)
       approaching=(group(i)-valor)^2;
       if approaching < min_valor
           min_valor=approaching;
           approached_partial=i;
       end
    end
    approached=approached_partial
end

function [resultado]= entropiaJMRC(histograma)
    
suma=sum(histograma);
prob= histograma./suma;
prob(find(prob==0.0))=[];
resultado=-sum(prob.*log2(prob));

end
