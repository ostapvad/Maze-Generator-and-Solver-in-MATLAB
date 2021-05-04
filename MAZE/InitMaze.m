function maze = InitMaze(height, width, start_pose) % init maze for generating
maze = struct;
% Sizes
maze.height = height; 
maze.width = width;
% Position of the start cell
maze.startCell.row = start_pose(1);
maze.startCell.col = start_pose(2);
% Grid borders
maze.vertBorder = ones( maze.height, maze.width+1); % |
maze.horizBorder = ones(maze.height +1, maze.width); % _

end

