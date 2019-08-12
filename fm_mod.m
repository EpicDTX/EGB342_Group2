function [msg_tx] = fm_mod(msg, fc2, fs, Df2)
%FM_MOD Modulates a signal, using msg as the signal to be modulated, fc2 as
%the carrier frequency (Hz), fs being the sampling frequency (Hz) and Df2
%as the peak frequency deviation.

% Amplitude of carrier
Ac = 1;

% Sampling period
Ts = length(msg)/fs;

% Integration using cumsum function
x_int = cumsum(x) * Ts;

% Modulation equation
msg_tx = Ac * cos(2 * pi * fc2 * t + 2 * pi * Df2 * x_int);

end

