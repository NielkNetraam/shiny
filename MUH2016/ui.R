#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(leaflet)

shinyUI(navbarPage(theme = "cerulean", "MTB UH 2016",
    tabPanel("Ride Count",
             sidebarLayout(
                 sidebarPanel(
                     selectizeInput("selection",
                                    "Choose a track:",
                                    choices = tracks, 
                                    multiple = TRUE,
                                    selected = 0,
                                    options = list(
                                         placeholder = 'Please select an option below'
                                    #     onInitialize = I('function() { this.setValue(""); }')
                                         )
                                    )
                 ),
                 
                 # Show a plot of the generated distribution
                 mainPanel(
                     tabsetPanel(type = "tabs", 
                                 tabPanel("Month", 
                                          plotlyOutput("plotMonth")
                                          ), 
                                 tabPanel("Day", 
                                          plotlyOutput("plotDay"),
                                          hr(),
                                          sliderInput("months", "Months:", min = 1, max = 12, value = c(1,12))
                                          ), 
                                 tabPanel("Hour", 
                                          plotlyOutput("plotHour"),
                                          hr(),
                                          sliderInput("month", "Month:", min = 1, max = 12, value = 1)
                                          )
                     )
                 )
             )
           ),
           tabPanel("Tracks",
                    leafletOutput("plotTrack")
           )
))
