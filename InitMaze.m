function maze = InitMaze(height, width, start_pose)
maze = struct;
maze.height = height;
maze.width = width;
maze.startCell.row = start_pose(1);
maze.startCell.col = start_pose(2);
maze.vertBorder = ones( maze.height, maze.width+1); % |
maze.horizBorder = ones(maze.height +1, maze.width); % _

end

