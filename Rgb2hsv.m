function [matr] = Rgb2hsv(path_to_image)
    %citire imagine
    img = imread(path_to_image);
    [latime lungime straturi] = size(img);
    matr = zeros(latime, lungime, straturi);
    %normarea elementelor din matrici
    img = double(img) ./ 255;
    %caut maximul si minimul din r, g si b, pentru fiecare element
    Cmax = max(max(img(:, :, 1), img(:, :, 2)), img(:, :, 3));
    Cmin = min(min(img(:, :, 1), img(:, :, 2)), img(:, :, 3));
    delta = Cmax - Cmin;
    %calcularea lui V
    matr(:, :, 3) = Cmax;
    aux = zeros(latime, lungime);
    %aflarea lui S
    aux(find(Cmax)) = delta(find(Cmax)) ./ Cmax(find(Cmax));
    
    %aux(find(Cmax == 0)) = 0;
    %salvarea lui S
    matr(:, :, 2) = aux;
    rprim = img(:, :, 1);
    gprim = img(:, :, 2);
    bprim = img(:, :, 3);
    aux = zeros(latime, lungime);
    %calcularea lui H, in cazul in care Cmax = R
    aux(find(Cmax == rprim)) = mod((gprim(find(Cmax == rprim)) - bprim(find(Cmax == rprim))) ./ delta(find(Cmax == rprim)), 6) / 6;
    %calcularea lui H, in cazul in care Cmax = G
    aux(find(Cmax == gprim)) = ((bprim(find(Cmax == gprim)) - rprim(find(Cmax == gprim))) ./ delta(find(Cmax == gprim)) + 2) / 6;
    %calcularea lui H, in cazul in care Cmax = B
    aux(find(Cmax == bprim)) = ((rprim(find(Cmax == bprim)) - gprim(find(Cmax == bprim))) ./ delta(find(Cmax == bprim)) + 4) / 6;
    %in cazul in care mai sus am impartit la 0, 
    %modific acele valori din aux, cu 0
    aux(find(delta == 0)) = 0;
    matr(:, :, 1) = aux;
endfunction
