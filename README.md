### Ruby War card game

This repo contains the war game implemented in ruby.

#### Technologies

- Ruby
- Rspec (unit tests)
- Bundler (To manage the project dependencies and install Rspec)

#### Why war?

- Simple Rules
- Clear classes
- Expandable
- Fast to be implemented

#### War Rules

- Each player is dealt an equal number of cards
- Both players reveal the top card of their deck; higher card wins and take Both
- In a tie, the player go to a "War" situation where additional cards are played
- The game ends after one player has all the cards or after a predetermined number of rounds.

#### War situation

- Each player place 3 cards down in the table
- If the player has fewer than 3 cards, they place as many as they have left
- Each player plays one card face up
- The winner takes all the cards in the table
- If they had another tie, the process repeat
- If a player go out of cards he loses the game.
