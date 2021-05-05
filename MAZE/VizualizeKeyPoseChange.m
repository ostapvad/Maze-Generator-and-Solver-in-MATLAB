function  VizualizeKeyPoseChange(maze_rows, prevPose,newPose, CellId, fig) % vizualize if Start or Goal is changed
% remove the previous one
rectangle(fig, 'Position',[prevPose(2)+0.05, maze_rows-prevPose(1)+1+0.05, 0.90, 0.90], 'FaceColor', 'w', 'LineWidth', 0.01, 'EdgeColor', 'w');
if CellId % 1 = Start Cell
    color = 'r'; 
else % 0 = Goal Cell
    color = 'g'; 
end
% draw the new one
rectangle(fig, 'Position',[newPose(2)+0.05, maze_rows-newPose(1)+0.05+1, 0.90, 0.90], 'FaceColor', color, 'LineWidth', 0.01, 'EdgeColor', color);
end

