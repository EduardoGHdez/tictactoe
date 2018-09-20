# Tic tac toe game :x: :o:
This is my tic-tac-toe game, made with Ruby :gem:
## Features required
- [x] Create the game logic
- [x] Create the gem that contains that logic and verify that can be used correctly
- [ ] Create a terminal interface
## Not required, but nice to have
- [ ] Create GUI interface (Shoes or Gosu)
- [ ] Create a web app
- [ ] Create API

## Getting started
To play with tic-tac-toe gem, follow next steps:
1. Clone the repo
2. Install gem

```gem install tictactoe-0.0.0.gem```

3. Run `Interactive ruby` 

```irb```

4. Import gem

```require 'tictactoe'```

5. Instance the object TicTacToe

```game = TicTacToe.new```

6. Play with a friend :couple:

```game.play```

## Design

* TicTacToe
	* 2 Players
	* Board
* Player
	* name
	* type
* Board
	*  grid (9 squares)

