function neighbors = GetPossibleCells(maze, currentCell)
neighbors = [];
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
end

