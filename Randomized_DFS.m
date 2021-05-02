function  generated_maze = Randomized_DFS(init_maze, isVizualize)
% Matrix of visited cells
visitMatrix = zeros(init_maze.height, init_maze.width);

% Take start cell as visited one
pathStack = cell(init_maze.startCell.row*init_maze.startCell.col);

% Create path stack
end_ind = 1;
pathStack{end_ind} = CreateCell(init_maze.startCell.row, init_maze.startCell.col);

% Matrix of visited cells: 0 - not visited; 1 - once; 2 - twice
visitMatrix(init_maze.startCell.row, init_maze.startCell.col) = 1;
while end_ind ~=0 % stack is not empty
    isVisited = false; %  cell is visited twice
    currentCell = pathStack{end_ind};  % get last element from Stack
    
    % unvisited neigbors of the cell
    neighbors = GetAvaliableNeighbors(visitMatrix,currentCell);
    if ~isempty(neighbors) % if there are unvisited neighbors
        randIdx = randi(length(neighbors)); % choose random neigbor
        init_maze = ConnectCells(init_maze, currentCell, neighbors(randIdx));
        visitMatrix( neighbors(randIdx).row,  neighbors(randIdx).col) = 1;
        end_ind = end_ind+1;
        pathStack{end_ind}= neighbors(randIdx);
    else 
        pathStack{end_ind} = []; % pop element from the stack
        end_ind = end_ind - 1;
        isVisited=true; % cell is visited twice
    end 
    if isVizualize
        VizualizeCell([currentCell.row, currentCell.col], isVisited, init_maze.height);
        pause(0.1);
    end
end 
generated_maze  = init_maze;
end

%{
 function generated_maze = Randomized_DFS(init_maze)
% Matrix of visited cells
visitMatrix = zeros(init_maze.height, init_maze.width);

% Take start cell as visited one
VizualizeMaze(init_maze, [])
pathStack = [CreateCell(init_maze.startCell.row, init_maze.startCell.col)];
visitMatrix(init_maze.startCell.row, init_maze.startCell.col) = 1;
while ~isempty(pathStack)
    isVisited = false;
    % pop element from Stack
    currentCell = pathStack(end);
 
    neighbors = GetAvaliableNeighbors(visitMatrix,currentCell);
    if ~isempty(neighbors) % if there are unvisited neighbors
        randIdx = randi(length(neighbors)); % choose random neigbor
        init_maze = ConnectCells(init_maze, currentCell, neighbors(randIdx));
        visitMatrix( neighbors(randIdx).row,  neighbors(randIdx).col) = 1;
        pathStack = [pathStack, neighbors(randIdx)];
    else 
        pathStack(end) = [];
        
        isVisited = true;
    end 
    
    %VizualizeCell([currentCell.row, currentCell.col], isVisited, init_maze.height);
    %pause(0.1)
end 
generated_maze  = init_maze;
end
        


%}