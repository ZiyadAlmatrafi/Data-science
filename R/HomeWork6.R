library(tidyverse)

# 3.2.4 Exercises
#1
ggplot(data = mpg) # Empty plot

#2
ncol(mpg) #11
nrow(mpg) #234

#3
?mpg # drv: the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#4
ggplot(mpg,aes(x=cyl, y=hwy)) +geom_point()

#5
ggplot(mpg,aes(x=class, y=drv)) +geom_point() #Because its not good with categorical data

#3.3.1 Exercises
#1
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = "blue")) #Because the color argument is inside the aes, it should be like below

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#2
?mpg
#categorical variables: manufacturer,model,trans,drv,fl,class
#continuous variables: displ,year,cyl,cty,hwy

#3
ggplot(mpg, aes(x = displ, y = hwy, colour = year)) +geom_point()

ggplot(mpg, aes(x = displ, y = hwy, size = year)) + geom_point()

ggplot(mpg, aes(x = displ, y = hwy, shape = year)) +geom_point() #Error:A continuous variable can not be mapped to shap

#4
ggplot(mpg, aes(x = displ, y = hwy, colour = hwy, size = displ)) +geom_point() #It display hwy as y and color and displ as x and size

#5
?geom_point
#stroke aesthetic to modify the width of the border

#6
ggplot(mpg, aes(x = displ, y = hwy, colour = displ < 5)) +geom_point() # It will display result as logical

#3.5.1 Exercises
#1
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() +facet_grid(. ~ cty) #The continuous variable is converted to a categorical variable

#2
ggplot(data = mpg) + geom_point(mapping = aes(x = drv, y = cyl)) #

#3
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy)) +facet_grid(drv ~ .) #The symbol (.)ignores that dimension when faceting

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2) #What are the advantages to using faceting instead of the colour aesthetic?  To get better view at categorical data
  #What are the disadvantages? Its difficult to compare between values
#5
?facet_wrap #To get Number of rows and columns

#6
?facet_grid #There will be more space for columns if the plot is horizontal

#3.6.1 Exercises
#1
# line chart: geom_line()
# boxplot: geom_boxplot()
# histogram: geom_histogram()
# area chart: geom_area()

#2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

#3
#What does show.legend = FALSE do? Hides the legend box
#What happens if you remove it? it will consider the value as TRUE and display the box

#4
?geom_smooth() #Display confidence interval around smooth

#5
#No, because they have the same mapping

#6
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(mapping=aes(group=drv),se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color=drv)) + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color=drv)) + 
  geom_smooth(mapping = aes(linetype=drv),se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size=5, color="white")+
  geom_point(aes(color=drv))

#Exercise 3.7.1
#1
#The default geom for stat_summary() is geom_pointrange()
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary"
  )

#2
#What does geom_col() do? geom_col() expects that the data contains x values and y values which represent the bar height
# How is it different to geom_bar()? geom_bar() function only expects an x variable

#3
# geom	                   stat
# geom_bar()	            stat_count()
# geom_bin2d()	          stat_bin_2d()
# geom_boxplot()	        stat_boxplot()
# geom_contour_filled()	  stat_contour_filled()
# geom_contour()	        stat_contour()
# geom_count()	          stat_sum()

#4
?stat_smooth() 
# y: predicted value
# ymin: lower value of the confidence interval
# ymax: upper value of the confidence interval
# se: standard error

#5
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
#They will display the same value for y 

#3.8.1 Exercises
#1
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()

#2
# width: controls the amount of horizontal displacement
# height: controls the amount of vertical displacement

#3
# The geom geom_jitter() adds random variation to the locations points of the graph
# The geom geom_count() sizes the points relative to the number of observations

#4
?geom_boxplot()
# What’s the default position adjustment for geom_boxplot()? dodge2
ggplot(data = mpg, aes(x = drv, y = hwy, colour = class)) +
  geom_boxplot()
