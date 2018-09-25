# Generates training data:
[X,Y] = create_data(1000); # 3 Classes, radial distribution.

# Adds the bias of 1:
X1=[ones(rows(X),1),X];

# Generates the initial weights:
NumNeuron = 4;
W1 = weight(NumNeuron, columns(X1)); # Rows: Neuron count, Columns: Input count. 
W2 = weight(columns(Y), rows(W1) + 1); # Adds 1 because of the hidden layer bias.
sW1 = size(W1);
sW2 = size(W2);
