function [msg_tx] = fm_mod(msg, fc2, fs, kf2)
%FM_MOD Modulates a signal, using msg as the signal to be modulated, fc2 as
%the carrier frequency (Hz), fs being the sampling frequency (Hz) and kf2
%as the frequency sensitivity.

% Carrier amplitude
Ac = 1;

% Time sample
Ts = length(msg)/fs;

% Time vector
t = linspace(0, Ts, length(msg)+1);
t(end) = [];

% Integral term
msg_int = cumsum(msg)./fs;

% Modulated signal output
msg_tx = Ac * cos(2 * pi * fc2 * t + 2 * pi * kf2 * msg_int);

end

