
fs = 1e-3;
t = 0:fs:20*pi;
x = sin(2*pi*t);


[s,f,t] = stft(x,fs,Window=hann(100),OverlapLength=50,FFTLength=512);


scale_factor = 2;
prev_len = length(s(1,:));
new_len = scale_factor * prev_len;

original_indices = linspace(1, prev_len, prev_len);
desired_indices = linspace(1, prev_len, new_len);

interpolated_sequence = interp1(original_indices, s', desired_indices, 'linear');

x2 = istft(interpolated_sequence',fs,Window=hann(100),OverlapLength=50,FFTLength=512);


subplot(211);
plot(x);
subplot(212);
plot(x2);
