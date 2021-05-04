function [pathStack, pathLength] = TremauxAlgorithm(maze, StartCell, GoalCell, isVizualize) % Tremaux's algorithm for solving the maze
currentPose =  CreateCell(StartCell(1), StartCell(2));
pathStack = cell(1);
pathLength = 1;
pathStack{pathLength} = currentPose;
marksMatrix = zeros(maze.height, maze.width);

vizualizeCell = CreateCell(1, 1);
% while not (GoalCELL or StartCell and no Path to go)
while ~((currentPose.row == GoalCell(1) && currentPose.col == GoalCell(2))|| ( currentPose.row == StartCell(1) && currentPose.col == StartCell(2)&&  marksMatrix(currentPose.row, currentPose.col)== 2))
    
        vizualizeCell.row = currentPose.row;
        vizualizeCell.col =  currentPose.col;
        [neighbors, unvisitedNum, unvisitedIdxs, visitedOnceNum]  = GetNeigborsParameters(maze, currentPose, marksMatrix);
    
      
        if unvisitedNum ~= 0 % exists at least one unvisited neighbor
            randIdx = randi(unvisitedNum); % choose random as the next one
            marksMatrix(currentPose.row, currentPose.col) = 1;
            currentPose =   neighbors(unvisitedIdxs(randIdx));
            pathLength = pathLength + 1;
            pathStack{pathLength} =  currentPose;
            
        elseif visitedOnceNum == 1 % all other neigbors are visited, return to the previous cell
            
            marksMatrix(currentPose.row, currentPose.col) = 2;
            pathStack{pathLength} = [];
            currentPose =  pathStack{pathLength-1};
            pathLength = pathLength-1;
        elseif unvisitedNum == 0 && visitedOnceNum == 0 % the whole math is explored
             marksMatrix(currentPose.row, currentPose.col) = 2;
             pathStack{pathLength} = [];
             pathLength = pathLength-1;
        
        end
        
       if isVizualize
          VizualizeSearching(maze.height, vizualizeCell, 3);
          pause(0.1);
          VizualizeSearching(maze.height,vizualizeCell,  marksMatrix(vizualizeCell.row, vizualizeCell.col));
          pause(0.1);   
       end 
        
     
end




marksMatrix(currentPose.row, currentPose.col) = marksMatrix(currentPose.row, currentPose.col) + 1;
if isVizualize
    VizualizeSearching(maze.height, currentPose,  marksMatrix(currentPose.row, currentPose.col));
    pause(0.1);   
end

end

