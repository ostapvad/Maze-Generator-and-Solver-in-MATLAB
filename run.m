clear
% Determine where your m-file's folder is.
folder = fileparts(which('Gui.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

% run GUI
newGUI = GUI();