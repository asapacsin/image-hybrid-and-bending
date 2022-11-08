function l = laplacian_pyramid(g)
    [k,s] = size(g);
    l = cell(s-1);
    for i = 1:s-1
            [r,c,rgb] = size(g{i});
            l{i} = g{i} - imresize(g{i+1},[r,c]);
    end
end