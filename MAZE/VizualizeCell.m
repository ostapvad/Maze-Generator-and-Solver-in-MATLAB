function VizualizeCell(currentCell, isVisited, height, fig) % Vizualize the status of cell
  
if isVisited % visited twice
    color = 'b';
else % visited once
    color = 'g';
end 
rectangle(fig, 'Position',[currentCell(2)+0.25, height-currentCell(1)+1+0.25, 0.5, 0.5], 'FaceColor', color, 'LineWidth', 0.01, 'EdgeColor', color);
    

end

