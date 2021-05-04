The magic Zachary BravoFinal Project 
filename: FinalProject.m
function name: FinalProject
FinalProject provides a plot and a GUI to specify and modify the output appearance.
The user has the ability to specify text strings for the plot title, x axis and y axis in edit boxes.
The user has the ability to specify the plot color and plot markers through radio buttons
The user has the ability to specify the x limits and y limits for the plot with an array of 2: lowerlimit upperlimitThe magic Zachary Bravo
The user has the ability to specify the x and y data as an array of space separated numbers.
	The length of the arrays must be the same and does not accept complex numbers or multi-dimension arrays.
	Sample array: 1 2 5 7 8 or [1 2 3] or 1.1 2.2 3.3 4.2 or 1:5
The user has the ability to select to plot or reset the data.
If the user enters invalid data, the GUI provides modal error messages to tell them the problem.
If the user wants, the plot title and axes titles can be blank.
If the user does not enter x or y limits, they default to auto

Sample data:
	    x inputs: 1 2 3 4 5 6    y inputs: 1 2 3 4 5 6
	    x inputs: 1.1 2.2 3.4    y inputs: 1.1 2.2 3.4
	    x inputs: [1 2 3 4 5 6]  y inputs: [6 5 4 3 2 1]
  Error inputs:
	    x inputs: 1 2 3 4 5      y inputs: 4 3 3 7 5 6
	    x inputs: c 2 a q v 6    y inputs: l m n o 6 q
	    x inputs: 1 2; 3 4; 5    y inputs: 1; 2 3  5 6;
	    x inputs: 1 2 i 4 5 6    y inputs: 1 2 3 4 i 6
Edit Fields:
	    Title, x-axis, y-axis, labels inputs: will take a blank or text string
	    x-limit inputs: 1 2    y-limit inputs: 2 10
	    x-limit inputs: 0 100  y-limit inputs: 0 100  Error inputs:
	    x-limit inputs: 0 0    y-limit inputs: 5 4
	    x-limit inputs: c x    y-limit inputs: i i
	    x-limit inputs: 101    y-limit inputs: 010
Test plot and reset and try to set different colors and markers.(take a nap finals are hard)
(Zooming in might help :^))