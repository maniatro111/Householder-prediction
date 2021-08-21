function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    [X y] = preprocess(path_to_testset, histogram, count_bins);
    [latime lungime] = size(X);
    Xtilda = zeros(latime, lungime + 1);
    Xtilda = X;
    Xtilda(:, lungime + 1) = 1;
    %formarea solutie
    ycomp = Xtilda * w;
    cazposib = latime;
    contor = 0;
    %calculare cazuri favorabile
    for i = 1:latime

        if (ycomp(i) >= 0 && y(i) >= 0) || (ycomp(i) <= 0 && y(i) <= 0)
            contor++;
        endif

    endfor
    %calcularea procentului de recunoastere
    percentage = double(contor / cazposib);
endfunction
