g0 = imread('image/lena.jpg');
g0 = rgb2gray(g0);
g1 = gaussian(g0);
v0 = imresize(g1,size(g0));
v0 = uint8(v0);
l0 = laplacian(g0,v0);
imshow(l0)

