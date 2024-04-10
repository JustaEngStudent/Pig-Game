function [computerScoreTotal] = computerTurn(computerScoreTotal,playerScoreTotal)
%computerTurn plays the strategy "hold at 25" in the game Pig
%   Rolls a die and acumulates the value until it reaches 25, or rolls a 1.
%   In which case the turn ends and no points are scored.
%   Once the computer reaches 25 points, it will end the turn and add the
%   accumulated points to its total.
%
%   As long as the player has not reached 100,
%   in which case the computer will attempt to roll until it ties the game.
%   
%   The computer will recognize when it has reached 100 and end the turn.
%

      computerTurnScore = 0;     % Initialize values
      computerRolledOne = 0;   
      computerTSP       = computerScoreTotal; % used to determine if the turn score added to the current score will reach 100

          while (computerTurnScore < 25 || playerScoreTotal > 100) && computerTSP < 100 && computerRolledOne == 0 % Stops at 25 unless player has reached 100. Stops once turn score will bring the total to 100.
                  computerRoll = randi([1,6]); % Rolls 6 sided die
                  if computerRoll == 1         % If a 1 is rolled the turn is ended and no score counted
                      computerTurnScore = 0;
                      fprintf('Computer rolled a one\n')
                      computerRolledOne = 1;   % Criteria to end turn
                  else
                      computerTurnScore = computerTurnScore + computerRoll;
                      computerTSP = computerScoreTotal + computerTurnScore;
                  end                     
          end

              computerScoreTotal = computerScoreTotal + computerTurnScore; % Determines new total score after turn
              fprintf('Computers turn is over. Computer has a score of %i \n', computerScoreTotal)
end