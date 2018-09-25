function w=packweight(W1, W2)

# Usage: packweight(W1, W2)
# 
# Packs the 2 weights matrix to a single vector. 
# 
# W1: Weights matrix between input and hidden layers.
# W2: Weights matrix between the hidden and the output layers.
    
    w = [W1(:) ; W2(:)];

endfunction;

function [W1,W2]=unpackweight(w, size_W1, size_W2)

# Usage: unpackweight(w, rows_W1, columns_W1)
# 
# Unpacks the W vector into 2 weight matrix (W1 and W2). 
# 
# W1: Weights matrix between input and hidden layers.
# W2: Weights matrix between the hidden and the output layers.

    rows_W1 = size_W1(1, 1); # Number of rows in W1.
    columns_W1 = size_W1(1, 2); # Number of columns in W1.
    rows_W2 = size_W2(1, 1); # Number of rows in W2.
    columns_W2 = size_W2(1, 2); # Number of columns in W2.
    W1 = reshape(w(1:(rows_W1 * columns_W1)), rows_W1, columns_W1);
    W2 = reshape(w(rows_W1 * columns_W1 +1:rows(w)), rows_W2, columns_W2);

endfunction;