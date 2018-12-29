%% Parameters
Tm=5;% Length of signal (s)
Fd=512;% Sampling frequency (Hz)
Ak=0.5;% Constant component (Unit)
A1=1;% The amplitude of the first sinusoid (Unit)
A2=0.7;% Amplitude of the second sinusoid (Unit)
F1=13;% Frequency of the first sinusoid (Hz)
F2=42;% Frequency of the second sinusoid (Hz)
Phi1=0;% Initial phase of the first sinusoid (Degrees)
Phi2=37;% The initial phase of the second sinusoid (Degrees)
An=3*A1;% Noise Dispersion (Unit)
FftL=1024;% Number of Fourier Spectrum Lines
%% Generating work arrays
T=0:1/Fd:Tm;% Time Arrays
Noise=An*randn(1,length(T));% An array of random noise with a length equal to the array of time
Signal=Ak+A1*sind((F1*360).*T+Phi1)+A2*sind((F2*360).*T+Phi2);% Signal array (a mixture of 2x sinusoids and a constant component)
%% Spectral representation of the signal
FftS=abs(fft(Signal,FftL));% The amplitudes of the Fourier transform of the signal
FftS=2*FftS./FftL;% Spectrum normalization by amplitude
FftS(1)=FftS(1)/2;% The normalization of the constant component in the spectrum
FftSh=abs(fft(Signal+Noise,FftL));% The amplitudes of the Fourier transform of the signal + noise mixture
FftSh=2*FftSh./FftL;% Spectrum normalization by amplitude
FftSh(1)=FftSh(1)/2;% The normalization of the constant component in the spectrum
%% Plotting
subplot(2,1,1);
plot(T,Signal);
title('Signal');
xlabel('Time (s)');
ylabel('Amplitude (Unit)');
subplot(2,1,2);
plot(T,Signal+Noise);
title('Signal+Noise');
xlabel('Time (s)');
ylabel('Amplitude (Unit)');

F=0:Fd/FftL:Fd/2-1/FftL;% The frequency array of the calculated Fourier spectrum
figure();
subplot(2,1,1);
plot(F,FftS(1:length(F)));%  Plotting of the spectrum of the Fourier signal
title('Signal spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude (Unit)');
subplot(2,1,2);
plot(F,FftSh(1:length(F)));% Plotting of the Fourier signal spectrum
title('Signal spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude (Unit)');
