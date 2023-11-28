[x, fs] = audioread('test.m4a');
 

t_original = (0:length(x)-1) / fs;
t_scaled = 2 * t_original;
x_scaled = interp1(t_original, x, t_scaled, 'linear', 0);

sound(x_scaled, fs)
clear sound
t_scaled = 0.75 * t_original;
x_scaled = interp1(t_original, x, t_scaled, 'linear', 0);
%sound(x_scaled, fs)

%audiowrite('scaled_audio.wav', x_scaled, fs);

fft_original = fft(x);
fft_scaled = fft(x_scaled);

% Frequency vector
f = (0:length(fft_original)-1) * fs / length(fft_original);
f2 = (0:length(fft_scaled)-1) * fs / length(fft_scaled);


% Plot the FFT of the original signal
figure;
subplot(2,1,1);
%plot(f, abs(fft_original));
plot(abs(fft_original));
title('FFT of Original Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');


% Plot the FFT of the scaled signal
subplot(2,1,2);
%plot(f2, abs(fft_scaled));
plot(abs(fft_scaled));

title('FFT of Scaled Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

