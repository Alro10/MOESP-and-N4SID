
% --------------------------------------------------------
% Author: Alexander Robles
% Feec-UNICAMP
% ---------------------------------------------------------
clear all;clc;
run('systemdata.m')

% Script for comparing MOESP and N4SID outputs



clc;

% Inputs of functions N, R, k
% Form Hankel matrices U,Y from system data (u,y) see blkhank.m


R=input('Block_MOESP rows: ');
k=input('Block_N4SID rows: ');

% call functions

[A1,B1,C1,D1,n1]=moespar(u,y,R);

[A2,B2,C2,D2,n2] = n4sidkatamodar(u,y,k);

%Check Markov parameters (impulse responseof of MIMO system):

% Dr, Cr*Br, Cr*Ar*Br, Cr*Ar^2*Br ...
% D1, C1*B1, C1*A1*B1, C1*A1^2*B1 ...

% Graphics of system outputs and model outputs (estimate outputs)
run('modeloutputs.m')
