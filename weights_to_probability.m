% this function takes a nonnegative vector and normalizes it to give a
% probability vector
function x =  weights_to_probability(current_weight)
    x = current_weight / sum(current_weight);
end