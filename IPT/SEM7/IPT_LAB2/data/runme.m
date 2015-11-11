clear all
load('data_01.mat')

usrtf = @(s, k, T) ((k)./(T * s + 1));
pwrs = @(w, k, T) (abs(usrtf(w * 1i, k, T)) .^ 2);

h = spectrum.yulear;
Hpsd = psd(h, x, 'Fs', 1000);
H = Hpsd.Data;
H = 10 * log10(H);

Ht = @(k, T) (10 * log10(pwrs(Hpsd.Frequencies, k, T)));

k = 10 ^ (H(1) / 20);
T = fminsearch(@(T0) (sum(abs(H - Ht(k, T0)))), 1);

plot(Hpsd.Frequencies, H)
grid on
xlabel('Freq [Hz]')
ylabel('Power [dB]')
hold on
plot(Hpsd.Frequencies, Ht(k, T), 'r')