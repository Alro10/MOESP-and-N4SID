
% MOESP_VAR FUNCTION

function [A,B,C,D,n]=moespvaresv(u,y,R)

%a=input('Insira o valor de a: '); % window data size as an input


  A=[];
  B=[];
  C=[];
  D=[];

for i=a:a:1000   


    [A(:,(2*i)/a-1:(2*i)/a),B(:,(2*i)/a-1:(2*i)/a),C(:,(2*i)/a-1:(2*i)/a),D(:,(2*i)/a-1:(2*i)/a)]=moespar(u(:,i-a+1:i),y(:,i-a+1:i),R);

    % A(:,(2*i)/a-1:(2*i)/a) i=100 >>> A(:,1:2) == A(:,impar:par)


end

n=size(A,1);
