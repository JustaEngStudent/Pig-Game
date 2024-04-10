function [fileName] = pig2File(turnNumber,gameResult,playerScoreTotal,computerScoreTotal)
%pig2File prints detailed results from the game Pig into a file named "pigGameResult.m" 
%   Including the:
%       Number of turns
%       Winner of the game, or if it ended in a tie
%       The final score of the player and computer
%   Based off the inputs from the main pig game and the pigResult function

    fileName = 'pigGameResult.m';
    [fileID, theMessage] = fopen(fileName, 'w');
    
    if fileID ~= -1   % report game results into file
        fprintf(fileID, '%% The pig game was completed in %d turns\n', turnNumber);
        fprintf(fileID, '%% %s\n',gameResult); % Game winner or tie
        fprintf(fileID, '%% Player scored %d points. The computer scored %d', playerScoreTotal, computerScoreTotal);

        status = fclose(fileID);
        if status ~= -1

        else
            fprintf('fclose error: %s\n', fileName)
        end
    else
        fprintf('fopen error: %s\n', theMessage)
    end
end