function [y] = fxcorr(x1,x2)
%FXCORR - cross-correlation
%   Return the cross-correlation of two discrete time series.
%   
%   Grammar
%       y = FXCORR(x1,x2)
%   
%   Input
%       x1 - input array
%           vector
%       x2 - input array
%           vector
% 
%   Output
%       y - cross-correlation
%           vector
%

n1 = length(x1) - 1;
n2 = length(x2) - 1;

if(n1 > n2)
    x1 = [zeros(1,n1) x1];
    x2 = [x2 zeros(1,n1+n1-n2)];
else
    x1 = [zeros(1,n2) x1 zeros(1,n2-n1)];
    x2 = [x2 zeros(1,n2)];
end

y = ifft(fft(x1).*conj(fft(x2)));

end