Bhairav


Search Drive

Drive
.
Folder Path
My Drive
371 Final Project
FINAL DRAFT - Files
Part 2 Code
NEW 
Folders and views
My Drive
Shared with me
Google Photos
Recent
Starred
Trash
2 GB used
Name

fft_diff.m

Part2_Code.m
Text
Part2_Code.m
Details
Activity
Part2_Code.m
Sharing Info
W
B
N
S
General Info
Type
Text
Size
6 KB (6,030 bytes)
Storage used
0 bytesOwned by someone else
Location
Part 2 Code
Owner
Wyatt Kowall
Modified
9:21 PM by Wyatt Kowall
Opened
9:25 PM by me
Created
9:21 PM
Description
Add a description
Download permissions
Viewers can download
All selections cleared 


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
