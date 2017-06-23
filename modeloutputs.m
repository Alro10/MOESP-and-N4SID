%Benchmarck :
%   Consider a multivariable fourth order system a,b,c,d
%   with 3 inputs and 2 outputs:


clc;
    

    u1 = u;
    
%   The state space system equations:
%                  x_{k+1) = A x_k + B u_k         
%                    y_k   = C x_k + D u_k 

    
    %   Model output:
    ym = dlsim(A1,B1,C1,D1,u1)'; % MOESP output
    yn = dlsim(A2,B2,C2,D2,u1)'; % N4SID output
    
  
%-------------Plot system outputs and model outputs-------------------------
figure (1)
hold off;subplot;clf;
subplot(211);plot(tt,y(1,:),'r',tt,ym(1,:),'*b');
title('First ouput');
legend('System output', 'MOESP output');
subplot(212);plot(tt,y(2,:),'r',tt,ym(2,:),'*b');
legend('System output', 'MOESP output');
title('Second output');

figure (2)
hold off;subplot;clf;
subplot(211);plot(tt,y(1,:),'r',tt,yn(1,:),'*b');
title('First ouput');
legend('System output', 'M4SID output');
subplot(212);plot(tt,y(2,:),'r',tt,yn(2,:),'*b');
legend('System output', 'N4SID output');
title('Second output');

%----------------Mean square error--------------------------------------------

 errMOESP = (sum((y(1,:)-ym(1,:)).^2)+sum((y(2,:)-ym(2,:)).^2))/N
 errN4SID = (sum((y(1,:)-yn(1,:)).^2)+sum((y(2,:)-yn(2,:)).^2))/N
  

  
  
    
    