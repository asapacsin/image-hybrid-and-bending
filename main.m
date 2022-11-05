g0 = imread('image/lena.jpg');
g0 = rgb2gray(g0);
g1 = gaussian(g0);
v0 = imresize(g1,size(g0));
l0 = laplacian(g0,v0);
imshow(g0),title('g0')
figure;imshow(g1),title('g1')
figure;imshow(l0),title('l0')

