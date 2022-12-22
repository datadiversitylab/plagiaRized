###################
# ui.R
# 
# Initializes the ui. 
# Used to load in your header, sidebar, and body components.
###################

ui <- fluidPage(

  titlePanel("plagiaRized"),
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected == 'panel1'", 
       fileInput("upload", "Upload",
           accept = ".rmd", 
           multiple = TRUE),
           actionButton("run", "Run analyses")
      ),
        conditionalPanel(condition = "input.tabselected == 'panel2'", 
                                   h3("Visually compare the files")
                        )
    ),
    mainPanel(
      width = 6,
        tabsetPanel(
          id = "tabselected",
          type = "tabs",
      tabPanel("Stats", id = "panel1", value = "panel1",
      DT::dataTableOutput("comparison")
      ),
      tabPanel("Visual", id = "panel2", value = "panel2",
      fluidPage(diffrOutput("diffobj_element"))
      )
    )
    )
  )
)
