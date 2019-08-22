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
fc1 = 450e6;    % Carrier frequency
fm = 15e3;      % Message frequency
kf1 = 60e3;     % Frequency sensitivity
Ac = 10;        % Carrier amplitude
Am = 1;         % Message amplitude

% FM Modulation
m1 = Am*cos(2*pi*fm*t1);                    % Message signal
x_int = cumsum(m1)*Ts;                      % Integral term
y1 = Ac*cos(2*pi*fc1*t1+2*pi*kf1*x_int);    % Modulated signal
Y1 = fft(y1);                               % Modulated signal (FT)

% Plot modulated signal
figure, clf
subplot(1,2,1)
stem(f1, abs(fftshift(Y1))/fs1, 'Marker', '.')
title('Modulated Signal Y1 in Frequency Domain')
xlabel('Frequency[Hz]'), ylabel('Magnitude')
xlim([-1e5,1e5]), grid minor
ylim([0,5])

% Compute maximum frequency deviation and modulation index
Df1 = kf1*Am;           % Frequency deviation
beta1 = (kf1*Am)/fm;    % Modulation index

% Determine no. of side-bands to contain 98% modulated signal power
R = 1;                % Assume R = 1 Ohm
P_total = Ac^2/(2*R); % 50W
P_carrier = (Ac*besselj(0, beta1))^2/(2*R);
P_sbtotal = P_total - P_carrier;

P_sb = 0; Num_sb = 0; efficiency = 0; % Initialise
while efficiency <= 0.98  
    Num_sb = Num_sb + 1;
    P_sb = P_sb + ((Ac*besselj(Num_sb,beta1))^2)/R;
    efficiency = P_sb/P_sbtotal;
end

% Plot of the corresponding magnitude spectrum
y1_selected = 0; % Intialise 
for n = -Num_sb:1:Num_sb
    y1_selected = y1_selected + Ac*besselj(n,beta1)*cos(2*pi*(fc1 + n*fm)*t1);
end

% Plot filtered signal
Y1_selected = fft(y1_selected);
subplot(1,2,2)
stem(f1,abs(fftshift(Y1_selected))/fs1, 'Marker', '.')
title('Frequency modulated signal Y1 - selected harmonics')
xlabel('Frequency[Hz]'), ylabel('Magnitude')
xlim([-1e5,1e5]), grid minor
ylim([0,5])

% Estimate bandwidth of modulated signal
BW_Theory = 2*(beta1 + 1)*fm;   % Theoretical bandwidth
BW_Estimate = obw(y1,fs1);      % Bandwidth estimation 

%% PART 2: FM Training

% c)

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

% d)

f2 = linspace(-fs/2, fs/2, length(t2)+1);
f2(end) = [];

MSG = fft(msg);
figure
subplot(2, 1, 1)
plot(f2, abs(fftshift(MSG))/fs,'r')
xlabel('Frequency[Hz]') 
ylabel('Magnitude')
title('Magnitude Spectrum of MSG')
xlim([-1000 1000])
subplot(2, 1, 2)
plot(f2, abs(fftshift(MSG))/fs,'r')
xlabel('Frequency[Hz]') 
ylabel('Magnitude')
title('Magnitude Spectrum of MSG (last peak)')
xlim([695 705])

% Using the magnitude spectrum of msg, bandwidth is from 0Hz to around 
% 705Hz, only the positive frquencies are considered.
% Estimated bandwidth
BW_MSG = 705; %Hz

% e)

% Empty signal vector
pulse = zeros(1, length(msg));
% Pulse of frame 1
pulse(1) = 1;
% channel.p applied
msg_pulse = channel(pulse);
% Clean 
MSG_PULSE = abs(fftshift(fft(msg_pulse)))/fs;

figure, clf                 
plot(f2, MSG_PULSE)      
title('1 Frame Pulse'), grid minor
xlabel('Frequency (Hz)'), ylabel('Amplitude')



%% f) 
% Estimate the maximum frequency sensitivity factor and the corresponding 
% modulation index beta2 to transmit the given message withing the selected 
% band.
%==========================================================================


%% g) 
% Calculate theoretical bandwidth of the FM signal and peak frequency 
% deviation of the modulation, Df2. Store this value in BW_FM.
%==========================================================================


%% h)
% Create a MATLAB function fm mod to contain your frequency modulation 
% function. The function header is to conform to the following syntax:
% 
% function [msg tx] = fm mod(msg, fc2, fs, Df2);
% 
% Where msg tx is the modulated signal, msg is the signal to be modulated, 
% fc2 is the carrier frequency (in Hz), fs is the sampling frequency 
% (in Hz), and Df2 is the peak frequency deviation.

%% i) 
% Write the body of the frequency modulation function. Do not use the 
% inbuilt MATLAB integration function. Employ the MATLAB cumsum function 
% instead. Remember to include the full function in your report.

%% j) 
% You are now at a stage to test your system. Take the baseband signal msg 
% and modulate this signal with the fm mod function. Store the modulated 
% signal in the variable msg_tx.
%==========================================================================

% Test function (When it is completed)
%[msg_tx] = fm_mod(msg, fc2, fs, Df2);

%% k)
% Plot the modulated signal in the time and frequency domains. Compare 
% these plots with that of the baseband signal. Examine the differences 
% between the signals, and explain these differences in relation to theory. 
% Comment on the accuracy of your bandwidth calculation.
%==========================================================================

%% l)
% Plot and verify that your signal is within the selected frequency band. 
% Comment on any out of band radiation observed and discuss measures you 
% can take to remove out-of-band radiation.
%==========================================================================

%% m)
% Transmit the modulated signal msg_tx through the channel using provided 
% function transmit.p. Store the result in variable msg rx.
%==========================================================================

%% n)
% Describe the demodulation process of FM signal and show how you can 
% implement FM demodulation in MATLAB.

%% o)
% Demodulate the signal using the provided function and store the result in 
% msg rc:
% 
% [msg rc] = fm demod(msg rx, fc2, fs, Df2);
% 
% Note that this demodulation function also decodes an emergency message 
% contained within the signal.
%==========================================================================


%% p)
% You have now finished testing the system. If the transmission has been 
% performed successfully the monitoring string should consist of a message 
% string concatenated with student numbers of the group members and 
% FRAS-342x appended to the end.
% 
% What was the decoded message?