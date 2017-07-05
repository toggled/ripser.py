function [Is] = ripserPC( X, coeff, maxdim, thresh )
    %:param X: N X d point cloud with N points in d dimensions
    %:param coeff: Field coefficient with which to run TDA
    %:param maxdim: Maximum dimension of homology
    %:param thresh: Threshold up to which to add edges
    XSqr = sum(X.^2, 2);
    D = bsxfun(@plus, XSqr(:), XSqr(:)') - 2*(X*X');
    D = 0.5*(D + D');
    D(D < 0) = 0;
    if nargin < 4
        thresh = max(D(:))*2;
    end
    Is = ripserDM(D, coeff, maxdim, thresh);
end

