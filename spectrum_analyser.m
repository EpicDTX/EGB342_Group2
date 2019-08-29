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

%   spectrum_scan_original(start_freq, stop_freq, rtlsdr_fs, number_samples, location);

%   e.g. spectrum_scan_original(750e6,800e6,3.2e6, 2^14,'Brisbane');
%
%   This will produce a figure titled "rtlsdr_spectrum_750MHz_800MHz_Brisbane.jpg"
%  
% - At the end of the simulation, the recorded data will be processed and
%   plotted in a popup figure
% - This figure will be saved to the MATLAB 'current folder' for later
%   viewing
% - NOTE: to end simulation early, use |Ctrl| + |C|

%% 1. FM analog radio transmission
start_freq = 87.5e6;
stop_freq = 108e6;
rtlsdr_fs = 3.2e6;
number_samples = 2^17;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples,'FM analog radio transmission');

%% 2. Digital Audio Broadcasting (DAB)
start_freq = 202e6;
stop_freq = 209e6;
rtlsdr_fs = 3.2e6;
number_samples = 2^17;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'Digital Audio Broadcasting (DAB)');

%% 3. Digital Video Broadcasting (DVB)
start_freq = 520e6;
stop_freq = 694e6;
rtlsdr_fs = 3.2e6;
number_samples = 2^17;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'Digital Video Broadcasting (DVB)');

%% 4. Mobile Frequencies
start_freq = 820e6;
stop_freq = 960e6;
rtlsdr_fs = 3.2e6;
number_samples = 2^17;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'Mobile Frequencies');

%% 5. Queensland Government Wireless Network (GWN)
start_freq = 420e6;
stop_freq = 430e6;
rtlsdr_fs = 3.2e6;
number_samples = 2^17;

spectrum_sweep(start_freq, stop_freq, rtlsdr_fs, number_samples, 'GWN');