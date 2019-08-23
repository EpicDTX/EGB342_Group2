function listen_fm(MHz)
%LISTEN_FM listens to a selected FM radio station (in MHz) using RTL-SDR.

% Initialise Parameters
fs = 2.4e5;                 % Radio Sample rate
centerfreq = MHz * 10^6;    % FM radio Frequency
Audio_fs = 48000;           % Audio Sample Rate
kd = 75000;                 % Frequency Deviation 
ft = 7.5000e-05;            % Filter time constant
frmlen = 3840;              % frame length
buf = 3840;                 % Buffer size
T_audio = 0.0160;           % Audio frame time
T_stop = 10;

% Now initialise the the RTL-SDR object with FM radio parameters,
radio = comm.SDRRTLReceiver('CenterFrequency', centerfreq, ...
    'SampleRate', fs, ... 
    'EnableTunerAGC', true, ...
    'SamplesPerFrame', frmlen, ...
    'OutputDataType', 'single');

% FM Demodulate
FMDemod = comm.FMBroadcastDemodulator(...
    'SampleRate', fs, ...
    'FrequencyDeviation', kd, ...
    'FilterTimeConstant', ft, ...
    'AudioSampleRate', Audio_fs, ...
    'PlaySound', true, ...
    'BufferSize', buf, ...
    'Stereo', true);

% step() function of MATLAB to get a sample frame using radio object and demodulate using FMDemod function.
m = 0;
while m < T_stop 
    x = step(radio);
    step(FMDemod, x);
    m = m + T_audio;
end
release(radio);

end

