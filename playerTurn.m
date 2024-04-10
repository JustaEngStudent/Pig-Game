function [playerScoreTotal] = playerTurn(computerScoreTotal,playerScoreTotal)
%playerTurn prompts the player of the game Pig on their turn.
%   Expected responses in the command window are:
%       "roll" which will roll the die and continue the turn
%       "End turn" will end the players turn and add any points accumulated
%                  their total score
%       Any unexpected input will notify and reprompt the player

      playerTurnScore = 0; % Initialize values
      exitCondition = 0;

      while exitCondition == 0

              prompt = sprintf('\nComputers score is %d.\nYour turn score is %d. Total score will be %d if you end turn.\nroll die or End turn?',computerScoreTotal,playerTurnScore,playerScoreTotal+playerTurnScore);
              playerWish = input(prompt,'s'); % Prompts the player in the command window if they wish to roll the die or end turn
              if strcmp(playerWish, 'roll') % Identifies if player input prompt to roll the die
                  playerRoll = randi([1,6]);

                  if playerRoll == 1
                      playerTurnScore = 0; % No points scored if a one is rolled
                      fprintf('You rolled a one. Your turn is over\n')
                      exitCondition = 1; % Criteria to end turn after player rolls a one
                  else
                      playerTurnScore = playerTurnScore + playerRoll; % Accumulates points scored during the turn
                      fprintf('You rolled a %d!\n',playerRoll)
                  end

              elseif strcmp(playerWish,'End turn') % Identifies if player input prompt to end the turn
                  playerScoreTotal = playerScoreTotal + playerTurnScore; % Updates the players total score with the turn score added
                  fprintf('Turn ended, your total score is %i\n',playerScoreTotal)
                  exitCondition = 1;
              else
                  fprintf('\nSyntax Error please respond with either "Roll" or "End turn"\n') % Notifies the player if response was not as expected. While loop then reprompts the player for another input
              end
      end           
end