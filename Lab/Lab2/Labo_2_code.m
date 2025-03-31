clear
clc
close all

% %% Exercice 6
% 
% Lenad_true_value = imread("lenad.tif");
% Lenad = im2double(Lenad_true_value);
% figure('Name','Lenad');
% imshow(Lenad);
% 
% Lenal_true_value = imread("lenal.tif");
% Lenal = im2double(Lenal_true_value);
% figure('Name','Lenal');
% imshow(Lenal);
% 
% figure('Name','Histogram')
% subplot(1,2,1);
% imhist(Lenal,64);
% title('Lenad - dark picture');
% subplot(1,2,2);
% imhist(Lenad,64);
% title('Lenal - faded picture');
% 
% %% Exercice 7
% 
% Baboon_true_value = imread("baboon.tif");
% Baboon = im2double(Baboon_true_value);
% figure('Name','Baboon');
% imshow(Baboon);
% 
% figure('Name','Histogram')
% subplot(1,2,1);
% imhist(Baboon, 64);
% title('Baboon - Original');
% 
% max_value = max(max(Baboon));
% min_value = min(min(Baboon));
% Baboon_adj = imadjust(Baboon,[min_value max_value],[0 1],1);
% 
% subplot(1,2,2);
% imhist(Baboon_adj, 64);
% title('Baboon adjusted');
% 
% %% Exercice 8
% 
% Lenagray_true_value = imread("lenagray.tif");
% Lenagray = im2double(Lenagray_true_value);
% figure('Name','lenagray');
% imshow(Lenagray);
% 
% figure('Name','Histogram')
% subplot(2,2,1);
% imhist(Lenagray, 64);
% title('Lenagray - Original');
% 
% max_value = max(max(Lenagray));
% min_value = min(min(Lenagray));
% Lenagray_adj = imadjust(Lenagray,[min_value max_value],[0 1],1);
% 
% subplot(2,2,2);
% imhist(Lenagray_adj, 64);
% title('Lenagray - Gamma 1');
% 
% max_value = max(max(Lenagray));
% min_value = min(min(Lenagray));
% Lenagray_adj = imadjust(Lenagray,[min_value max_value],[0 1],0.33);
% 
% subplot(2,2,3);
% imhist(Lenagray_adj, 64);
% title('Lenagray - Gamma .33');
% 
% max_value = max(max(Lenagray));
% min_value = min(min(Lenagray));
% Lenagray_adj = imadjust(Lenagray,[min_value max_value],[0 1],3);
% 
% subplot(2,2,4);
% imhist(Lenagray_adj, 64);
% title('Lenagray - Gamma 3');
% 
% %% Exercice 9
% 
% Baboon_true_value = imread("baboon.tif");
% Baboon = im2double(Baboon_true_value);
% figure('Name','Baboon');
% imshow(Baboon);
% 
% figure('Name','Histogram')
% subplot(1,3,1);
% imhist(Baboon, 64);
% title('Baboon - Original');
% 
% subplot(1,3,2);
% Baboon_eq = histeq(Baboon,64);
% imhist(Baboon_eq, 64);
% title('Baboon - Equalized - 64');
% 
% subplot(1,3,3);
% Baboon_eq = histeq(Baboon,150);
% imhist(Baboon_eq, 64);
% title('Baboon - Equalized - 150');
% 
% % pdf is still not uniform by equalizing on 150 bins - it means there are
% % significant clusters of points localized in a specific range of the
% % brightness scale leading to peaks area or low probability area.
% % (Indeed the baboon picture is very dark with a lot of point concentration
% %  in a specific range of the birghtness scale).

%% Exercice 10

Medical_true_value = imread("medical.tif");
Medical_im = im2double(Medical_true_value);
figure('Name','Medical');
subplot(3,2,1);
imshow(Medical_im);
title('Original');

subplot(3,2,2);
imhist(Medical_im, 64);
title('Medical - Histogram');

T1 = 0;
T2 = 0.4;
air = my_threshold (Medical_im, T1, T2);
subplot(3,2,3);
imshow(air);
title('Air');
T1 = 0.4;
T2 = 0.5;
blood = my_threshold (Medical_im, T1, T2);
subplot(3,2,4);
imshow(blood);
title('Blood');
T1 = 0.5;
T2 = 1;
bone = my_threshold (Medical_im, T1, T2);
subplot(3,2,5);
imshow(bone);
title('Bone');
