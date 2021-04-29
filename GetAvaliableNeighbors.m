function neighbors = GetAvaliableNeighbors(visitMatrix,currentCell)
neighbors = [];
row_pose = currentCell.row;
col_pose = currentCell.col;


if col_pose ~= 1  && ~visitMatrix(row_pose, col_pose - 1) % check if West cell is visited 
   neighbors = [neighbors, CreateCell(row_pose, col_pose - 1)];
end
if row_pose ~= 1  && ~visitMatrix(row_pose - 1, col_pose) % check if North cell is visited 
   neighbors = [neighbors, CreateCell(row_pose - 1, col_pose)];
end

if col_pose ~= size(visitMatrix, 2)  && ~visitMatrix(row_pose, col_pose + 1) % check if East cell is visited 
   neighbors = [neighbors, CreateCell(row_pose, col_pose + 1)];
end

if row_pose ~= size(visitMatrix, 1) && ~visitMatrix(row_pose+1, col_pose) % check if South cell is visited 
   neighbors = [neighbors, CreateCell(row_pose + 1, col_pose)];
end

end

