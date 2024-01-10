setwd("E:/Fertility problems in Mung bean/Climate Tylor")
df<-read.csv("E:/Fertility problems in Mung bean/Climate Tylor/3CDD.csv", header = TRUE)
# Load necessary libraries
library(dplyr)
library(tidyr)
library(plotly)
# Convert data to long format
df_long <- df %>%
  pivot_longer(cols = -Month, names_to = "Temperature_Type", values_to = "Temperature")

# Create dynamic temperature line chart
temperature_line_chart <- plot_ly(df_long, x = ~Month, y = ~Temperature, color = ~Temperature_Type,
                                  type = 'scatter', mode = 'lines+markers') %>%
  layout(title = 'Dynamic Temperature Line Chart',
         xaxis = list(title = 'Month'),
         yaxis = list(title = 'Temperature'))

# Display the plot
temperature_line_chart




#for creating the animations need improvemnt

library(tidyverse)
library(plotly)
df<-read.csv("E:/Fertility problems in Mung bean/Climate Tylor/3CDD.csv", header = TRUE)

# Convert 'Month' column to numeric data
df$Month <- as.numeric(gsub("-", "", df$Month))

# Convert data to long format
df_long <- df %>%
  pivot_longer(cols = -Month, names_to = "Temperature_Type", values_to = "Temperature")

# Create animated temperature line chart
temperature_animation_chart <- plot_ly(df_long, x = ~Month, y = ~Temperature, color = ~Temperature_Type,
                                       type = 'scatter', mode = 'lines+markers') %>%
  add_trace(data = filter(df_long, Temperature_Type == "2020max_Tem"),
            frame = "2020max_Tem") %>%
  add_trace(data = filter(df_long, Temperature_Type == "2021max_Tem"),
            frame = "2021max_Tem") %>%
  add_trace(data = filter(df_long, Temperature_Type == "2022max_Tem"),
            frame = "2022max_Tem") %>%
  add_trace(data = filter(df_long, Temperature_Type == "2023max_Tem"),
            frame = "2023max_Tem") %>%
  layout(title = 'Animated Temperature Line Chart',
         xaxis = list(title = 'Month'),
         yaxis = list(title = 'Temperature'),
         updatemenus = list(list(type = "buttons", showactive = FALSE, buttons = list(list(label = "Play",
                                                                                           method = "animate", args = list(list(frame = list(duration = 500, redraw = TRUE), fromcurrent = TRUE))),
                                                                                      list(label = "Pause", method = "animate", args = list(list(frame = list(duration = 0, redraw = TRUE), mode = "immediate"), NULL)))))
  )

temperature_animation_chart
