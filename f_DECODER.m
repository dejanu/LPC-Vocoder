%DECODER PORTION

function synth_speech = f_DECODER (aCoeff, pitch_plot, voiced, gain);



frame_length=1;
for i=2:length(gain)
    if gain(i) == 0,
        frame_length = frame_length + 1;
    else break;
    end
end


for b=1 : frame_length : (length(gain)),    
    
    %cadru contine fonem sonor sau insonor
    if voiced(b) == 1,   %fonem sonor
            pitch_plot_b = pitch_plot(b);
        syn_y1 = f_SYN_V (aCoeff, gain, frame_length, pitch_plot_b, b);
    else syn_y1 = f_SYN_UV (aCoeff, gain, frame_length, b); %fonem insonor
    end
    
    synth_speech(b:b+frame_length-1) = syn_y1;
end