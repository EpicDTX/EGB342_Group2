% fmmod test
clc
clear

% building the time vector
samples = 1e5;
t = linspace(0,0.15,3*samples+1); t = t(1:end-1);
% building frequency vector
Ts = t(2)-t(1);
fs = 1/Ts;
f = linspace(-fs/2,fs/2,length(t)+1); f = f(1:end-1);
% Defining some frequency modulation parameters.
Ac = 1; % amplitude of carrier
fc = 200; % frequency of carrier
kf1 = 30; % frequency sensitivity factor 1
kf2 = 60; % frequency sensitivity factor 2 (for comparison later)
% message signal in base band
x = [1*ones(1,samples), -2*ones(1,samples), 4*ones(1,samples)];

y2 = fmmod(x,fc,fs,kf2);