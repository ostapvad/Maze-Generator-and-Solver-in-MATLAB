function  VizualizeWall(maze, row, col, isVertical, fig) % vizualize removing of the wall/border
if isVertical % vertical wall
    line(fig, [col, col],[2+size(maze.vertBorder,1)-row 1+size(maze.vertBorder,1)-row],'color',[0.9400, 0.9400, 0.9400] , 'LineWidth', 1.5);
    
else  % horizontal wall
    line(fig, [col col+1],[size(maze.vertBorder,1)-row+2 size(maze.vertBorder,1)-row+2],'color', [0.9400, 0.9400, 0.9400], 'LineWidth', 1.5);
   
end

end

 