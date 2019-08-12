<<<<<<< HEAD
<<<<<<< HEAD
%% Assignment 1 Template 
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
=======
%% Assignment 1 Template 
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

%% (a) 
% Download the "Assignment1.zip" files and unzip all the content into a 
% single working directory.

%% (b)
% Open the file GenerateAssignment1Data.m and carefully read the 
% instructions supplied in the file. Enter first 7 digits of the student 
% numbers in the specified variables and run the script. This script only 
% needs to be executed once. Begin working from A1Training.m after 
% A1Data.mat has been generated.

%% c)
% The signal that you will be using for testing the FM system is given in 
% the variable msg. This testing signal is identical to a monitoring signal 
% that will be transmitted over the FM system. Generate the time vector 
% corresponding to this signal and store it in the variable t2. Sampling 
% frequency is given in the variable fs. Take care in constructing this 
% correctly. Using this time vector, plot the signal in the time domain. 
% Identify any important features of the signal.
%==========================================================================

% Time vector
samples = length(msg);
t2 = linspace(0,0.15,samples+1); t2 = t2(1:end-1);

% Frequency vector
Ts = t2(2)-t2(1);
fs = 1/Ts;
f = linspace(-fs/2,fs/2,length(t2)+1); f = f(1:end-1);

% Plot FM signal in time domain
figure(1)
plot(t2,msg)
title('FM signal in time domain')
legend('Equation','fmmod()')
xlabel('Time (s)'), ylabel('Amplitude'), grid minor

%% d)
% Estimate the bandwidth of the given message using the spectrum plot and 
% store it in the variable BW_MSG. Describe how you estimated the 
% bandwidth.
%==========================================================================

%% e)
% Testing the FM system requires that a suitable carrier frequency be 
% chosen. The nature of the transmission channel dictates the choice of 
% this frequency. The channel has been saved into your current working 
% directory in the file channel.p. This channel behaves as a linear time 
% invariant (LTI) system. It takes one input msg tx and produces one output 
% msg rx. Think of the output as being a distorted version (channel induced 
% distortions) of the input signal. The syntax of using the channel is:
% 
% [msg rx] = channel(msg tx);
% 
% Determine the frequency response of the channel using the impulse 
% response and identify suitable frequency band to transmit your message 
% signal. Estimate the bandwidth of the selected frequency band.
% 
% Determine a suitable carrier frequency for this channel and store this 
% value in variable fc2 as a value in Hz. Explain your process and fully 
% justify your answer. Use suitable mathematical developments, code, and 
% graphical assets to aid the justification. The response should be no 
% longer than two pages.
%==========================================================================

% Calling 'channel.p'
[msg_rx] = channel(msg);

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
>>>>>>> master
=======
%% Assignment 1 Template 
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
%% Part 1 Variables

% Carrier frequency
% fc1 = ;

% Carrier
% c1 = ;

% Message
% m1 = ;

% Frequency sensitivity factor
kf1 = 60000;

% Modulated signal (time domain)
% y1 = ;

% Modulated signal (frequency domain) - Fourier transform only
% Y1 = ;

% Modulation index
% beta1 = ;

% Peak frequency deviation
% Df1 = ;

%% (a) 
% Download the "Assignment1.zip" files and unzip all the content into a 
% single working directory.

%% (b)
% Open the file GenerateAssignment1Data.m and carefully read the 
% instructions supplied in the file. Enter first 7 digits of the student 
% numbers in the specified variables and run the script. This script only 
% needs to be executed once. Begin working from A1Training.m after 
% A1Data.mat has been generated.

%% c)
% The signal that you will be using for testing the FM system is given in 
% the variable msg. This testing signal is identical to a monitoring signal 
% that will be transmitted over the FM system. Generate the time vector 
% corresponding to this signal and store it in the variable t2. Sampling 
% frequency is given in the variable fs. Take care in constructing this 
% correctly. Using this time vector, plot the signal in the time domain. 
% Identify any important features of the signal.
%==========================================================================

% Building a Time Vector

% Length of msg
samples = length(msg);

% Time sample
Ts = 1/fs;

% Time vector
t2 = linspace(0,0.72,samples+1); t2 = t2(1:end-1);

Ts2 = t2(2)-t2(1);

% Plot signal in Time Domain
figure(1)
plot(t2, msg)


%% d)
% Estimate the bandwidth of the given message using the spectrum plot and 
% store it in the variable BW_MSG. Describe how you estimated the 
% bandwidth.
%==========================================================================

%% e)
% Testing the FM system requires that a suitable carrier frequency be 
% chosen. The nature of the transmission channel dictates the choice of 
% this frequency. The channel has been saved into your current working 
% directory in the file channel.p. This channel behaves as a linear time 
% invariant (LTI) system. It takes one input msg tx and produces one output 
% msg rx. Think of the output as being a distorted version (channel induced 
% distortions) of the input signal. The syntax of using the channel is:
% 
% [msg rx] = channel(msg tx);
% 
% Determine the frequency response of the channel using the impulse 
% response and identify suitable frequency band to transmit your message 
% signal. Estimate the bandwidth of the selected frequency band.
% 
% Determine a suitable carrier frequency for this channel and store this 
% value in variable fc2 as a value in Hz. Explain your process and fully 
% justify your answer. Use suitable mathematical developments, code, and 
% graphical assets to aid the justification. The response should be no 
% longer than two pages.
%==========================================================================

% Calling 'channel.p'
%[msg_rx] = channel(msg);

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
>>>>>>> master