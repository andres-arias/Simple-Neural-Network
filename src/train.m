function [W1, W2]=training(W1, W2, X, Y, lambda, batchSize)

# usage training(W1, W2, X, Y, lambda, batchSize)
# 
# This function trains the network using Backpropagation by following
# a "mini-batch" approach: It takes a random sample of training data
# of "batchSize" elements and performs backpropagation with them.
# If batchSize = 1, it behaves as a stochastic gradient descent,
# if batchSize = n (number of elements in the whole set), it behaves
# as a batch gradient descent.
# 
# W1: weights matrix between input and hidden layer.
# W2: weights matrix between the hidden and the output layer.
# X:  training set holding on the rows the input data, plus a final column 
#     equal to 1 (the bias).
# Y:  labels of the training set
# lambda: Learning rate.
# batchSize: Amount of random training samples.

    treshold = 0.00005; # Desired treshold for backpropagation.
    loops = 0; # Iteration counter.

    X= [ones(rows(X), 1), X];

    XY = [X, Y];
    # Takes a random sample of training data of "batchSize" elements.
    XY_samples = XY(randi(length(XY), batchSize, 1), :);
    # Split the sample into X and Y matrixes:
    X_samples = XY_samples(:, 1:columns(X));
    Y_samples = XY_samples(:, columns(X) + 1:end);

    # Perform Backpropagation until reacing the desired treshold:
    do
        ++loops;
        J_1 = target(W1, W2, X, Y); # Error at the beginning of the loop.
        # Gets the gradient for the current step:
        [gW1, gW2] = gradtarget(W1, W2, X_samples, Y_samples);

        w = packweight(W1, W2); # Packs the weight matrixes into a single vector.
        gw = packweight(gW1, gW2); # Packs the gradient matrixes into a single vector.
         # Adjusts the current weight vector according to the gradient and learning rate:
        w = w - lambda * gw;

        # Unpacks the weight vector into two weight matrixes:
        [W1, W2] = unpackweight(w, size(W1), size(W2));

        J = target(W1, W2, X, Y); # Recalculates the error for the adjusted weights.
    until(abs(J - J_inicial) <= treshold);

endfunction