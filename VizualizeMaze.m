function  VizualizeMaze(maze)

% draws the black-white Line Based maze


% draw start cell
rectangle('Position',[maze.startCell.col, maze.height-maze.startCell.row+1, 1,1], 'FaceColor', 'r', 'EdgeColor', 'r');





% draw vertical borders

for i=1:size(maze.vertBorder,1)
   for  j=1:size(maze.vertBorder,2)
       if  maze.vertBorder(i,j)
            line([j, j],[2+size(maze.vertBorder,1)-i,  1+size(maze.vertBorder,1)-i],'color','k', 'LineWidth', 1.5);
       end 
   end
end 

%draw horizontal borders
for i=1:size(maze.horizBorder,1)
   for  j=1:size(maze.horizBorder,2)
       if  maze.horizBorder(i,j)
            line([j j+1],[size(maze.vertBorder,1)-i+2 size(maze.vertBorder,1)-i+2],'color','k', 'LineWidth', 1.5);
       end 
   end
end 





% Axis limits
x_plot_limits = [0 maze.width+2];
y_plot_limits = [0 maze.height+2];

xlim(x_plot_limits);
ylim(y_plot_limits);

% Other parameters
set(gca,'Visible','off') % turn of the axes
%set(gcf,'color',[0, 0.4470, 0.7410]); % set backcolor of figure to blue
end

