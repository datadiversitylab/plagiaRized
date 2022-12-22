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
                                   selectInput("compare", 
                                   "Choose files", 
                                   multiple = T, 
                                   choices = 'No choices here yet',
       options = list(maxItems = 2))
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
      fluidPage(htmlOutput('diffobj_element'))
      )
    )
    )
  )
)
