time_steps = 3e4; % number of iteration
row_player_cost = [2/3 1/3 1; 1 2/3 1/3; 1/3 1 2/3]; % row player payoff
col_player_cost = [2/3 1/3 1; 1 2/3 1/3; 1/3 1 2/3]; % col player payoffs

epsilon = 0.1; % 0 < epsilon < 1

% initializing
row_weights = [1 1 1; 1 1 1; 1 1 1];
row_Q_matrix = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3];

col_weights = [1 1 1; 1 1 1; 1 1 1];
col_Q_matrix = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3];

joint_empirical_count = zeros(9, 1);
joint_empirical_probability = zeros(9, time_steps); % Store joint empirical probabilities
for i = 1:time_steps
    [new_row_Q, new_row_weights, row_action_picked] = swap_regret_update(row_Q_matrix, row_player_cost, epsilon, row_weights);
    row_Q_matrix = new_row_Q;
    row_weights = new_row_weights;

    [new_col_Q, new_col_weights, col_action_picked] = swap_regret_update(col_Q_matrix, col_player_cost, epsilon, col_weights);
    col_Q_matrix = new_col_Q;
    col_weights = new_col_weights;

    index = 3 * (row_action_picked - 1) + col_action_picked;
    joint_empirical_count(index) = joint_empirical_count(index) + 1;
    joint_empirical_probability(:, i) = joint_empirical_count/i;

end

tiledlayout(3,1)

nexttile
time_series = 1:time_steps;
plot(time_series, joint_empirical_probability(1, :), 'g', LineWidth=2.5);
hold on;
plot(time_series, joint_empirical_probability(2, :), 'b', LineWidth=2.5);
plot(time_series, joint_empirical_probability(3, :), 'r', LineWidth=1.5);
xlabel("Time step");
ylabel("Joint empirical probability");
legend('Row 1, Col 1', 'Row 1, Col 2', 'Row 1, Col 3');
title("Evolution of joint empirical distribution with time");
grid on;
hold off;

nexttile
plot(time_series, joint_empirical_probability(4, :), 'g', LineWidth=2.5);
hold on;
plot(time_series, joint_empirical_probability(5, :), 'b', LineWidth=2.5);
plot(time_series, joint_empirical_probability(6, :), 'r', LineWidth=1.5);
xlabel("Time step");
ylabel("Joint empirical probability");
legend('Row 2, Col 1', 'Row 2, Col 2', 'Row 2, Col 3');
title("Evolution of joint empirical distribution with time");
grid on;
hold off;

nexttile
plot(time_series, joint_empirical_probability(7, :), 'g', LineWidth=2.5);
hold on;
plot(time_series, joint_empirical_probability(8, :), 'b', LineWidth=2.5);
plot(time_series, joint_empirical_probability(9, :), 'r', LineWidth=1.5);
xlabel("Time step");
ylabel("Joint empirical probability");
legend('Row 3, Col 1', 'Row 3, Col 2', 'Row 3, Col 3');
title("Evolution of joint empirical distribution with time");
grid on;
hold off;