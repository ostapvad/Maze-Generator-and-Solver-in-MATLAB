function  VizualizeMaze(maze, GoalCell) % draws the black-white Line Based maze

% draw the start cell
rectangle('Position',[maze.startCell.col, maze.height-maze.startCell.row+1, 1,1], 'FaceColor', 'r', 'EdgeColor', 'r');

% draw the goal cell
if ~isempty(GoalCell)
   rectangle('Position',[GoalCell(2), maze.height-GoalCell(1)+1, 1,1], 'FaceColor', 'g', 'EdgeColor', 'g');

end


% draw vertical borders
for i=1:size(maze.vertBorder,1)
   for  j=1:size(maze.vertBorder,2)
       if  maze.vertBorder(i,j)
            line([j, j],[2+size(maze.vertBorder,1)-i,  1+size(maze.vertBorder,1)-i],'color','k', 'LineWidth', 1.5);
       end 
   end
end 

% draw horizontal borders
for i=1:size(maze.horizBorder,1)
   for  j=1:size(maze.horizBorder,2)
       if  maze.horizBorder(i,j)
            line([j j+1],[size(maze.vertBorder,1)-i+2 size(maze.vertBorder,1)-i+2],'color','k', 'LineWidth', 1.5);
       end 
   end
end 


% Other parameters
set(gca,'Visible','off') % turn of the axes

end

