
clear
clc
run('benchmark_ti.m')

% Script to compare MOESP-VAR and N4SID-VAR also gives two graphics
% run script and use results in PAPER N4SID-VAR



clc;

% Inputs: N, R, k, a


R=input('Insira o valor de block_MOESP: ');
k=input('Insira o valor de block_N4SID: ');

a=input('set a: '); % window data size as an input for two algorithms

[A1,B1,C1,D1,n1]=moespvaresv(u,y,R,N,a);

[A2,B2,C2,D2,n2] = n4sidesv(u,y,k,N,a);



run('BenchmarkIdentifiedMOESP_VAR.m')
run('BenchmarkIdentifiedN4SID_VAR.m')
