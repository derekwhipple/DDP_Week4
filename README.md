# DDP_Week4

This application provides a simple view of the "women" data set found in R. 

This application displays a chart showing the relationship between the height and weight of women and a predicted value of weight. There are two functions that can be performed in the application:
- Draw the smoothing line on the chart
- Predict the weight provided a height

To show the smooth line in the chart, simply check the box to show, or un-check to not show.

To show a predicted weight value, fill in a height (in inches) in the text box and the weight value will populate a moment later without any button presses.

Notes:
- There is no input validation performed.
  - There are values for height that will display negative weight values.
  - No error occurs if providing a negative height value
  - There is no upper-bounds on height either.
