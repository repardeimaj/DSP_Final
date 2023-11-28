[x, fs] = audioread('CantinaBand60.wav');
%[x, fs] = audioread('test.m4a');


t_original = (0:length(x)-1) / fs;
t_scaled = (0:2:length(x) - 1)/fs;

x_scaled = interp1(t_original, x, t_scaled, 'linear', 0);

% subplot(411);
% plot(x);
% subplot(412);
% plot(x_scaled);

X = fft(x, length(x));
X_scaled = fft(x_scaled, length(x_scaled));

% subplot(413);
% plot(abs(X));
% subplot(414);
% plot(abs(X_scaled));

[s,f,t] = stft(x,fs,Window=hann(1000),OverlapLength=500,FFTLength=5120);


scale_factor = 3;
prev_len = length(s(1,:));
new_len = scale_factor * prev_len;

original_indices = linspace(1, prev_len, prev_len);
desired_indices = linspace(1, prev_len, new_len);

interpolated_sequence = interp1(original_indices, s', desired_indices, 'linear');

x2 = istft(interpolated_sequence',fs,Window=hann(1000),OverlapLength=500,FFTLength=5120);


sound(x2, fs);
