% MOESP Function 

% m = dim(u), p = dim(y), n = dim(x); R = Numero de filas de blocos
% U = km x N Matriz de Entradas
% Y = kp x N Matriz de Saidas

% Number of columns depends number of Hankel blocks R--- N=ndat-R+1
% If R ups >>j will decrease !DO NOT FORGET! 07/11/16
function [A,B,C,D,n] = moespar(u,y,R)

%Number of inputs and outputs:
[m,nu] = size(u);
if nu < m;u = u';[m,nu] = size(u);end

[p,ny] = size(y);
if ny < p;y = y';[p,ny] = size(y);end

Ncol=ny-R+1;% Calculate number of COLUMNS BLOCK HANKEL

%Make BLOCK HANKEL INPUTS U-OUTPUTS Y
U= blkhank(u,R,Ncol);
Y= blkhank(y,R,Ncol);

km = size(U,1); kp = size(Y,1);  % Rows of U and Y
L = triu(qr([U;Y]'))'; % LQ decomposition %Eq. 3.45  qr: Orthogonal-triangular decomposition.
L11 = L(1:km,1:km);
L21 = L(km+1:km+kp,1:km);
L22 = L(km+1:km+kp,km+1:km+kp);
[UU,SS,VV] = svd(L22);  % Eq. 3.48  Singular Value Descomposition
s1 = diag(SS);
n=find(cumsum(s1)>0.8*sum(s1),1);
%n=4;
U1 = UU(:,1:n); % n is known, as you can see last equation
Ok = U1*sqrtm(SS(1:n,1:n)); % SQRTM     Matrix square root. %Eq. 3.49
% Matrices A and C
C = Ok(1:p,1:n); % Eq. (6.41)
A = pinv(Ok(1:p*(R-1),1:n))*Ok(p+1:p*R,1:n);  % Eq.3.51
% Matrices B and D
U2 = UU(:,n+1:size(UU',1));
Z = U2'*L21/L11;  % Eq. 3.53
XX = []; RR = [];
for j = 1:R
XX = [XX; Z(:,m*(j-1)+1:m*j)];
Okj = Ok(1:p*(R-j),:);
Rj = [zeros(p*(j-1),p) zeros(p*(j-1),n);
eye(p) zeros(p,n); zeros(p*(R-j),p) Okj];
RR = [RR; U2'*Rj];
end
DB = pinv(RR)*XX;  % Eq. 3.57
D = DB(1:p,:);
B = DB(p+1:size(DB,1),:);