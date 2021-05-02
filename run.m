clear
clf
height = 20;
width = 20;
maze = InitMaze(height, width, [1, 1]);
tic
%VizualizeMaze(maze, [])
%generated_maze = Randomized_DFS(maze, true);
toc
clf
%VizualizeMaze(generated_maze, [])
maze = Maze(height, width, [1, 1]);

maze.VizualizeMaze(maze.maze, []);
%maze.Randomized_DFS();
%VizualizeSearching(generated_maze.height, CreateCell(1,1), 2)
%TremauxAlgorithm(generated_maze, generated_maze.startCell, [15, 15])
%line([1, 2.5, 3, 4],[5, 5, 6, 6],'color','k', 'LineWidth', 1.5);
