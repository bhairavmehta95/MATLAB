function dfm = fft_diff(f,m,isreal,filter)
% Approximates the mth derivative of the signal f (assumed to be sampled at
% equispaced pts on the circle, for a smooth periodic function)

% Extra parameter if signal is real-valued. Default is false. 
if nargin<3
   isreal=false;
   if nargin<4
   filter=false;
   end
end

% If f has multiple inputs (an array of nf functions sampled at N pts), it
% assumes f is N x nf (each function is a column vector)
[N,nf] = size(f); 

% Filter high freqs (optional)
if filter 
   Nfreq = N/4; 
else
   Nfreq = N/2; 
end

% Computes coefficients of fourier series using the fft
fhat = fftshift(fft(f)); 

% fourier multiplier
if mod(N,2)==0
   mult = 1i*(-(N/2):N/2-1).';
   mult(1)=0;
    
   mult(abs(mult)>Nfreq)=0; 
else
   mult = 1i*(-(N-1)/2:(N-1)/2).'; 
end

mult = repmat(mult.^m,1,nf); 

% coefficients for the fourier series of df^m/dx^m
dfmhat = mult.*fhat; 

% uses ifft to produce samples of df^m/dx^m
dfm = ifft(fftshift(dfmhat)); 

if isreal
   dfm = real(dfm);  
end