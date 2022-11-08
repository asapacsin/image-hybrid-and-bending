function out = gau_lap(in);
    g1 = gaussian(in);
    [rows cols rgb] = size(in);
    v0 = imresize(g1, [rows cols]);
    out = laplacian(in,v0);
end
