% -------------------------------------------------------
% Generate de data for time-variant benchmarck
% --------------------------------------------------------
% Author: Alexander Robles
% ---------------------------------------------------------
clear
clc



bk = [-2 1;1  1];
ck = [1 3;1 2];
dk= [1 3;1 1];


%--------------
N=input('All data size: ');

tt = 0:1:(N-1);
% bc=randn(1,N+2*k-1);
% e1=sqrt(1.3483)*bc;
% e2=sqrt(1.3177)*bc;


% -------------Input as a vector--------------
u1 = randn(1,N);
u2 = randn(1,N);
%u3 = randn(1,N+2*k-1);
u = [u1; u2];


%-------------State space model------
X0=zeros(2,1);

%%%-----
x(:,1) = X0;
xc(:,1) = x(:,1);
yc(:,1) = ck * xc(:,1) + dk*u(:,1);
for i = 1:length(tt)
xc(:,i+1) = [-tt(i)^2/(2*2500^2)+tt(i)/5000,-tt(i)^4/(16*2500^4)-tt(i)^3/(8*2500^3)-13*tt(i)^2/(16*2500^2)-3*tt(i)/(4*2500)-0.5;1,-1] * xc(:,i) + bk* u(:,i);
yc(:,i) = ck * xc(:,i) + dk*u(:,i) ;
end

% add noise to outputs
% b1 = 0.3;
% a1 = -0.3;
%
% e = (b1-a1).*rand(1,N) + a1;


y = yc + 0.3*yc;
%-------------Plot inputs-------------------------
% figure (1)
% plot(tt,u1,'r',tt,u2,'c');
% title('Inputs');
% legend('u1', 'u2');

%-------------Plot outputs-------------------------
% figure (2)
% plot(tt,y(1,:),'r',tt,yc(1,:),'*b');
% title('Ouput');
% legend('y1', 'y1c');
%
% figure (3)
% plot(tt,y(2,:),'g',tt,yc(2,:),'*b');
% title('Output');
% legend('y2', 'y2c');
