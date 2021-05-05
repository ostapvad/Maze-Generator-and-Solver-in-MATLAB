function VizualizePath(maze, pathStack, pathLength, fig, GoalPose, istoClear) % Vizualize the founded path
maze_rows = maze.height;
if pathLength == 0 % path wasn't founded, cross the Goal Cell
    currentPose = CreateCell(GoalPose(1), GoalPose(2));
    line(fig, [currentPose.col + 0.1, currentPose.col+0.9],[1+maze_rows-currentPose.row+0.1,  1+maze_rows-currentPose.row+0.9],'color', [0.6350, 0.0780, 0.1840], 'LineWidth', 1.5);
    line(fig, [currentPose.col+0.9, currentPose.col + 0.1],[1+maze_rows-currentPose.row+0.1,  1+maze_rows-currentPose.row+0.9],'color', [0.6350, 0.0780, 0.1840], 'LineWidth', 1.5);
else
    for i=1:pathLength
        if istoClear % Clear button was pushed
            rectangle(fig, 'Position',[pathStack{i}.col+0.025, maze_rows-pathStack{i}.row+1+0.025, 0.90, 0.90], 'FaceColor', 'w', 'LineWidth', 0.01, 'EdgeColor', 'w');
        else
            VizualizeSearching(maze_rows, pathStack{i}, 1, fig);
        end
     end
end
end

