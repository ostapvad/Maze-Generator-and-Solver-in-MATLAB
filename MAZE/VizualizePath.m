function VizualizePath(height,pathStack, pathLength) % Vizualize the founded path
for i=1:pathLength
  VizualizeSearching(height, pathStack{i}, 1)
end 
end

