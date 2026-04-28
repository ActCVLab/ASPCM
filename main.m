%--------Mex Max_Xmap_Get6.m

 % Input data
img = imread('1.bmp'); 
mysize=size(img);
if numel(mysize)>2
    img=rgb2gray(img); 
end

% Execution algorithm
out  = ASPCM(img);
maxValue = max(max(out(:)));
out = im2uint8(out./maxValue);
    
% Visualization
figure;
subplot(121);
imshow(img);
subplot(122);
imshow(out);