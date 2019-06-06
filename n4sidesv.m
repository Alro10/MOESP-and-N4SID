
% N4SID_VAR FUNCTION

function [A,B,C,D,n]=n4sidesv(u,y,k,N,a)



% [A,B,C,D,n] = n4sidkatamodar(u(:,1:100),y(:,1:100),k) validate function
% n4sidkatamodar

A=[];
B=[];
C=[];
D=[];

for i=a:a:N
    [A(:,(2*i)/a-1:(2*i)/a),B(:,(2*i)/a-1:(2*i)/a),C(:,(2*i)/a-1:(2*i)/a),D(:,(2*i)/a-1:(2*i)/a)]=n4sidkatamodar(u(:,i-a+1:i),y(:,i-a+1:i),k);



end

n=size(A,1);
