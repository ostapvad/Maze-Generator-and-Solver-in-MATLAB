function  drawSquareMaze(maze)
% draws the black-white square maze

% sizes of Maze
height = size(maze,1);
width = size(maze,2);


white = [1 1 1]; % white color

% draw the square maze
for i=1:height
    for j=1:width
          % uncomment for black borders between white squares
          %rectangle('Position',[j-1,height - i,1,1],'FaceColor',color*maze(i,j));
          rectangle('Position',[j-1, height-i, 1, 1],'FaceColor',white*maze(i,j),'EdgeColor',white*maze(i,j));     
    end
end
% draw red border
rectangle('Position',[0, 0, width, height],'EdgeColor','r', 'LineWidth', 1);     
% Axis limits
x_plot_limits = [0 width];
y_plot_limits = [0 height];

xlim(x_plot_limits);
ylim(y_plot_limits);

% Other parameters
set(gca,'Visible','off') % turn of the axes
set(gcf,'color',[0, 0.4470, 0.7410]); % set backcolor of figure to blue

end


