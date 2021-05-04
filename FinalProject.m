%A Lot'o code (Final Project)
%By: Zachary Bravo

function [] = FinalProject()
    
    % global values updated by callbacks
    global new_yValues;
    global new_xValues;
    global plotvalue;
    global titleName; 
    global xaxisName;
    global yaxisName; 
    global ax;
    
    
    
    %creates figure as a parent
    fig = figure('numbertitle','off','name','Interactive Graphing Tool',...
        'Position',[400, 175, 725, 350]);
    
    
    
    %plot functions
     ax = axes('Parent',fig,'Units','pixels','Position',[50,60,335,250]);
    
     new_xValues = 0;
     new_yValues = new_xValues.^2;
     hold on;
     
     xlim(ax, [0 100]);
     ylim(ax, [0 1000]);
     hold on;  
     
     plotvalue = plot(ax, new_xValues, new_yValues,'r');
     titleName = title('','Color', 'm'); %1 %what if I wrote something here
     xaxisName = xlabel('','Color', 'm'); %2
     yaxisName = ylabel('','Color', 'm'); %3
    
     plotvalue.XDataSource = 'new_xValues';
     plotvalue.YDataSource = 'new_yValues';
     hold on;
     

       
    % user plot controls
    titleControl = uicontrol('Style','edit','String','Title','Position',...
        [485,280,70,25],'Callback',@plotTitle_Callback);
    uicontrol(titleControl);
    xAxisControl = uicontrol('Style','edit','String','X-Axis','Position',...
        [485,235,70,25],'Callback',@plot_xAxis_Callback); 
    uicontrol(xAxisControl);
    yAxisControl = uicontrol('Style','edit','String','Y-Axis','Position',...
        [485,190,70,25],'Callback',@plot_yAxis_Callback);
    uicontrol(yAxisControl);
    xLimitControl = uicontrol('Style','edit','String','3 14','Position',...
        [625,155,70,25],'Callback',@plot_xLimit_Callback); %Pie is good to eat
    uicontrol(xLimitControl);
    yLimitControl = uicontrol('Style','edit','String','5 4','Position',...
        [625,120,70,25],'Callback',@plot_yLimit_Callback); % May the 4th Bee with you 
    uicontrol(yLimitControl);
    
    staticText = uicontrol('Style','text','String','Title:','Position',...
        [450,275,35,25]);
    staticText = uicontrol('Style','text','String','X-Axis:','Position',...
        [446,230,35,25]);
    staticText = uicontrol('Style','text','String','Y-Axis:','Position',...
        [446,185,35,25]);
    staticText = uicontrol('Style','text','String','X Limits:','Position',...
        [578,150,45,25]);
    staticText = uicontrol('Style','text','String','Y Limits:','Position',...
        [578,115,45,25]);


    
    % color radio control
    colorRadioGroup = uibuttongroup(fig,'Units','pixels','Position',...
        [595,200,125,120],'SelectionChangedFcn',@plot_colorSelectionChanged);
    blackButton = uicontrol(colorRadioGroup,'Style','radiobutton',...
        'Position',[10,92,90,15],'String','Black');
    redButton = uicontrol(colorRadioGroup,'Style','radiobutton',...
        'Position',[10,77,90,15],'String','Red');
    greenButton = uicontrol(colorRadioGroup,'Style','radiobutton',...
        'Position',[10,61,90,15],'String','Green');
    blueButton = uicontrol(colorRadioGroup,'Style','radiobutton',...
        'Position',[10,46,90,15],'String','Blue');
    cyanButton = uicontrol(colorRadioGroup,'Style','radiobutton',...
        'Position',[10,28,90,15],'String','Cyan');
    magentaButton = uicontrol(colorRadioGroup,'Style','radiobutton',...
        'Position',[10,13,90,15],'String','Magenta');

    

    % marker radio control
    markerRadioGroup = uibuttongroup(fig,'Units','pixels','Position',...
        [595,10,125,100],'SelectionChangedFcn',@plot_markerSelectionChanged);
    noneButton = uicontrol(markerRadioGroup,'Style','radiobutton',...
        'Position',[10,83,90,15],'String','None');
    circleButton = uicontrol(markerRadioGroup,'Style','radiobutton',...
        'Position',[10,68,90,15],'String','Circle');
    plusButton = uicontrol(markerRadioGroup,'Style','radiobutton',...
        'Position',[10,52,90,15],'String','Plus');
    asteriskButton = uicontrol(markerRadioGroup,'Style','radiobutton',...
        'Position',[10,37,90,15],'String','Asterisk');
    crossButton = uicontrol(markerRadioGroup,'Style','radiobutton',...
        'Position',[10,19,90,15],'String','Cross');
    diamondButton = uicontrol(markerRadioGroup,'Style','radiobutton',...
        'Position',[10,4,90,15],'String','Diamond');
    
    
    
    % user input for plot data
    xValues = uicontrol('Style','edit','String','1 2 3','Position',...
        [485,135,70,25],'Callback',@plot_xValuez_Callback); %2
    uicontrol(xValues);
    yValues = uicontrol('Style','edit','String','1 2 3','Position',...
        [485,100,70,25],'Callback',@plot_yValuez_Callback); %2
    uicontrol(yValues);
    
    staticText = uicontrol('Style','text','String','X-Values:',...
        'Position',[432,130,50,25]);
    staticText = uicontrol('Style','text','String','Y-Values:',...
        'Position',[432,95,50,25]);
    
    
    
    % user plot button
    graphPoints = uicontrol('Style','pushbutton','String','Plot',...
        'Position',[485,65,70,25],'Callback',@plotButton_Callback);
    
    
    
    % user reset button
     resetHandle = uicontrol('Style','pushbutton','String','Reset',...
         'Position',[485,35,70,25],'Callback',@resetButton_Callback);
    

     
    % callbacks
    function plotTitle_Callback(source,eventdata)
        
        newTitle = source.String;

        set(titleName,'String', newTitle) 
        
    end



    function plot_xAxis_Callback(source,eventdata)
        
        new_xaxisName = source.String;
        
        set(xaxisName,'String', new_xaxisName)
        
    end



    function plot_yAxis_Callback(source,eventdata)
        
        new_yaxisName = source.String;
        
        set(yaxisName,'String', new_yaxisName) 
        
    end



    function plot_xLimit_Callback(source,eventdata)
        
        if regexp(source.String,'[;i]')
            invalidErrorHandle = errordlg(...
                'Invalid data. Does not accept multidimension arrays or complex numbers.',...
                'Input Error', 'modal');
        else
            [new_xLimit, success] = str2num(source.String);
            if success ~= 1
                inputErrorHandle = errordlg(...
                    'Invalid data. Input must be an array of 2 numbers.',...
                    'Input Error', 'modal');
            elseif  (source.String == "")
                set(xLimitHandle,'XLimMode','auto')
            elseif length(new_xLimit) ~= 2
                inputErrorHandle = errordlg(...
                    'Invalid limits. Input must be an array of 2 numbers.',...
                    'Input Error', 'modal');
            elseif new_xLimit(1) >= new_xLimit(2)
                inputErrorHandle = errordlg(...
                    'Invalid limits. Second Value must be great than first.',...
                    'Input Error', 'modal');
            else   
                xlim(ax, new_xLimit);
                
            end
            
        end
        
    end



    function plot_yLimit_Callback(source,eventdata)
        
        if regexp(source.String,'[;i]')
            invalidErrorHandle = errordlg(...
                'Invalid data. Does not accept multidimension arrays or complex numbers.',...
                'Input Error', 'modal');
        else
            [new_yLimit, success] = str2num(source.String);
            if success ~= 1
                inputErrorHandle = errordlg(...
                    'Invalid data. Input must be an array of 2 numbers.',...
                    'Input Error', 'modal');
            elseif  (source.String == "")
                set(yLimitHandle,'YLimMode','auto')
            elseif length(new_yLimit) ~= 2
                inputErrorHandle = errordlg(...
                    'Invalid limits. Input must be an array of 2 numbers.',...
                    'Input Error', 'modal');
            elseif new_yLimit(1) >= new_yLimit(2)
                inputErrorHandle = errordlg(...
                    'Invalid limits. Second Value must be great than first.',...
                    'Input Error', 'modal');
            else 
                ylim(ax, new_yLimit);
                
            end
            
        end 
        
    end



    function plot_xValuez_Callback(source,eventdata)

        if (source.String == "")
            emptyErrorHandle = errordlg(...
                'No data provided. Input must be an array of numbers.',...
                'Input Error', 'modal');
        elseif regexp(source.String,'[;i]')
            invalidErrorHandle = errordlg(...
                'Invalid data. Does not accept multidimension arrays or complex numbers.',...
                'Input Error', 'modal') ; 
        end
        [new_xValues, success] = str2num(source.String);
        if success ~= 1
            inputErrorHandle = errordlg(...
                'Invalid data. Input must be an array of numbers.',...
                'Input Error', 'modal');
            
        end        
        
        new_xValues = str2num(source.String);
        
    end



    function plot_yValuez_Callback(source,eventdata)
        
        if (source.String == "")
            emptyErrorHandle = errordlg(...
                'No data provided. Input must be an array of numbers.',...
                'Input Error', 'modal');
        elseif regexp(source.String,'[;i]')
            invalidErrorHandle = errordlg(...
                'Invalid data. Does not accept multidimension arrays or complex numbers.',...
                'Input Error', 'modal'); 
        end
        [new_yValues, success] = str2num(source.String);
        if success ~= 1
            inputErrorHandle = errordlg(...
                'Invalid data. Input must be an array of numbers.',...
                'Input Error', 'modal');
            
        end

        new_yValues = str2num(source.String);  
        
    end



    function plot_colorSelectionChanged(source,eventdata)
        
        switch get(eventdata.NewValue,'String') % Get Tag of selected object.
        case 'Black'
            set(plotvalue,'Color','k');
        case 'Red'
            set(plotvalue,'Color','r');
        case 'Green'
            set(plotvalue,'Color','g');
        case 'Blue'
            set(plotvalue,'Color','b');
        case 'Cyan'
            set(plotvalue,'Color','c');
        case 'Magenta'
            set(plotvalue,'Color','m');
            
        end
        
    end



    function plot_markerSelectionChanged(source,eventdata)
        
        switch get(eventdata.NewValue,'String') % Get Tag of selected object.
        case 'None'
            set(plotvalue,'Marker','none');
        case 'Circle'
            set(plotvalue,'Marker','o');
        case 'Plus'
            set(plotvalue,'Marker','+');
        case 'Asterisk'
            set(plotvalue,'Marker','*');
        case 'Cross'
            set(plotvalue,'Marker','x');
        case 'Diamond'
            set(plotvalue,'Marker','diamond');
            
        end
        
    end



    function plotButton_Callback(source,eventdata)
       
         errorOpts = struct('WindowsStyle', 'modal');
         if (length(new_xValues) ~= length(new_yValues))
             errorHandle = errordlg('Array lengths must be equal',...
                 'Array Length Error', 'modal');
             
         end
     
         refreshdata(plotvalue,'caller')
         drawnow

    end



     function resetButton_Callback(source,eventdata)
         
        % clear plot
        hold off;
        new_xValues = 0;
        new_yValues = 0;
        set(plotvalue,'xdata',new_xValues,'Ydata',new_yValues)
        xlim(ax, [0 100]);
        ylim(ax, [0 1000]);
        
        % clear all edit boxes
        set(titleName,'String', "");
        set(xaxisName,'String', "");
        set(yaxisName,'String', "");
        set(titleControl,'String', "");
        set(xAxisControl,'String', "");
        set(yAxisControl,'String', "");
        set(xValues,'String', "");
        set(yValues,'String', "");
        set(xLimitControl,'String',"")
        set(yLimitControl,'String',"")
        noneButton.Value = true;
        redButton.Value = true;
        hold on;
        
        %refresh :^)
        refreshdata(plotvalue,'caller')
        drawnow
        
     end

 
 
end