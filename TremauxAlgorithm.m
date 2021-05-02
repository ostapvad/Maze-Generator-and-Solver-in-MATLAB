function pathStack = TremauxAlgorithm(maze, StartCell, GoalCell)
currentPose =  CreateCell(StartCell.row, StartCell.col);
pathStack = [currentPose];
marksMatrix = zeros(maze.height, maze.width);
VizualizeMaze(maze, GoalCell)
a =0
while 1
    if currentPose.row == GoalCell(1) && currentPose.col == GoalCell(2)
            VizualizeSearching(maze.height, currentPose, 1);
            pause(0.1);
            break;
        end
       VizualizeSearching(maze.height, currentPose, 3);
       pause(0.1);
       possibleNextCells = GetPossibleCells(maze, currentPose);
         
       visited_once = 0;
       unvisited = [];
     
       for i=1:length(possibleNextCells)
           if marksMatrix(possibleNextCells(i).row, possibleNextCells(i).col) ==1 % neigbor sell is visited
                visited_once = visited_once + 1;
           elseif  marksMatrix(possibleNextCells(i).row, possibleNextCells(i).col) ==0                                                            % % neigbor sell is unvisited
                unvisited = [unvisited, i];
                
           end
            
           
       end  
        
      
        a = a + 1;
        if ~isempty(unvisited)
            randIdx = randi(length(unvisited));
            marksMatrix(currentPose.row, currentPose.col) = 1;
             VizualizeSearching(maze.height, currentPose,  marksMatrix(currentPose.row, currentPose.col))
            pause(0.1);
            currentPose =   possibleNextCells(unvisited(randIdx));
            pathStack = [pathStack, currentPose];
            continue
        else
            if visited_once == 1
                
            marksMatrix(currentPose.row, currentPose.col) = 2;
            VizualizeSearching(maze.height, currentPose,  marksMatrix(currentPose.row, currentPose.col))
            pause(0.1);
            pathStack(end) = [];
            currentPose =  pathStack(end);
            if currentPose.row == StartCell.row && currentPose.col == StartCell.col
                    VizualizeSearching(maze.height, currentPose, 2);
                     pathStack(end) = [];
                    pause(0.1);
                    disp("Path wasn't find")
                    break;
              end
                continue
             end
            
        end
        visited_once
        pidor_row =  currentPose.row
        pidor_col = currentPose.col
        b = marksMatrix
        break;
       

end
clf 
VizualizeMaze(maze, GoalCell)
for i=1:length(pathStack)
    VizualizeSearching(maze.height, pathStack(i), 1);
end

end

