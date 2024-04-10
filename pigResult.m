function [gameResult] = pigResult(playerScoreTotal,computerScoreTotal)
%pigResult determines who won the game Pig 
%   based on the player and computers scores.
%
%   If the computer reached 100, player did not: returns the computer won.
%   If the player reached 100, computer did not: returns the player won.
%   If both the player and computer reached 100: returns a tie.
%   
%   Returns an error if the state of the game cannot be determined from the
%   values input.

    if playerScoreTotal < 100 && computerScoreTotal >= 100
      gameResult = 'The computer won the game.';
    elseif playerScoreTotal >= 100 && computerScoreTotal < 100
      gameResult = 'You won the game!!';
    elseif playerScoreTotal >= 100 && computerScoreTotal >= 100
      gameResult = 'The game ended in a tie.';
    else 
      gameResult = 'error in the score accounting. No winner determined\n';
    end
end