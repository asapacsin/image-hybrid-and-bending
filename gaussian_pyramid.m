function g = gaussian_pyramid(g0)
    [rows cols rgb] = size(g0);
    t = floor(min(log2(rows),log2(cols)));
    % g{1} actually mean g0
    g{1} = g0;
    for i = 1:t
            g{i+1} = gaussian(g0,i);
            %figure;imshow(g{i})
    end
end

