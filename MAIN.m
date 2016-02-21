clear all;
clc;



inpfilenm = 'x_(n)';
[x, fs] =wavread(inpfilenm); 



%Durata fisier audio,
t=length(x)./fs;
sprintf('Processing the wavefile "%s"', inpfilenm)
sprintf('The wavefile is  %3.2f  seconds long', t)



M=10;  %ordinul predictorului
[aCoeff, pitch_plot, voiced, gain] = f_ENCODER(x, fs, M);  %pitch_plot is pitch periods
synth_speech = f_DECODER (aCoeff, pitch_plot, voiced, gain);


%RESULTS
beep;
disp('Apasa o tasta pentru redarea fisierului original');
pause;
soundsc(x, fs);

disp('Apasa o tasa pentru redarea fisier compresie LPC');
pause;
soundsc(synth_speech, fs);

figure;
subplot(2,1,1), plot(x); title(['Semnal original = "', inpfilenm, '"']); 
subplot(2,1,2), plot(synth_speech); title(['Semnal sintetizat "', inpfilenm, '" utilizand alg LPC']);