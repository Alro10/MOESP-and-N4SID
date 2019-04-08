% -------------------------------------------------------
% Generate system data (inputs and outputs)

% --------------------------------------------------------
% Author: Alexander Robles
% FEEC-UNICAMP
% ---------------------------------------------------------
clear all
clc

%   The state space system equations:
%                  x_k+1 = A x_k + B u_k
%                    y_k   = C x_k + D u_k

Ar=[0.2128 0.1360 0.1979 -0.0836;
0.1808 0.4420 -0.3279 0.2344;
-0.5182 0.1728 -0.5448 -0.3083;
0.2252 -0.0541 -0.4679 0.8290];
Br=[-0.0101 0.0317 -0.9347;
-0.0600 0.5621 0.1657;
-0.3310 -0.3712 -0.5846;
-0.2655 0.4255 0.2204];
Cr=[0.6557 -0.2502 -0.5188 -0.1229;
0.6532 -0.1583 -0.0550 -0.2497];
Dr=[-0.4326 0.1253 -1.1465
-1.6656 0.2877 1.1909];

%--------------

N=input('Size of data N:');


tt = 0:1:(N-1);



% -------------Input, u (white noise), is persistently exciting --------------
u1 = randn(1,N);
u2 = randn(1,N);
u3 = randn(1,N);
u = [u1; u2; u3];


%-------------Desing state-space model and outputs------
X0=zeros(4,1); % first state

%%%-----
x(:,1) = X0;
xc(:,1) = x(:,1);
yc(:,1) = Cr * xc(:,1) + Dr*u(:,1);
for i = 1:length(tt),
xc(:,i+1) = Ar * xc(:,i) + Br* u(:,i);
yc(:,i) = Cr * xc(:,i) + Dr*u(:,i);
y = yc;
end;


%-------------Plot inputs-------------------------
% figure (1)
% plot(tt,u1,'r',tt,u2,'c',tt,u3,'k');
% title('Inputs');
% legend('u1', 'u2', 'u3');

%-------------Plot outputs-------------------------
% figure (2)
% plot(tt,y(1,:),'g',tt,yc(1,:),'*b');
% title('Outputs');
% legend('y1', 'y1c');
%
% figure (3)
% plot(tt,y(2,:),'g',tt,yc(2,:),'*b');
% title('Outputs');
% legend('y2', 'y2c');
