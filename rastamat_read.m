f = 'Beethoven (119).wav';
%f = '07-Sacrifice.mp3';
%[d, sr] = wavread(f);
[d, sr] = audioread(f);

% play sound
%soundsc(d,sr);

[mm,aspc] = melfcc(d*3.3752, sr, 'maxfreq', 8000, 'numcep', 20, 'nbands', 22, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', 0.032, 'hoptime', 0.016, 'preemph', 0, 'dither', 1);
[im,ispc] = invmelfcc(mm, sr, 'maxfreq', 8000, 'numcep', 20, 'nbands', 22, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', 0.032, 'hoptime', 0.016, 'preemph', 0, 'dither', 1);

% play reconstructed sound
%soundsc(im,sr)
% compare the spectrograms
subplot(311)
specgram(d(:,1),512,sr)
caxis([-50 30])
title('original music')
subplot(312)
specgram(im(:,1),512,sr)
caxis([-40 40])
title('noise-excited reconstruction from cepstra')

% Notice how spectral detail is blurred out e.g. the triangle hits around 6 kHz are broadened to a noise bank from 6-8 kHz.
% save out the reconstruction
%max(abs(im))
wavwrite(im/4,sr,'Reconstructed.wav');