function UpdatedMaze = ConnectCells(maze, parent, child, isVizualize) % removes the wall between the parent and the child cell
    
if  parent.row == child.row &&  parent.col == child.col + 1 % check if West cell is child of parent
   maze.vertBorder(parent.row, parent.col) = 0; % remove the wall
   if isVizualize % Vizualize the wall removing
       VizualizeWall(maze, parent.row, parent.col, true);
   end
   UpdatedMaze = maze;
   return;
end
if parent.col == child.col && parent.row == child.row + 1 % check if North cell is child of parent
   maze.horizBorder(parent.row, parent.col) = 0; % remove the wall
  
   if isVizualize % Vizualize the wall removing
       VizualizeWall(maze, parent.row, parent.col, false);
   end
    UpdatedMaze = maze;   
   return;
end

if  parent.row  == child.row && parent.col + 1 == child.col % check if East cell is child of parent
   maze.vertBorder(child.row, child.col) = 0; % remove the wall
   if isVizualize  % Vizualize the wall removing
       VizualizeWall(maze, child.row, child.col, true)
   end
   UpdatedMaze = maze;
   return;
end

if parent.col == child.col && parent.row  + 1== child.row % check if South cell is visited 
   maze.horizBorder(child.row, child.col) = 0; % remove the wall
   if isVizualize  % Vizualize the wall removing
       VizualizeWall(maze, child.row, child.col, false);
   end 
   UpdatedMaze = maze;
   return;
end
end

