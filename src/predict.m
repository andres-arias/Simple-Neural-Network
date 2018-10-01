function y=predict(W1,W2,X)
    
# usage predict(W1,W2,X)
# 
# This function propagates the input X on the neural network to
# predict the output vector y, given the weight matrices W1 and W2 for 
# a two-layered artificial neural network.
# 
# W1: weights matrix between input and hidden layer
# W2: weights matrix between the hidden and the output layer
# X:  Input vector, extended at its end with a 1

    # First layer calculations:
    y1 = X * W1';
    sigmoid1 = sigmoid(y1);
    sigmoid1 = [ones(rows(sigmoid1), 1), sigmoid1]; # Bias of the second layer contemplated.

    # Second layer calculations:
    y2 = sigmoid1 * W2';
    y = sigmoid(y2);


endfunction;

function y=sigmoid(x)
    y = 1 ./ (1 + e.^-x);
endfunction
