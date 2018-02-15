function [ control, test ] = splitData( dataSet )
%SPLITDATA splits a standard AutonoMouse data set into two structures, one
%for control animals, one for test animals based on NMDA parameter
control = struct();
test = struct();

mouseNames = fieldnames(dataSet);






for i = 1:length(mouseNames)
    thisMouse = dataSet.(mouseNames{i});
    
    if thisMouse.NMDA > 0
        test.(mouseNames{i})=thisMouse;
    else
        control.(mouseNames{i})=thisMouse;
    end
end


end

