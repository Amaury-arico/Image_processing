clear; close all; clc;
%% Exercice 1

[aind,amap] = imread("trees.tif","TIF");
figure('Name','Original');
imshow(aind,amap);
RGB = ind2rgb(aind,amap);
figure('Name','RGB');
imshow(RGB);
GrayImag = ind2gray(aind,amap); 
figure('Name','Gray');
imshow(GrayImag);

YUV_Matrix = [0.299, 0.587, 0.114 ; 0.596, -0.274, -0.322 ; 0.211, -0.523, 0.312];
YUV_index_1 = YUV_Matrix*[RGB(1,1,1) ; RGB(1,1,2) ; RGB(1,1,3)];

%Gray value for the first index
disp(['Gray value from the matrix multiplication: ' num2str(YUV_index_1(1,1))]);
disp(['Gray value from the MATLAB gray function: ' num2str(double(GrayImag(1))/255)]);

%% Exercice 2

X=[1 2 3;3 1 2;2 3 1];
X_map=[1 0 0;0 1 0;0 0 1];

figure('Name','RGB, Magenta and black');
subplot(1, 3, 1);
imshow(X,X_map,'InitialMagnification','fit')
title('RGB');

X=[1 2 3;3 1 2;2 3 1];
X_map_secondary=[0 1 1;1 0 1;1 1 0];

subplot(1, 3, 2);
imshow(X,X_map_secondary,'InitialMagnification','fit');
title('Magenta');

X=[1 2 3;3 1 2;2 3 1];
X_map_black=[0 0 0;128/255 128/255 128/255;1 1 1];

subplot(1, 3, 3);
imshow(X,X_map_black,'InitialMagnification','fit');
title('Black');


%% Exercice 3

N = 100;
t = (0:1/N:1);
Signal = cos(2*pi*t);
figure('Name','signal');
plot(Signal);

Filter = 1/3*[1 1 1];
Length_filter = length(Filter);
Half_Length_filter = floor(Length_filter/2);
Signal_padding = zeros(1,Half_Length_filter*2 + length(Signal));
Signal_padding(Half_Length_filter+1:length(Signal)+Half_Length_filter) = Signal;
Conv_filter = fliplr(Filter);
Conv_result = zeros(1, length(Signal));
sum=0;

% Convolution function homemade
for shift=0:length(Signal)-1
    for i=1:length(Filter)  
        sum = sum + Conv_filter(i)*Signal_padding(i+shift);
    end
    Conv_result(shift+1) = sum;
    sum = 0;
end

%Conv function matlab

Conv_result_matlab = conv(Signal,Conv_filter,'same');


%% Exercice 4

rectangle = zeros(128,128);
rectangle(60:68,44:88) = 1;
figure('Name','Rectangle');
imshow(rectangle);

DFT = fft2(rectangle);
DFT = fftshift(DFT);
figure('Name','check_fft');
subplot(3,2,1);
surfc(abs(DFT));
subplot(3,2,2);
imagesc(abs(DFT));

rect_45=imrotate(rectangle,45);

DFT_45 = fft2(rect_45);
DFT_45 = fftshift(DFT_45);
subplot(3,2,3);
surfc(abs(DFT_45));
subplot(3,2,4);
imagesc(abs(DFT_45));

rect_90=imrotate(rectangle,90);

DFT_90 = fft2(rect_90);
DFT_90 = fftshift(DFT_90);
subplot(3,2,5);
surfc(abs(DFT_90));
subplot(3,2,6);
imagesc(abs(DFT_90));

%% Exercice 5 

figure('Name','mandrill');
imshow("mandrill.tif");
[aind_mandrill] = imread("mandrill.tif","TIF");

figure('Name','zebra');
imshow("zebra.tif");
[aind_zebra] = imread("zebra.tif","TIF");

DFT_mandrill = fft2(aind_mandrill);
DFT_mandrill = fftshift(DFT_mandrill);
DFT_zebra = fft2(aind_zebra);
DFT_zebra = fftshift(DFT_zebra);

figure('Name','DFT_zebra_mandrill');
subplot(2,2,1);
imshow(log10(1+abs(DFT_mandrill)), [])
subplot(2,2,2);
imshow(angle(DFT_mandrill), []);
subplot(2,2,3);
imshow(log10(1+abs(DFT_zebra)), [])
subplot(2,2,4);
imshow(angle(DFT_zebra), []);

% Creation of mix image

Image_DFT = (1+abs(DFT_mandrill)).*exp(1i*angle(DFT_zebra));
Image_temp = round(ifft2(Image_DFT));
figure('Name','Reconstruction');
imshow(Image_temp,[]);

Image_DFT = (1+abs(DFT_mandrill)).*exp(1i*angle(DFT_mandrill));
Image_temp = round(ifft2(Image_DFT));
figure('Name','Correct Image');
imshow(Image_temp,[]);

