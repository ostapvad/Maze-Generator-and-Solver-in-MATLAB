classdef GUI<handle
    %% Gui parameters
    properties (Access=private)
        RunWindow;
        GenPanel, SolvePanel;
        % Generation panel attributes
        GenSubPanelSizes, GenSubPanelStartPose;
        GenVizCheckBox;
        GenButton, GenSaveButton;
        HeigthTextArea, WidthTextArea, GenStartRow, GenStartCol;
        HeightLabel, WidthLabel, SProwLabel, SPcolLabel;
        % Solving panel attributes
        SolveSubPanelStart, SolveSubPanelGoal;
        SolveVizCheckBox;
        SolveButton, SolveSaveButton, ClearPathButton;
        StRowTextArea, StColTextArea, GoalRow, GoalCol;
        StRowLabel, StColLabel, GoalRowLabel, GoalColLabel;
        % Axes
        GenAxes, SolveAxes;
       
    end
    %% Generation and Solve parameters
    properties (Access=public) 
        DefaultFigPose = [480, 200, 820, 580]; 
        DefaultSizeLimits = [2 100];
        % Maze sizes
        Height, Width;
        GenStartPose;
        isVizualizeGen = false;
         % Solving parameters
        SolveStartPose, SolveGoalPose;
        isVizualizeSolve;
        pathStack, pathLength; 
        % Mazes
        GenMaze, SolvedMaze;
        % MazeStatus
        isGenerated, isSolved;
        % Save image filters
        filter = {'*.png'};
        
    end
    methods
            function obj = GUI()
               
                InitGenParameters(obj);
                InitSolveParameters(obj);
                InitMainWindow(obj);
                CreateGenerationPanel(obj)
                CreateSolvingPanel(obj);
                CreateAxes(obj);
                SetPanelStatus(obj, 0, 'off')
                VizualizeAxe(obj,1, InitMaze(obj.Height, obj.Width, obj.GenStartPose), false);
                
            end
        end  
    methods (Access=private)
            %% Creates the Main Window
            function InitMainWindow(obj) 
                obj.RunWindow  = uifigure('Name', 'Maze Generator-Solver',...
                      'Position', obj.DefaultFigPose, ...
                      'AutoResizeChildren',  'off');
                      
            end 
            %% Init the parameters of the generation panel
            function InitGenParameters(obj)
                obj.Height = 2;
                obj.Width = 2;
                obj.GenStartPose = [1, 1];
                obj.isGenerated = false;
                obj.isSolved =  false;
           
            end
            %% Init the parameters of the solving panel
            function InitSolveParameters(obj) 
                obj.SolveStartPose = [1, 1];
                obj.SolveGoalPose = [obj.Height, obj.Width];
                obj.isVizualizeSolve = false;
                obj.pathLength = 0;
  
            end
            %% Creates the Generation panel
            function CreateGenerationPanel(obj) 

                obj.GenPanel = uipanel('Parent',obj.RunWindow, ...
                       'Title', 'Generatation panel', ...
                       'Position',[10, obj.DefaultFigPose(4) - 210, (obj.DefaultFigPose(3)-30)/2,  200], ...
                       'TitlePosition', 'centertop', ...
                       'FontSize', 14, ...
                       'FontWeight', 'bold', ...
                       'BackgroundColor','white');      
               obj.GenSubPanelSizes = uipanel('Parent',  obj.GenPanel, ...
                       'Title', 'Maze sizes', ...
                       'Position',[120, 90, 130,  80], ...
                       'TitlePosition', 'centertop', ...
                       'FontSize', 14, ...
                       'FontWeight', 'bold', ...
                       'BackgroundColor','white');
                obj.GenSubPanelStartPose = uipanel('Parent',  obj.GenPanel, ...
                       'Title', 'Start Pose', ...
                       'Position',[120, 5, 130,  80], ...
                       'TitlePosition', 'centertop', ...
                       'FontSize', 14, ...
                       'FontWeight', 'bold', ...
                       'BackgroundColor','white');
               obj.GenButton = uibutton(obj.GenPanel, 'Text', 'Generate', ...
                    'Position',[20,60,70, 50], ...
                    'FontWeight', 'bold', ...
                    'FontSize', 14, ...
                    'ButtonPushedFcn', @(src, event)obj.RunGeneration());
                
                  obj.HeigthTextArea =  uieditfield(obj.GenSubPanelSizes,'numeric',...
                      'Value', 2,...
                      'Position',[10, 10, 40, 25],...
                      'Limits', obj.DefaultSizeLimits,...
                      'LowerLimitInclusive','on',...
                      'UpperLimitInclusive','on',...
                      'RoundFractionalValues','on', ...
                      'ValueChangedFcn',@(txt,event) obj.HeightChanged(event),...
                      'FontSize', 14);
               obj.HeightLabel = uilabel( obj.GenSubPanelSizes,  'Position', [10, 32, 50, 25], 'Text', 'Height', 'FontSize', 14);

               
               obj.WidthTextArea = uieditfield(obj.GenSubPanelSizes,'numeric',...
                      'Value', 2,...
                      'Position', [65, 10, 40, 25],...
                      'Limits', obj.DefaultSizeLimits,...
                      'LowerLimitInclusive','on',...
                      'UpperLimitInclusive','on',...
                      'RoundFractionalValues','on', ...
                      'ValueChangedFcn',@(txt,event) obj.WidthChanged(event),...
                      'FontSize', 14);
               obj.WidthLabel = uilabel( obj.GenSubPanelSizes,  'Position', [65, 32, 50, 25], 'Text', 'Width', 'FontSize', 14);
              
               
                obj.GenStartRow= uieditfield(obj.GenSubPanelStartPose,'numeric',...
                      'Value', 1,...
                      'Position', [10, 10, 40, 25],...
                      'Limits', [1, obj.Height],...
                      'LowerLimitInclusive','on',...
                      'UpperLimitInclusive','on',...
                      'RoundFractionalValues','on', ...
                      'ValueChangedFcn',@(txt,event) obj.StartRowGenChanged(event),...
                      'FontSize', 14);
             
               
                 obj.SProwLabel = uilabel(obj.GenSubPanelStartPose,  'Position', [10, 32, 50, 25], 'Text', 'Row', 'FontSize', 14);

                 obj.GenStartCol = uieditfield(obj.GenSubPanelStartPose,'numeric',...
                          'Value', 1,...
                          'Position', [65, 10, 40, 25],...
                          'Limits', [1, obj.Width],...
                          'LowerLimitInclusive','on',...
                          'UpperLimitInclusive','on',...
                          'RoundFractionalValues','on', ...
                          'ValueChangedFcn',@(txt,event) obj.StartColGenChanged(event),...
                          'FontSize', 14);
                  obj.SPcolLabel = uilabel(obj.GenSubPanelStartPose,  'Position', [65, 32, 50, 25], 'Text', 'Column', 'FontSize', 14);
                  obj.GenVizCheckBox =uicheckbox(obj.GenPanel, 'Text', 'Vizualization', ...
                        'Position',[275,100,150, 50], ...
                        'FontWeight', 'bold', ...
                        'FontSize', 14, ...
                        'ValueChangedFcn', @(src, event)obj.GenVizCheckboxStatus());
                  obj.GenSaveButton = uibutton(obj.GenPanel, 'Text', 'Save', ...
                        'Position',[300,30,60, 60], ...
                        'FontWeight', 'bold', ...
                        'FontSize', 14, ...
                        'ButtonPushedFcn', @(src, event)obj.SaveGenMaze());
         
            end
            %% Creates the Solving panel
            function CreateSolvingPanel(obj)  
                 obj.SolvePanel = uipanel('Parent',obj.RunWindow, ...
                       'Title', 'Solving panel', ...
                       'Position',[20+obj.GenPanel.Position(3), obj.DefaultFigPose(4) - 210, obj.GenPanel.Position(3), 200], ...
                       'TitlePosition', 'centertop', ...
                       'FontSize', 14, ...
                       'FontWeight', 'bold', ...
                       'BackgroundColor','white');

                 obj.SolveSubPanelStart = uipanel('Parent',   obj.SolvePanel, ...
                       'Title', 'Start Cell', ...
                       'Position',[120, 90, 130,  80], ...
                       'TitlePosition', 'centertop', ...
                       'FontSize', 14, ...
                       'FontWeight', 'bold', ...
                       'BackgroundColor','white');
                 obj.SolveSubPanelGoal = uipanel('Parent',  obj.SolvePanel, ...
                       'Title', 'Goal Cell', ...
                       'Position',[120, 5, 130,  80], ...
                       'TitlePosition', 'centertop', ...
                       'FontSize', 14, ...
                       'FontWeight', 'bold', ...
                       'BackgroundColor','white');
                 obj.SolveButton = uibutton( obj.SolvePanel, 'Text', 'Solve', ...
                       'Position',[20,100,70, 50], ...
                       'FontWeight', 'bold', ...
                       'FontSize', 14, ...
                       'ButtonPushedFcn', @(src, event)obj.RunSolving());
                 obj.ClearPathButton = uibutton( obj.SolvePanel, 'Text', 'Clear Path', ...
                       'Position',[20,30,70, 50], ...
                       'FontWeight', 'bold', ...
                       'FontSize', 12, ...
                       'ButtonPushedFcn', @(src, event)obj.ClearPath());
                 
                 
                 obj.StRowTextArea = uieditfield(obj.SolveSubPanelStart,'numeric',...
                       'Value', 1,...
                       'Position',[10, 10, 40, 25],...
                       'Limits', [1 obj.Height],...
                       'LowerLimitInclusive','on',...
                       'UpperLimitInclusive','on',...
                       'RoundFractionalValues','on', ...
                       'ValueChangedFcn',@(txt,event) obj.StartRowSolveChanged(event),...
                       'FontSize', 14);

                 obj.StRowLabel = uilabel(obj.SolveSubPanelStart,  'Position', [10, 32, 50, 25], 'Text', 'Row', 'FontSize', 14);


                 obj.StColTextArea = uieditfield(obj.SolveSubPanelStart,'numeric',...
                       'Value', 1,...
                       'Position',[65, 10, 40, 25],...
                       'Limits', [1 obj.Width],...
                       'LowerLimitInclusive','on',...
                       'UpperLimitInclusive','on',...
                       'RoundFractionalValues','on', ...
                       'ValueChangedFcn',@(txt,event) obj.StartColSolveChanged(event),...
                       'FontSize', 14);
                 obj.StColLabel = uilabel(obj.SolveSubPanelStart,  'Position', [65, 32, 50, 25], 'Text', 'Column', 'FontSize', 14);

                
                 obj.GoalRow = uieditfield(obj.SolveSubPanelGoal,'numeric',...
                       'Value', obj.Height,...
                       'Position',[10, 10, 40, 25],...
                       'Limits', obj.DefaultSizeLimits,...
                       'LowerLimitInclusive','on',...
                       'UpperLimitInclusive','on',...
                       'RoundFractionalValues','on', ...
                       'ValueChangedFcn',@(txt,event) obj.GoalRowChanged(event),...
                       'FontSize', 14);
                 obj.GoalRowLabel = uilabel(  obj.SolveSubPanelGoal ,  'Position', [10, 32, 50, 25], 'Text', 'Row', 'FontSize', 14);
                
                 obj.GoalCol =   uieditfield(obj.SolveSubPanelGoal,'numeric',...
                       'Value', obj.Width,...
                       'Position',[65, 10, 40, 25],...
                       'Limits', obj.DefaultSizeLimits,...
                       'LowerLimitInclusive','on',...
                       'UpperLimitInclusive','on',...
                       'RoundFractionalValues','on', ...
                       'ValueChangedFcn',@(txt,event) obj.GoalColChanged(event),...
                       'FontSize', 14);

                 obj.GoalColLabel = uilabel(  obj.SolveSubPanelGoal ,  'Position', [65, 32, 50, 25], 'Text', 'Column', 'FontSize', 14);
                 obj.SolveVizCheckBox = uicheckbox(obj.SolvePanel , 'Text', 'Vizualization', ...
                       'Position',[275,100,150, 50], ...
                       'FontWeight', 'bold', ...
                       'FontSize', 14, ...
                        'ValueChangedFcn', @(src, event)obj.SolveVizCheckboxStatus());
                 obj.SolveSaveButton = uibutton(obj.SolvePanel , 'Text', 'Save', ...
                    'Position',[300,30,60, 60], ...
                    'FontWeight', 'bold', ...
                    'FontSize', 14, ... 
                    'ButtonPushedFcn', @(src, event)obj.SaveSolveMaze());
           

            end
            %% Create the Axes for vizualization
            function CreateAxes(obj)
               obj.GenAxes = uiaxes('Parent', obj.RunWindow, ...,
                   'Position', [obj.GenPanel.Position(1) - 4, 5,  obj.GenPanel.Position(3), obj.GenPanel.Position(2) - 5], ...
                   'XTick',[], 'YTick', [], ...
                   'XColor','w', 'YColor', 'w');
               obj.SolveAxes = uiaxes('Parent', obj.RunWindow, ...,
                   'Position', [obj.SolvePanel.Position(1) - 4, 5,  obj.SolvePanel.Position(3), obj.SolvePanel.Position(2) - 5], ...
                   'XTick',[], 'YTick', [], ...
                   'XColor','w', 'YColor', 'w');
               obj.RunWindow.SizeChangedFcn =  @(src,event)obj.WindowSize();
               
            end
            
            %% Callback functions
            function WindowSize(obj) % Update panels and axes sizes
         
                 obj.GenPanel.Position  = [10, obj.RunWindow.Position(4) - 210, (obj.RunWindow.Position(3)-30)/2, 200]; 
                 obj.SolvePanel.Position =  [20+obj.GenPanel.Position(3), obj.RunWindow.Position(4) - 210,  obj.GenPanel.Position(3), 200];
                 obj.GenAxes.Position =  [obj.GenPanel.Position(1) - 4, 5,  obj.GenPanel.Position(3)+10, obj.GenPanel.Position(2) - 5];
                 obj.SolveAxes.Position =  [obj.SolvePanel.Position(1)-4, 5,  obj.SolvePanel.Position(3)+10, obj.SolvePanel.Position(2) - 5];
            end
                
            %% Generation panel callbacks
            % Sizes changed
            function  HeightChanged(obj, event) 
               obj.Height = event.Value;
               obj.GenStartRow.Limits = [1, obj.Height];
               obj.StRowTextArea.Limits = [1, obj.Height];
               obj.VizualizeAxe(1, InitMaze(obj.Height, obj.Width, obj.GenStartPose), true);
               
            end 
            function  WidthChanged(obj, event)
                obj.Width = event.Value;
                obj.GenStartCol.Limits = [1, obj.Width];
                obj.StColTextArea.Limits = [1, obj.Width];
                obj.VizualizeAxe(1, InitMaze(obj.Height, obj.Width, obj.GenStartPose), true);
                 
            end
            % Start Cell position for generating changed
            function  StartRowGenChanged(obj, event)
                
                new_row =  event.Value;
                VizualizeKeyPoseChange(obj.Height, obj.GenStartPose,[new_row, obj.GenStartPose(2)], 1, obj.GenAxes);
                obj.GenStartPose(1) = new_row;
                
            end 
            function  StartColGenChanged(obj, event)
                new_col =  event.Value;
                VizualizeKeyPoseChange(obj.Height, obj.GenStartPose,[obj.GenStartPose(1), new_col], 1, obj.GenAxes);
                obj.GenStartPose(2) = new_col;
            end
            % Vizualization of generating checkbox
            function  GenVizCheckboxStatus(obj)
                obj.isVizualizeGen = obj.GenVizCheckBox.Value;
            end
            % Save button
            function  SaveGenMaze(obj)
               obj.SetPanelStatus(1, 'off');
               obj.SetPanelStatus(0, 'off'); 
                [file, path, indx] = uiputfile(obj.filter);
                if indx
                    exportgraphics(obj.GenAxes,fullfile(path, file));
                end
                 obj.SetPanelStatus(1, 'on');
               obj.SetPanelStatus(0, 'on'); 
            end
            % Generate button
            function  RunGeneration(obj)
                % Disable all other panels
                obj.SetPanelStatus(1, 'off');
                obj.SetPanelStatus(0, 'off');
                obj.isGenerated = false; 
                cla(obj.SolveAxes);
                cla(obj.GenAxes);
                pause(1)
                % Generate
                init_maze = InitMaze(obj.Height, obj.Width, obj.GenStartPose);
                obj.VizualizeAxe(1, init_maze, false);
                
                % Vizualize Generating(yes or no)
                obj.GenMaze = Randomized_DFS(init_maze, obj.isVizualizeGen, obj.GenAxes);
                obj.SolvedMaze = obj.GenMaze;
                obj.VizualizeAxe(1, obj.GenMaze, false);
                obj.VizualizeAxe(0, obj.SolvedMaze, false);
                % Enable all other panels
                obj.SetPanelStatus(1, 'on');
                obj.SetPanelStatus(0, 'on');
                obj.isGenerated = true;
                 
    
            end
            %% Solve panel callbacks
            % Start Cell position for solving changed
            function  StartRowSolveChanged(obj, event)
                   new_row =  event.Value;
                   VizualizeKeyPoseChange(obj.Height, obj.SolveStartPose,[new_row, obj.SolveStartPose(2)], 1, obj.SolveAxes);
                   obj.SolveStartPose(1) = new_row;
            end
            function  StartColSolveChanged(obj, event)
                new_col = event.Value;
                VizualizeKeyPoseChange(obj.Height, obj.SolveStartPose,[obj.SolveStartPose(1), new_col], 1, obj.SolveAxes);
                obj.SolveStartPose(2) = new_col;
            end
            % Goal Cell position for solving changed
            function  GoalRowChanged(obj, event)
                 new_rowGoal =  event.Value;
                 VizualizeKeyPoseChange(obj.Height, obj.SolveGoalPose,[new_rowGoal, obj.SolveGoalPose(2)], 0, obj.SolveAxes);   
                 obj.SolveGoalPose(1) = new_rowGoal;
                 obj.SolveAxes.YLim = [min([1, obj.Height+1-obj.SolveGoalPose(1)]), 1+obj.Height];
            end 
            function  GoalColChanged(obj, event)
                 new_colGoal =  event.Value;
                 VizualizeKeyPoseChange(obj.Height, obj.SolveGoalPose,[obj.SolveGoalPose(1), new_colGoal], 0, obj.SolveAxes);   
                 obj.SolveGoalPose(2) =  new_colGoal;
                 obj.SolveAxes.XLim = [1, max([1+obj.SolveGoalPose(2), 1+obj.Width])];
               
            end
            % Vizualization of solving checkbox
            function  SolveVizCheckboxStatus(obj)
                obj.isVizualizeSolve = obj.SolveVizCheckBox.Value;
            end
            % Save button
            function  SaveSolveMaze(obj)
               obj.SetPanelStatus(1, 'off');
               obj.SetPanelStatus(0, 'off'); 
                [file, path, indx] = uiputfile(obj.filter);
                if indx
                    exportgraphics(obj.SolveAxes,fullfile(path, file));
                end
                obj.SetPanelStatus(1, 'on');
               obj.SetPanelStatus(0, 'on'); 
            end
            % Clear generated path button
            function  ClearPath(obj)
                
                if obj.pathLength ~=0
                    VizualizePath(obj.SolvedMaze,obj.pathStack, obj.pathLength, obj.SolveAxes, obj.SolveGoalPose, true);
                    VizualizeKeyPoseChange(obj.SolvedMaze.height, obj.SolveStartPose, obj.SolveStartPose, 1, obj.SolveAxes);
                    VizualizeKeyPoseChange(obj.SolvedMaze.height, obj.SolveGoalPose, obj.SolveGoalPose, 0, obj.SolveAxes);
                    obj.pathLength = 0;
                end
                
            end
            % Solve button
            function  RunSolving(obj)
                if obj.isGenerated
                    obj.SetPanelStatus(1, 'off');
                    obj.SetPanelStatus(0, 'off'); 
                    obj.SolvedMaze.startCell.row = obj.SolveStartPose(1);
                    obj.SolvedMaze.startCell.col = obj.SolveStartPose(2);
                    pause(1)
                    obj.VizualizeAxe(0, obj.SolvedMaze, false);
                    [obj.pathStack, obj.pathLength]  = TremauxAlgorithm(obj.SolvedMaze, obj.SolveStartPose, obj.SolveGoalPose, obj.isVizualizeSolve, obj.SolveAxes);
                    if obj.isVizualizeSolve
                       obj.VizualizeAxe(0, obj.SolvedMaze, false);
                        
                    end
                    
                       
                   VizualizePath(obj.SolvedMaze,obj.pathStack, obj.pathLength, obj.SolveAxes, obj.SolveGoalPose, false);
                  
                    obj.SetPanelStatus(1, 'on');
                    obj.SetPanelStatus(0, 'on'); 
                end 
                   
               
            end
           
         %% Additional functions
         % Disable-enable panel elements
         function SetPanelStatus(obj, panelId, newStatus) 
           
             if panelId % 1 - Generation Panel
                  children = get(obj.GenPanel,'Children');
                  
             else % 0 - Solve Panel
                  children = get(obj.SolvePanel,'Children');
       
             end
             set(children(isprop(children,'Enable')),'Enable',newStatus);
        
         end 
         % Vizualize the maze for the selected axes
         function VizualizeAxe(obj, panelId, maze, initDraw) % initDraw = draw only grid
          
              if panelId % 1 - Generation Panel
                    cla(obj.GenAxes)
                    obj.GenAxes.XLim = [1, 1+obj.Width];
                    obj.GenAxes.YLim = [1, 1+obj.Height];
                    VizualizeMaze(maze, [], obj.GenAxes, initDraw);
             else % 0 - Solve Panel
                  cla(obj.SolveAxes)
                  obj.SolveAxes.XLim = [1, max([1+obj.SolveGoalPose(2), 1+obj.Width])];
                  obj.SolveAxes.YLim = [min([1, obj.Height+1-obj.SolveGoalPose(1)]), 1+obj.Height];
                  VizualizeMaze(maze , obj.SolveGoalPose, obj.SolveAxes, initDraw);
              end 
       
        
         end
         end
    
            
 end 
       

