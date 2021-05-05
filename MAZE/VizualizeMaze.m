function  VizualizeMaze(maze, GoalCell, fig, initDraw) % draws the black-white Line Based maze
% initDraw = draw only the grid(faster performance)
% draw the start cell
rectangle(fig, 'Position',[maze.startCell.col+0.05, maze.height-maze.startCell.row+1+0.05, 0.9,0.9], 'FaceColor', 'r', 'EdgeColor', 'r');

% draw the goal cell
if ~isempty(GoalCell)
   rectangle(fig, 'Position',[GoalCell(2)+0.05, maze.height-GoalCell(1)+1+0.05, 0.9,0.9], 'FaceColor', 'g', 'EdgeColor', 'g');

end


% draw vertical borders

if initDraw
      for  j=1:size(maze.vertBorder,2)  
          line(fig, [j, j],[2+size(maze.vertBorder,1)-1,  1],'color','k', 'LineWidth', 1.5);

      end
else
    for i=1:size(maze.vertBorder,1)
   
        for  j=1:size(maze.vertBorder,2)

            if  maze.vertBorder(i,j)
                line(fig, [j, j],[2+size(maze.vertBorder,1)-i,  1+size(maze.vertBorder,1)-i],'color','k', 'LineWidth', 1.5);
            end

        end
   
   
    end 
    
   
end


% draw horizontal borders
for i=1:size(maze.horizBorder,1)
   if initDraw
        line(fig, [1 size(maze.horizBorder,2)+1],[size(maze.horizBorder,1)-i+1 size(maze.horizBorder,1)-i+1],'color','k', 'LineWidth', 1.5);
   else
       for  j=1:size(maze.horizBorder,2)
           if  maze.horizBorder(i,j)
                line(fig, [j j+1],[size(maze.horizBorder,1)-i+1 size(maze.horizBorder,1)-i+1],'color','k', 'LineWidth', 1.5);
           end 
        end
       
   end
   
  
end 


end

