% Copyright (c) 2024 Reese Hagen
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
%
%
%
%
% Pig Game
%
% This game is played in the Command Window
%
% Rules of the game:
%   Goal is to be the first to reach at least 100 points.
%   If both players reach 100 points on the same turn, the result is a tie.
%
%   Player and computer take turns rolling a single die.
%
%   On your turn you have the choice to either roll the die or end your turn.
%   You may roll as many times on your turn as you wish.
%
%   If you roll a one your turn is over and no points are scored.
%
%   A running total of the values rolled on the turn is accumulated.
%
%   If you decide to stop rolling and end your turn then the total of
%   values rolled on your turn is added to your official total.
%
%   On your turn please check the command window and respond to the prompt
%   with "roll" or "End turn"
%
%   The computer is playing with the strategy of rolling until at least
%   25 points are scored on their turn.
%
%   Since the player rolls first the computer will be allowed to complete
%   the sequence of turns. Resulting in an equal amount of turns for each.
%
%   For information on the optimal Pig strategy and more details on the game,
%   please visit https://en.wikipedia.org/wiki/Pig_(dice_game)
%
%   Have fun!



%%% Run the script to play Pig!




pigGame.playerScore.total   = 0;                                                                 % Initialize values
pigGame.computerScore.total = 0;
pigGame.turnNumber          = 0;

while pigGame.playerScore.total < 100 && pigGame.computerScore.total < 100

     pigGame.turnNumber = pigGame.turnNumber + 1;                                                 % Accumulates the number of turns, to be printed out

     [pigGame.playerScore.total] = playerTurn(pigGame.computerScore.total,pigGame.playerScore.total);        % The players turn is completed in this function, returning an updated score
     fprintf('\nYour current score is %d\n\n',pigGame.playerScore.total)

     [pigGame.computerScore.total] = computerTurn(pigGame.computerScore.total,pigGame.playerScore.total);    % The computers turn is completed in this function, returning an updated score

end

[gameResult] = pigResult(pigGame.playerScore.total,pigGame.computerScore.total);                    % Determines who won or if there was a tie based on the scores
fprintf('\n\n\n%s\n\n',gameResult)

[fileName] = pig2File(pigGame.turnNumber,gameResult,pigGame.playerScore.total,pigGame.computerScore.total); % Prints the results of the game into a file

fprintf('\nView file %s to view full game results',fileName)                      % Informs player of the file where they can view detailed results


%%%%% Troubleshooting
%
% Please ensure the functions playerTurn.m , computerTurn.m , pigResult.m
% and pig2File.m are installed and in your MATLAB path.
%
% If any output is unexpected please inquire into the function help using the help command
% 
% The computer function may seem like it is broken, as it continually
% scores zero points.
% However, the computer plays a hold at 25 strategy. Most turns it will not
% score any points. But will score large amounts and quickly gain a high score.
%
% Questions and concerns please email: reese.hagen391@keyanomail.ca
%

















