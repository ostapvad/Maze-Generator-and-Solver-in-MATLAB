% Implemention of maze 
classdef Maze
    properties
       maze
       height, width {mustBeNumeric} 
    end 
    methods 
        function obj = Maze(height,width)
            obj.maze = zeros(height, width);
            obj.height = height;
            obj.width = width;
        end
    end 
end