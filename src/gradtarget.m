function [gW1,gW2]=gradtarget(W1,W2,X,Y)
# usage gradtarget(W1,W2,X,Y)
# 
# This function evaluates the gradient of the target function on W1 and W2 
# using Backpropagation.
# 
# Based on Christopher M. Bishop's method as described on "Neural Networks
# for Pattern Recognition".
# 
# W1: weights matrix between input and hidden layer
# W2: weights matrix between the hidden and the output layer
# X:  training set holding on the rows the input data, plus a final column 
#     equal to 1
# Y:  labels of the training set


    # First layer calculations:
    y1 = X * W1';
    sigmoid1 = sigmoid(y1);
    sigmoid_biased = [ones(rows(sigmoid1), 1), sigmoid1]; # Bias of the second layer contemplated.
    size(sigmoid1)
    # Second layer calculations:
    y2 = sigmoid1 * W2';
    Y_out = sigmoid(y2);

    # Error in the final layer:
    error_out = abs(Y - Y_out); 
    delta_Sum = error_out * W2(:, 2:end);
    # Error in the hidden layer:    
    error_hidden = sigmoidPrim(sigmoid1) .* delta_Sum; # Not counting the bias.

    m = rows(X) # Normalization factor

    # Normalized:
    gW1 = (error_hidden' * X) ./ m;
    gW2 = (error_out' * sigmoid1) ./ m; 

endfunction;

function y=sigmoid(x)
    y = 1 ./ (1 + e.^-x);
endfunction

function y=sigmoidPrim(x)
    y = (1 - x) .* x;
endfunction
