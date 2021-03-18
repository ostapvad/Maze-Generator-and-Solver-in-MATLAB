function  maze = RandomMaze(height,width, square)
    % return the random maze for square and common line borders maze
    if square 
        maze = randi([0 1], height, width);
    else
        maze = randi([0 1], height, width,4);
    end
    
end

