# No swap regret play leads to convergence to correlated equilibria.

These MATLAB files were done as part of my assignment for Incentive Centered Design (EE6417) in the Jan.-May 2025 semester. 

When the players in a game play according to no swap regret learning rules, then the empirical average of the actions played by them asymptotically 
converges to a correlated equilibrium. This is a well-known result in game theory and learning in games, and these MATLAB files demonstrate this fact.

We implement no swap regret play by taking a no external regret play, and then reducing it to a no swap regret version using Blum and Mansour's technique. To implement no external regret play, we use the classic multiplicative weights algorithm. 

I've taken the example of the rock-paper-scissors game to show convergence to correlated equilibria.

## Description of program files

* [multiplicative_weights.m](multiplicative_weights.m) - this function block updates the weights of each action as per the multiplicative weights learning rule.
* [weights_to_probability.m](weights_to_probability.m) - given a vector of non-negative weights associated with each action, this function block converts it into a probability vector by normalizing it.
* [swap_regret_update.m](swap_regret_update.m) - function block that performs one iteration of no swap regret update.
* [no_swap_regret_play.m](no_swap_regret_play.m) - implementation of no swap regret play for rock-paper-scissor game.
