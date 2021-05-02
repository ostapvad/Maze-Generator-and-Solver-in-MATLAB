function  VizualizeSearching(maze_rows, currentPose, visitedStatus)
switch visitedStatus
    case 1
        color = 'b';
        %pos = [currentPose.col, maze_rows + 1-currentPose.row , 1, 1];
        rectangle('Position',[currentPose.col+0.25, maze_rows-currentPose.row+1+0.25, 0.5, 0.5], 'FaceColor', color, 'LineWidth', 0.01, 'EdgeColor', color);
        %rectangle('Position',pos,'Curvature',[1 1], 'FaceColor', 'b', 'EdgeColor', 'b')
    case 2
        color = [0.9400, 0.9400, 0.9400];
         rectangle('Position',[currentPose.col+0.25, maze_rows-currentPose.row+1+0.25, 0.5, 0.5], 'FaceColor', color, 'LineWidth', 0.01, 'EdgeColor', color);
        line([currentPose.col + 0.1, currentPose.col+0.9],[1+maze_rows-currentPose.row+0.1,  1+maze_rows-currentPose.row+0.9],'color', [0.6350, 0.0780, 0.1840], 'LineWidth', 1.5);
        line([currentPose.col+0.9, currentPose.col + 0.1],[1+maze_rows-currentPose.row+0.1,  1+maze_rows-currentPose.row+0.9],'color', [0.6350, 0.0780, 0.1840], 'LineWidth', 1.5);
    case 3
        color = [0.9290, 0.6940, 0.1250];
        %pos = [currentPose.col, maze_rows + 1-currentPose.row , 1, 1];
        rectangle('Position',[currentPose.col+0.25, maze_rows-currentPose.row+1+0.25, 0.5, 0.5], 'FaceColor', color, 'LineWidth', 0.01, 'EdgeColor', color);
        
end

end

