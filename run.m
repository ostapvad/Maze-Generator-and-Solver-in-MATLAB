clear 
height = 40;
width = 30;
maze = InitMaze(height, width, [1, 1]);
generated_maze = Randomized_DFS(maze);
clf
VizualizeMaze(generated_maze)