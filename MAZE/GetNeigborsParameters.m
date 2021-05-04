function [neighbors, unvisitedNum, unvisitedIdxs, visitedOnceNum]  = GetNeigborsParameters(maze, currentCell, marksMatrix)
neighbors = [];
unvisitedIdxs = zeros(4,1); % possible unvisited neigbors, max 4
unvisitedNum = 0;
visitedOnceNum = 0;


row_pose = currentCell.row;
col_pose = currentCell.col;


if col_pose ~= 1  && ~maze.vertBorder(row_pose, col_pose) % check if West cell is visited 
   neighbors = [neighbors, CreateCell(row_pose, col_pose - 1)];
end
if row_pose ~= 1  && ~maze.horizBorder(row_pose, col_pose) % check if North cell is visited 
   neighbors = [neighbors, CreateCell(row_pose - 1, col_pose)];
end

if col_pose ~= maze.width  && ~maze.vertBorder(row_pose, col_pose + 1) % check if East cell is visited 
   neighbors = [neighbors, CreateCell(row_pose, col_pose + 1)];
end

if row_pose ~= maze.height && ~maze.horizBorder(row_pose+1, col_pose) % check if South cell is visited 
   neighbors = [neighbors, CreateCell(row_pose + 1, col_pose)];
end

for i=1:length(neighbors)
   
     if marksMatrix(neighbors(i).row, neighbors(i).col) == 1 % neigbor cell is visited once
         visitedOnceNum = visitedOnceNum +1;
    
      elseif  marksMatrix(neighbors(i).row, neighbors(i).col) == 0  % neigbor cell isn't visited                                                           % % neigbor sell is unvisited
          unvisitedNum = unvisitedNum + 1;
          unvisitedIdxs(unvisitedNum) = i;
     end 
                
end



end

