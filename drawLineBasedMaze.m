% !Think
function drawLineBasedMaze(maze)
% draws the black-white Line Based maze

% border of cell
% < = 1; <=> left
% ^ = 2; <=> up
% > = 3; <=> right
% ˇ = 4; <=> down


% sizes of Maze
height = size(maze,1)
width = size(maze,2)


white = [1 1 1]; % white color
border_size = 0.1;

% draw the square maze

for i=1:height
    for j=1:width
         % draw white cell
         rectangle('Position',[j-1, height-i, 1, 1],'FaceColor',white,'EdgeColor',white);   
    end
end

for i=1:height
    for j=1:width
      
         % left border
         rectangle('Position',[j-1, height-i, border_size, 1],'FaceColor',white*maze(i,j,1));   
         % up border
         rectangle('Position',[j-1, height-i+1, 1, border_size],'FaceColor',white*maze(i,j,2));   
         % right border
         rectangle('Position',[j, height-i, border_size, 1],'FaceColor',white*maze(i,j,3));   
         % down border
         rectangle('Position',[j-1, height-i, 1, border_size],'FaceColor',white*maze(i,j,4));  

    end
end

%rectangle('Position',[0,0,width,height],'EdgeColor',[1,11],'LineWidth',1)
% Axis limits
x_plot_limits = [0 width];
y_plot_limits = [0 height];

xlim(x_plot_limits);
ylim(y_plot_limits);

% Other parameters
set(gca,'Visible','off') % turn of the axes
set(gcf,'color',[0, 0.4470, 0.7410]); % set backcolor of figure to blue


end

