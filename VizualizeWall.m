function  VizualizeWall(maze, row, col, isVertical)
if isVertical
    line([col, col],[2+size(maze.vertBorder,1)-row 1+size(maze.vertBorder,1)-row],'color',[0.9400, 0.9400, 0.9400] , 'LineWidth', 1.5);
    
else 
    line([col col+1],[size(maze.vertBorder,1)-row+2 size(maze.vertBorder,1)-row+2],'color', [0.9400, 0.9400, 0.9400], 'LineWidth', 1.5);
    
end

end

 