% this function simulates one iteration of no-swap regret play. It takes in
% the current column stochastic matrix, Q (which is the augmented matrix
% containing the recommendations of each no external regret instantiation),
% the cost/penalty matrix associated with the learner/player, epsilon (for
% M.W algorithm), and current_weights matrix - an augmented matrix whose
% columns are the current weights in each of the no-ext regret
% instantiation. It outputs the new-column stochastic matrix, the new
% weight matrix, and the action picked based on the no-swap regret's
% suggestion.

function [x, y, action_index] = swap_regret_update(Q_matrix, cost_matrix, epsilon, current_weight)
    dimension = length(Q_matrix); % dimension of the Q matrix
    e_vectors = null(Q_matrix - eye(dimension)); % these are precisely eigenvectors with corresponding e-value 1; eye(n) is the n*n identity
    % we need to pick the e-vector whose entries are all positive
    for i = 1:length(e_vectors(1, :))
        if all(e_vectors(:, i) >= 0) % check if all entries are non-negative
            prob_cols = e_vectors(:, i); % pick out the first e-vector with nonnegative entries
            break 
        end  
    end

    probability_vector = weights_to_probability(prob_cols); % normalize
    % we now have to pick action probabilistically based on this
    % probability vector
    action_picked = randsample(1:dimension, 1, true, probability_vector);

    % once we pick an action, we observe all possible costs associated with
    % the action
    cost_observed = cost_matrix(:, action_picked);
    new_Q_matrix = zeros(dimension);
    new_weight = zeros(dimension);
    for j = 1:dimension
        jth_instantiation_cost = cost_observed .* probability_vector(j); % costs are split to each instantiation as r_i(t) = p^t(i) * c(t);
        jth_instantiation_weights = multiplicative_weights(jth_instantiation_cost, epsilon, current_weight(:,j)); % run the MW/no-ext regret play
        jth_instantiation_prob = weights_to_probability(jth_instantiation_weights); % normalize new weights to probability vector
        new_weight(:, j) = jth_instantiation_weights; % append the new weights of each instantiation to the new_weight matrix
        new_Q_matrix(:, j) = jth_instantiation_prob; % append the new probability vector of each instantiation to the new_Q_matrix
    end

    x = new_Q_matrix;
    y = new_weight;
    action_index = action_picked;
end