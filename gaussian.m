function out = gaussian(in)
    h = fspecial('gaussian',[5 5],3);
    [rows cols k] = size(in);
    m = 5;
    n = 5;
    for k = 1:3
        i = 1;
        j = 1;
        initial_r = m;
        initial_c = n;
        while initial_r <rows
            j = 1;
            initial_c = n;
            while initial_c < cols
                get_matrix = in(initial_r-m+1:initial_r,initial_c-n+1:initial_c,k);
                get_matrix = double(get_matrix);
                out(i,j,k) = sum(sum(get_matrix.* h));
                initial_c = initial_c +1;
                j = j +1;
            end
            i = i+1;
            initial_r = initial_r +1;
        end
    end
    out = imresize(out,[rows/2 cols/2]);
    out = uint8(out);
end