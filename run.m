clear
% Determine where your m-file's folder is.
folder = fileparts(which('Gui.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));
%{
height = 10;
width = 10;
maze = InitMaze(height, width, [1,1]) 
VizualizeMaze(maze, [])
generated_maze = Randomized_DFS(maze, false)
clf
VizualizeMaze(generated_maze, [5, 5])
[pathStack, pathLength] = TremauxAlgorithm(generated_maze, [1,1], [5, 5], true);
clf
VizualizeMaze(generated_maze, [5, 5])
VizualizePath(generated_maze.height,pathStack, pathLength);

isaninteger = @(x)isfinite(x) & x==floor(x)
isaninteger('1')
inputVal = '2dass'
if ~isempty( str2num( inputVal ) )
    chuj=1
end
%}
newGUI = GUI();
%{
fig = uifigure('Position',[100 100 366 270]);

lbl = uilabel(fig,...
      'Position',[130 100 100 15]);

txt = uieditfield(fig,'numeric',...
      'Position',[100 175 100 22],...
    'Limits', [1 10],...
  'LowerLimitInclusive','on',...
  'UpperLimitInclusive','on',...
  'RoundFractionalValues','on', ...
   'ValueChangedFcn',@(txt,event) textChanged(txt,lbl),...
    'FontSize', 14);


% Code the callback function.
function textChanged(txt,lbl)
        chuj = txt.Value
      lbl.Text = string(chuj);

    
end
%}