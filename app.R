###################
# app.R
# 
# Main controller. 
# Used to import your ui and server components; initializes the app.
###################
library(shiny)
library(shinydashboard)
library(diffr)
library(diffobj)
library(DT)
library(bslib)
library(shinyWidgets)

source('ui.R')
source('server.R')
source('functions.R')


shinyApp(ui, server)
