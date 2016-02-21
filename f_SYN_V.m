%a function of f_DEOCDER
   
    
% clear all;
% frame_length = 1440;
% pitch_plot_b = 92;

function syn_y1 = f_SYN_V (aCoeff, gain, frame_length, pitch_plot_b, b);

%creare tren de impulsuri reale
for f=1:frame_length
    if f./pitch_plot_b == floor(f./pitch_plot_b)
        ptrain(f) = 1;
    else ptrain (f) = 0;
    end
end

syn_y2 = filter(1, [1 aCoeff((b+1):(b+1+9))], ptrain);
syn_y1 = syn_y2 .* gain(b);