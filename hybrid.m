male = imread('image/male.jpg');
female = imread('image/female.jpg');
male = rgb2gray(male);
female = rgb2gray(female);
[m_rows m_cols] = size(male);
[f_rows f_cols] = size(female);
rows = min(m_rows,f_rows);
cols = min(m_cols,f_cols);
male = imresize(male,[rows cols]);
female = imresize(female,[rows cols]);
%d is the size of the filter matrix
d = 10;
mid = ceil(d/2);
high_pass_filter = ones(d)/(d^2-1) * -1;
high_pass_filter(mid,mid) = 1;
low_pass_filter = ones(d)/(d^2);
high_pass = imfilter(female,high_pass_filter);
low_pass = imfilter(male,low_pass_filter);
product = high_pass+low_pass;
imshow(product)
imwrite(product,'output/man-and-woman.jpg')