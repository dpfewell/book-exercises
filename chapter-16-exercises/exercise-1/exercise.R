# Exercise 1: ggplot2 basics

# Install and load the `ggplot2` package
# You will also want to load `dplyr`
# install.packages("ggplot2")
library("ggplot2")
library("dplyr")

# For this exercise you'll be working with the `diamonds` data set included in 
# the ggplot2 library
# Use `?diamonds` to get more information about this data set (including the 
# column descriptions. Also check the _column names_ and the _number of rows_ 
# in the data set

 ?diamonds
# View(diamonds)

# This data set has A LOT of rows. To make things a bit more readable, 
# use dplyr's `sample_n()` function to get a random 1000 rows from the data set
# Store this sample in a variable `diamonds_sample`
diamonds_sample <- sample_n(diamonds, 1000)

# Start by making a new `ggplot` with the `diamonds_sample` as the data (no 
# geometry yet)
# What do you see? (What did you expect?)
no_geom <- ggplot(data = diamonds_sample)
# print(no_geom)
# The plot shows nothing, I didn't expect it to because I haven't given R a way
# to plot any data.

# Draw a scatter plot (with point geometry) with for the `diamonds_sample` set, 
# with the `carat` mapped to the x-position and `price` mapped to the y-position.
carat_price <- ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = price))
# print(carat_price)

# Draw the same plot as above, but color each of the points based on their 
# clarity.
carat_price_color <- ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = price, color = clarity))
# print(carat_price_color)

# Draw the same plot as above, but for the entire `diamonds` data set. Note this
# may take a few seconds to generate.
full_carat_price_color <- ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price, color = clarity))
# print(full_carat_price_color)

# Draw another scatter plot for `diamonds_sample` of price (y) by carat (x),
# but with all of the dots colored "blue".
# Hint: you'll need to set the color channel, not map a value to it!
carat_price_blue <- ggplot(data = diamonds_sample) +
  geom_point(
  mapping = aes(x = carat, y = price, color = clarity),
  color = "blue",
  alpha = .3
)
# print(carat_price_blue)

# Draw a scatter plot for `diamonds_sample` of `price` by `carat`, where each
# point has an aesthetic _shape_ based on the diamond's `cut`.
carat_price_cut <- ggplot(diamonds_sample) +
  geom_point(
    mapping = aes(x = carat, y = price, shape = factor(cut))
  )

# print(carat_price_cut)

# Draw a scatter plot for `diamonds_sample` of *`cut`* by `carat`, where each
# point has an aesthetic _size_ based on the diamond's *`price`*
cut_carat_price <- ggplot(diamonds_sample) +
  geom_point(
    mapping = aes(x = cut, y = carat, size = price)
  )

# print(cut_carat_price)

# Try coloring the above plot based on the diamond's price!
cut_carat_price2 <- ggplot(diamonds_sample) +
  geom_point(
    mapping = aes(x = cut, y = carat, size = price, color = price)
  )

# print(cut_carat_price2)

# Draw a line plot (with line geometry) for `diamonds_sample`. The x-position 
# should be mapped to carat, y-position to price, and color to cut.
diamond_line <- ggplot(diamonds_sample) +
  geom_line(
    mapping = aes(x = carat, y = price, color = cut)
  )
# print(diamond_line)
  
# That's kind of messy. Try using `smooth` geometry instead.
diamond_line_smooth <- ggplot(diamonds_sample) +
  geom_smooth(
    mapping = aes(x = carat, y = price, color = cut)
  )
# print(diamond_line_smooth)

# Draw a plot with column geometry (a bar chart), mapping the diamond's `cut` to 
# the x-axis and `price` to the y-axis. Note that by default, column geometry 
# will us the "sum" of all of the y-values, so that the chart is actually of the
# TOTAL value of all of the diamonds of that cut!
cut_bar_price <- ggplot(diamonds_sample) +
  geom_col(
    mapping = aes(x = cut, y = price)
  )
# print(cut_bar_price)

# Add an aesthetic property that will _fill_ each bar geometry based on the 
# `clarity` of the diamonds. 
# What kind of chart do you get?
diam_clar_bar <- ggplot(diamonds_sample) +
  geom_col(
    mapping = aes(x = cut, y = price, color = clarity)
  )
# print(diam_clar_bar)

# Draw a plot of the `diamonds_sample` data (price by carat), with both points 
# for each diamond AND smoothed lines for each cut (hint: in a separate color)
# Give the points an `alpha` (transparency) of 0.3 to make the plot look nicer
price_by_carat <- ggplot(diamonds_sample) +
  geom_point(
    mapping = aes(x = carat, y = price),
    color = "blue",
    alpha = .3
  ) +
  geom_smooth(mapping = aes(x = carat, y = price),
              color = "red",
              alpha = .3)
print(price_by_carat)

## Bonus
# Draw a column chart of average diamond prices by clarity, and include 
# "error bars" marking the standard error of each measurement.
#
# You can calculate standard error as the _standard deviation_ divided by the 
# square root of the number of measurements (prices)

# Start by creating a data frame `clarity_summary` that includes summarized data 
# for each clarity group. Your summary data should include the mean price and the
# standard error of the price.


# Then draw the plot. The error bars should stretch from the mean-error to the 
# mean+error.

