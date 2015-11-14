%% Zad1

clear all
close all
load('data_01.mat')

fs=1000;

figure
plot(linspace(0,length(x)/fs,length(x)),x)
xlabel('Time [s]')
ylabel('Output [-]')

ftspec = @(w, k, T) ((k^2)./(1+(T^2)*(w.^2)));

Hpsd = psd(spectrum.yulear, x, 'Fs', 1000);
freq = Hpsd.Frequencies;
cspec = Hpsd.Data;

k = sqrt(cspec(1));
T = fminsearch(@(T) (sum(abs(ftspec(freq*2*pi, k, T) - cspec))), 0);

figure
plot(freq,10*log10(ftspec(freq*2*pi,k,T)), ...
     freq,10*log10(cspec))
 
xlabel('Frequency [Hz]')
ylabel('Power ratio [dB]')
legend('Approximate [yulear]','Estimate [yulear]')

%% Zad2

clear all
close all
load('data_02.mat')

fs = 1000;

figure
plot(linspace(0,length(x)/fs,length(x)),x)
xlabel('Time [s]')
ylabel('Output [-]')

ftspec = @(w, k, xi, w0) ((k^2)./((w.^2-w0^2).^2+4*(xi^2)*(w0^2).*(w.^2)));

Hpsd = psd(spectrum.yulear, x, 'Fs', 1000);
freq = Hpsd.Frequencies;
cspec = Hpsd.Data;

C = fminsearch(@(C) (sum(abs(ftspec(freq*2*pi, C(1), C(2), C(3)) - cspec))), ...
    [1.4, 0.0484, 246*2*pi]);

figure
plot(freq,10*log10(ftspec(freq*2*pi, C(1), C(2), C(3))), ...
     freq,10*log10(cspec))

xlabel('Frequency [Hz]')
ylabel('Power ratio [dB]')
legend('Approximate [yulear]','Estimate [yulear]')
