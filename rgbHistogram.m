function [sol] = rgbHistogram(path_to_image, count_bins)
    %citirea imaginii
    img = imread(path_to_image);
    div = 256 / count_bins;
    [latime lungime] = size(img(:, :, 1));
    r = img(:, :, 1);
    g = img(:, :, 2);
    b = img(:, :, 3);
    %impart fiecare element din r,g,b la 256/count_bins
    %(si trunchiez rezultatul) 
    %pentru a vedea din ce interval face parte
    r = idivide(r, div, "floor");
    g = idivide(g, div, "floor");
    b = idivide(b, div, "floor");
    %adun 1 in fiecare element al fiecarei matrice pt a folosi fct accumarray
    r = r .+ 1;
    g = g .+ 1;
    b = b .+ 1;
    v2 = size(1, count_bins);
    v1 = accumarray(r(:), 1, [1 count_bins]);
    v2 = accumarray(g(:), 1, [1 count_bins]);
    v3 = accumarray(b(:), 1, [1 count_bins]);
    sol = [v1, v2, v3];
endfunction
