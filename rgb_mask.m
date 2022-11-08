function out = rgb_mask(main,mask)
    out = double(main);
    [rows,cols,rgb] = size(out);
    get_mask = imresize(mask,[rows,cols]);
    for k = 1:rgb
        for i = 1:rows
            for j =1:cols
                out(i,j,k) = out(i,j,k) * get_mask(i,j);
            end
        end
    end
    out = uint8(out);
end