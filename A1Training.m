%% Assignment 1 
%  Run the GenerateAssignment1Data.m script if you have not already done
%  so.
clear all, close all, clc % clearing and preparing a clean workspace.
% Loading your data into the workspace. 
% Do not change the following line.
load('A1Data.mat','msg','fs','st1','st2','st3');
% m2 variable is used for Part 2.
% fs is the sampling frequency.
% kf2 is the frequency deviation factor. 

%==========================================================================
% Below are the variables you MUST use throughout your assignment.
% Failure to adhere to the names will result in your group losing marks.
% Not all variables may be referenced in the assignment brief. However, it
% is a good idea to examine these vectors and make sure they are what you
% expect them to be.
% 
% ------- Part 1
% fc1 - carrier frequency
% c1 - carrier
% m1 - message
% kf1 - frequency sensitivity factor
% y1 - modulated signal (time domain)
% Y1 - modulated signal (frequency domain) - Fourier transform only
% 
% ------ Part 2
% m2 - message
% fs - sample rate
% kf2 - frequency sensitivity factor
% t2 - time vector
% BW_FM - theoretical bandwidth
% fc2 - carrier frequency
% s - modulated signal
% y2 - modulated signal after passing through channel
% mr - demodulated signal

%==========================================================================
% Enter your code below this line:
%==========================================================================

% Student IDs:
% 9934731
% 10008373
% 9994653

%% PART 1: FM Theory
%% 1a) - Setup proposed radio link

% Time vector
samples = 1e5;
t1 = linspace(0,1,3*samples+1); 
t1(end) = [];

% Frequency vector
Ts = t1(2)-t1(1);
fs1 = 1/Ts;
f1 = linspace(-fs1/2,fs1/2,length(t1)+1); 
f1(end) = [];

% Defining some frequency modulation parameters
fc1 = 4.5e8;     % Carrier frequency
fm = 1.5e4;      % Message frequency
kf1 = 6e4;       % Frequency sensitivity
Ac = 10;         % Carrier amplitude
Am = 1;          % Message amplitude

%% 1b) - Modulated signal expression

% FM Modulation
m1 = Am*cos(2*pi*fm*t1);                     % Message signal
m1_int = cumsum(m1)./fs1;                    % Integral term
y1 = Ac*cos(2*pi*fc1*t1+2*pi*kf1*m1_int);    % Modulated signal
Y1 = fft(y1);                                % Modulated signal (FT)

% Plot modulated signal
figure
stem(f1, abs(fftshift(Y1))/fs1, 'Marker', '.')
title('Modulated Signal Y1 in Frequency Domain')
xlabel('Frequency[Hz]')
ylabel('Magnitude')

% Compute maximum frequency deviation and modulation index
Df1 = kf1*Am;           % Frequency deviation
beta1 = (kf1*Am)/fm;    % Modulation index

%% 1e) - Estimate bandwidth of modulated signal
BW_Theory = 2*(beta1 + 1)*fm;   % Theoretical bandwidth

%% PART 2: FM Training
%% 2c) - Inspect testing signal

% Time vector 
t2 = linspace(0,length(msg)/fs, length(msg)+1); %72 seconds
t2(end) = [];

% Plot signal in Time Domain
figure
plot(t2, msg)
title("msg in Time Domain")
xlabel("Time[s]")
ylabel("Amplitude")
xlim([0 72]) % Range of msg signal

%% 2d) - Estimate bandwidth

% Frequency Vector
f2 = linspace(-fs/2, fs/2, length(t2)+1);
f2(end) = [];

% Ploting the signal in the Frequency domain
MSG = abs(fftshift(fft(msg)))/fs;
figure
subplot(2, 1, 1)
plot(f2,MSG,'r')
xlabel('Frequency[Hz]') 
ylabel('Magnitude')
title('Magnitude Spectrum of MSG')
xlim([-1000 1000])
subplot(2, 1, 2)
plot(f2, MSG,'r')
xlabel('Frequency[Hz]') 
ylabel('Magnitude')
title('Magnitude Spectrum of MSG (last peak)')
xlim([695 705])

% Using the magnitude spectrum of msg, bandwidth is from 0Hz to around 
% 705Hz, only the positive frquencies are considered.
% Estimated bandwidth
BW_MSG = 705; %Hz

%% 2e) - Choosing a carrier frequency

% Empty signal vector
pulse = zeros(1, length(msg));

% Pulse of frame 1
pulse(1) = 1;

% channel.p applied
[msg_pulse] = channel(pulse);

% Clean 
MSG_PULSE = abs(fftshift(fft(msg_pulse)));

figure              
plot(f2, MSG_PULSE)      
title('Frequency Response of Channel')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

% the bandwith from the positive side is estimated to be 7633 and 1.648e4
% therefore the bandwidth is 8847 Hz
% The carrier frequency is the value that is in the middle of the bandwidth
% which is 1.2057e4, therefore:

%Selected Bnadwidth
BW_EST = 8847;

%Estimated Carrier Frequency
fc2 = 1.2057e4;%Hz


%% 2f) - Frequency sensitivity factor and modulation index

%But we must estimate the maximum frequency sesitivity and then determine
%the corresponding Modulation Index. 
%beta2 = Df1/BW_MSG - the estimated message bandwidth is the denominator
%used to find Modulation index.
%This is used to transmit the hidden message 
%within the selecting the selecting band. This modulation index is 
%then used to calculate the Theoretical bandwidth.
%to find beta2 = (W - 2*B)/(2*B)
beta2 = (BW_EST - 2*BW_MSG)/(2*BW_MSG);

%% 2g) - Theoretical bandwidth and peak frequency
kf2 = (beta2*BW_MSG)/max(msg); 
BW_FM = 2*(beta2 + 1)*BW_MSG;

%% 2j) - Apply fm_mod

[msg_tx] = fm_mod(msg, fc2, fs, kf2);

%% 2k) - Modulated signal in time/frequency domain

% Fourier transformed modulated msg
MSG_TX = abs(fftshift(fft(msg_tx)))/fs;

% Plotting the results
figure
subplot(2,1,1)
plot(t2, msg_tx)
title("Modulated msg in Time Domain")
xlabel("Time[s]")
ylabel("Amplitude")
subplot(2,1,2)
plot(f2, MSG_TX)
title("Modulated msg in Frequency Domain")
xlabel("Frequency[Hz]")
ylabel("Magnitude")

figure
plot(f2,MSG_TX)
title("Positive Modulated msg in Frequency Domain")
xlabel("Frequency[Hz]")
ylabel("Magnitude")
xlim([0 2.2e4])

figure
subplot(2,1,1)
plot(t2, msg)
hold on
plot(t2, msg_tx)
hold off
title("Unmodulated msg vs Modulated msg [Time Domain]")
xlabel("Time[s]")
ylabel("Amplitude")
legend('Unmodulated Signal', 'Modulated Signal')
subplot(2,1,2)
plot(f2, MSG)
hold on
plot(f2, MSG_TX)
hold off
title("Unmodulated msg vs Modulated msg [Frequency Domain]")
xlabel("Frequency[Hz]")
ylabel("Magnitude")
legend('Unmodulated Signal', 'Modulated Signal')
ylim([0 70])
xlim([-2e4 2e4])

%Zoomed in frequency domain
figure
plot(f2, MSG)
hold on
plot(f2, MSG_TX)
hold off
title("Unmodulated msg vs Modulated msg [Frequency Domain]")
xlabel("Frequency[Hz]")
ylabel("Magnitude")
legend('Unmodulated Signal', 'Modulated Signal')
ylim([0 1.5])
xlim([-2e4 2e4])


%% 2l) - Verify signal within frequency band

% Plot and verify the signal is within the selected frequency band. Comment
% on any out-of-band radiation and discuss any measures to take in order to
% remove the out-band-radiation.

figure
plot(f2,MSG_PULSE)
hold on
plot(f2,MSG_TX)
hold off
title('FM Signal [Frequency Domain]')
xlabel("Frequency[Hz]")
ylabel("Magnitude")
legend('Frequency Response [msg tx]', 'Modulated Signal')

%% 2m) - Transmit modulated signal
[msg_rx] = channel(msg_tx);

%% 2o) - Demodulate signal
[msg_rc] = fm_demod(msg_rx, fc2, fs, kf2)

%% PART 3: Radio-frequency Spectrum Measurements

% see spectrum_analyser.m
