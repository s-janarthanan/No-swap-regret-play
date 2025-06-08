% this function updates the weights associated with each arm as per the MW
% algorithm. It takes in the cost vector (cost associated with each arm),
% the weights of each arm, and epsilon, and outputs the new weights
function x = multiplicative_weights(cost_vec, epsilon, current_weight)
    new_weights = zeros(length(current_weight), 1);
    for i = 1:length(current_weight)
        new_weights(i) = current_weight(i) * ((1 - epsilon)^(cost_vec(i)));
    end
    x = new_weights;
end