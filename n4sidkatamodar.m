
% Algoritmo do metodo N4SID modificado, com dados de entrada u,
% saida y, e k a ordem dos blocos de Hankel

function [A,B,C,D,n] = n4sidkatamodar(u,y,k)

[l,ny] = size(y);if (ny < l);y = y';[l,ny] = size(y);end
[m,nu] = size(u);if (nu < m);u = u';[m,nu] = size(u);end

% Determinar o numero de columns para as matrizes de Hankel
N = ny-2*k+1;

%Constroir as matrizes de dados, bloco de Hankel
U = blkhank(u,2*k,N);
Y = blkhank(y,2*k,N);
Up=U(1:k*m,:);
Uf=U(k*m+1:2*k*m,:);
Yp=Y(1:k*l,:);
Yf=Y(k*l+1:2*k*l,:);
km = size(Up,1);
kl = size(Yp,1);
Wp = [Up;Yp];
% *********** ALGORITMO ***********
%Passo 1
%decomposicao LQ
[Q,L] = qr([Uf;Up;Yp;Yf]',0);
Q=Q'; L=L';
L11 = L(1:km,1:km);
L21 = L(km+1:2*km,1:km);
L22 = L(km+1:2*km,km+1:2*km);
L31 = L(2*km+1:2*km+kl,1:km);
L32 = L(2*km+1:2*km+kl,km+1:2*km);
L33 = L(2*km+1:2*km+kl,2*km+1:2*km+kl);
L41 = L(2*km+kl+1:2*km+2*kl,1:km);
L42 = L(2*km+kl+1:2*km+2*kl,km+1:2*km);
L43 = L(2*km+kl+1:2*km+2*kl,2*km+1:2*km+kl);
L44 = L(2*km+kl+1:2*km+2*kl,2*km+kl+1:2*km+2*kl);
R11 = L11;
R21 = [L21;L31];
R22 = [L22 zeros(km,kl); L32 L33];
R31 = L41;
R32 = [L42 L43];

xi = R32*pinv(R22)*Wp;
%Passo 2
[UU,SS,VV] = svd(xi);
ss = diag(SS);
n=find(cumsum(ss)>0.85*sum(ss),1);
%n=4;
% hold off
% figure(1)
% title('Valores singulares');
% xlabel('Ordem');
% plot(ss)
% pause;
% figure(2)
% title('Valores singulares');
% xlabel('Ordem');
% bar(ss)
% n = input(' Ordem do sistema ? ');
% while isempty(n)
% n = input(' Ordem do sistema ? ');
% end
U1 = UU(:,1:n);
S1 = SS(1:n,1:n);
V1 = VV(1:n,:);
%Matrizes A e C
Ok = U1*sqrtm(S1);
C = Ok(1:l,1:n);
A = pinv(Ok(1:l*(k-1),1:n))*Ok(l+1:l*k,1:n);

%Passo 3
%Matrizes B e D
TOEP = (R31 - R32*pinv(R22)*R21)*pinv(R11);
G = TOEP(:,1:m);
G0 = G(1:l,:);
G1 = G(l+1:2*l,:);
G2 = G(2*l+1:3*l,:);
G3 = G(3*l+1:4*l,:);
G4 = G(4*l+1:5*l,:);
D = G0;
Hk = [G1 G2;G2 G3;G3 G4];
Ok1 = Ok(1:3*l,:);
Ck = pinv(Ok1)*Hk;
B = Ck(:,1:m);