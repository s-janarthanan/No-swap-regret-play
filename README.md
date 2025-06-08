# No swap regret play leads to convergence to correlated equilibria.

When the players in a game play according to no swap regret learning rules, then the empirical average of the actions played by them asymptotically 
converges to a correlated equilibrium. This is a well-known result in game theory and learning in games, and these MATLAB files demonstrate this fact.

We implement no swap regret play by taking a no external regret play, and then reducing it to a no swap regret version using Blum and Mansour's technique. To implement
no external regret play, we use the classic multiplicative weights algorithm. 
