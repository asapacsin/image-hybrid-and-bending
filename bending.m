apple = imread('image/apple.png');
orange = imread('image/orange.png');
[row,col,rgb] = size(apple);
orange = imresize(orange,[row col]);
%mask = fspecial('gaussian',[row col],10);
%mask = mask*(1/max(max(mask)));
mask = imread('image/mid-mask.png');
mask = im2bw(mask);
h = fspecial('gaussian',[5 5],0.5);
g_apple = gaussian_pyramid(apple);
l_apple = laplacian_pyramid(g_apple);
g_orange = gaussian_pyramid(orange);
l_orange = laplacian_pyramid(g_orange);
[k,ls_len] = size(l_apple);
ls = cell(1,ls_len);
ls_len = ls_len-5;
for i = 1:ls_len
    ls{i} = rgb_mask(l_orange{i},mask) + rgb_mask(l_apple{i},1-mask);
end
last_g_orange = g_orange{ls_len+1};
last_g_apple = g_apple{ls_len+1};
[row,col,rgb] =size(last_g_orange);
output = rgb_mask(last_g_orange,mask)+rgb_mask(last_g_apple,1-mask);
for i = 1:ls_len
    [rows,cols,rgb] = size(g_apple{ls_len+1-i});
    output = imresize(output,[rows,cols]);
    %conv2
    output = double(output);
    for k = 1:rgb
        output(:,:,k) = conv2(output(:,:,k),h,'same');
    end
    output = uint8(output);
    output = output +ls{ls_len+1-i};
end
original_blend = rgb_mask(apple,mask)+rgb_mask(orange,1-mask);
subplot(2,2,1);
imshow(apple),title('apple')
subplot(2,2,2);
imshow(orange),title('orange')
subplot(2,2,3);
imshow(original_blend),title('original blend')
subplot(2,2,4);
imshow(output),title('pyramid blend')
imwrite(output,'output/blend-apple-orange.jpg');