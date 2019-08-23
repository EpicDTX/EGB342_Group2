function [msg_tx] = fm_mod(msg, fc2, fs, Df2)
%FM_MOD Modulates a signal, using msg as the signal to be modulated, fc2 as
%the carrier frequency (Hz), fs being the sampling frequency (Hz) and Df2
%as the peak frequency deviation.

% Carrier amplitude
Ac = 1;

% Time sample
Ts = length(msg)/fs;

% Time vector
t = linspace(0, Ts, length(msg)+1);
t(end) = [];

% Integral term
msg_int = cumsum(msg)*Ts;

% Modulated signal output
msg_tx = Ac*cos(2*pi*fc2*t + 2*pi*Df2*msg_int);

end

