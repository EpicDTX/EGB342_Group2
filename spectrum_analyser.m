%   RTL-SDR Spectrum Scan
% - You can use this script to sweep and record the RF spectrum with your
%   RTL-SDR
% - Change the "location" parameter to something that identifies
%   your location, eg Brisbane
% - You may change range that the RTL-SDR will sweep over by changing the
%   values of "start_freq" and "start_freq" 
% - If you wish, you can also change the RLT-SDR sampling rate by changing
%   "rtlsdr_fs"
%   "number_samples" is the number of sample to be collected for each FFT
%   calculations. 


%spectrum_scan_original(start_freq,start_freq,rtlsdr_fs, number_samples, location);

% spectrum_sweep(750e6,800e6,3.2e6, 2^14,'Brisbane')

%   e.g. spectrum_scan_original(750e6,800e6,3.2e6, 2^14,'Brisbane');
%
%   This will produce a figure titled "rtlsdr_spectrum_750MHz_800MHz_Brisbane.jpg"
%  
% - At the end of the simulation, the recorded data will be processed and
%   plotted in a popup figure
% - This figure will be saved to the MATLAB 'current folder' for later
%   viewing
% - NOTE: to end simulation early, use |Ctrl| + |C|

%==========================================================================
% Enter your code below this line:
%==========================================================================

%% PART 3: Radio-frequency Spectrum Measurements

%% 3a) - Function listen_fm

% listen_fm(208);

%% 3c) - Spectrum analyser
rtlsdr_fs = 3.2e6;
number_samples = 2^17;

%% 1. FM analog radio transmission
start_freq = 87.5e6;
stop_freq = 108e6;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples,'FM analog radio transmission');

%% 2. Digital Audio Broadcasting (DAB)
start_freq = 202e6;
stop_freq = 209e6;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'Digital Audio Broadcasting (DAB)');

%% 3. Digital Video Broadcasting (DVB)
start_freq = 520e6;
stop_freq = 694e6;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'Digital Video Broadcasting (DVB)');

%% 4. Mobile Frequencies
start_freq = 9.35e8;
stop_freq = 9.6e8;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'Mobile Frequencies');

%% 5. Queensland Government Wireless Network (GWN)
start_freq = 420e6;
stop_freq = 430e6;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'GWN');

%% 3d) - Number of samples per frame effects

% FM analog radio transmission case
start_freq = 87.5e6;
stop_freq = 108e6;

number_samples1 = 2^17;
number_samples2 = 2^10;
number_samples3 = 2^4;

%% let n = 17
spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples1,'FM, n = 17');
%% let n = 9
spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples2,'FM, n = 10');
%% let n = 3
spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples3,'FM, n = 3');
