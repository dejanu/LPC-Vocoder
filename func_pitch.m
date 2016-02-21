% min_freq = 80;
% max_freq = 300;
% 
% period_max = round(fs / min_freq);
% period_min = round(fs / max_freq);

function pitch_period = func_pitch (y,fs)

clear pitch_period;

period_min = round (fs .* 2e-3);  %=nr esantioanre in 2s din "x"
                                   
period_max = round (fs .* 20e-3);   

%BODY OF PROGRAM
R=xcorr(y);
[R_max , R_mid]=max(R); 
                      
pitch_per_range = R ( R_mid + period_min : R_mid + period_max );
[R_max, R_mid] = max(pitch_per_range);
pitch_period = R_mid + period_min;
