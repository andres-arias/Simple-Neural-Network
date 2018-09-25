function [W]=weight(neurons, elements)

  # Usage: weight(neurons, elements)
  # 
  # This function generates a weight matrix of (neurons x elements) with values between 0-1.
  # 
  # W: Resulting weights matrix.
  # neurons: number of neurons per layer.
  # e: Number of input elements.
    size = [neurons, elements];
    W = unifrnd(0, 1, size);

endfunction;