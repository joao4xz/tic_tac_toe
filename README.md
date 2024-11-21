# Tic Tac Toe

## Description
This project is part of The Odin Project curriculum. It implements the game of Tic Tac Toe where two players take turns marking spaces on a 3x3 grid. The game includes testing using RSpec.

## Game Rules
- Players take turns placing their marks (X or O) on the board
- The first player to get three marks in a row (horizontally, vertically, or diagonally) wins
- If all spaces are filled and no player has won, the game is a draw

## Prerequisites
- Ruby installed on your system
- Bundler gem installed (`gem install bundler`)

## Required Gems
- rubocop (~> 1.64)
- rspec (for testing)

## Installation
1. Clone this repository
    ```bash
    git clone https://github.com/joao4xz/tic_tac_toe.git
    ```
2. Navigate to the project directory
    ```bash
    cd tic_tac_toe
    ```
3. Install dependencies
    ```bash
    bundle install
    ```
4. Run the game:
    ```bash
    bundle exec ruby main.rb
    ```
5. Run the tests:
    ```bash
    bundle exec rspec
    ```