function [w] = learn(X, y)
    [latime lungime] = size(X);
    %creare X tilda
    Xtilda = zeros(latime, lungime + 1);
    Xtilda = X;
    Xtilda(:, lungime + 1) = 1;
    %aplicare transformare Householder
    [Q R] = Householder(Xtilda);
    Q_trans = Q';
    bprim = Q_trans * y;
    %aplicare SST
    w = SST(R, bprim);
    w = w';
end
