img = imread('image/lena.jpg');
g = gaussian_pyramid(img);
l = laplacian_pyramid(g);
[k t] = size(g);
% gaussian pyramid
%for i = 1:t
    %figure;imshow(g{i}) 
%end

% laplacian pyramid
for i =1:t-1
    figure;imshow(l{i})
end