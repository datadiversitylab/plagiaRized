###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could split those into their own
# components as well.
###################
body <- dashboardBody(
  tabItems(
    
    ########################
    # First tab content
    ########################
    tabItem(
      tabName = "dashboard",
      fluidRow(
        
        # CONTROLS
        box(
          
          title = "Controls",
          
          # File sumission
          fileInput("upload", "Upload", accept = ".zip"),

          # File extension
          textInput("Fileextension", 
          label = "File extension", 
          value = ".rmd"),

          # File pattern
          textInput("FilePattern", 
          label = "File pattern", 
          value = ""),
                    
          # Create an eventReactive element
          actionButton(
            inputId = "submit",
            label = "Submit column")
          
        ),
        # PLOT THE THTINGS
        box( uiOutput("text") ),
        tableOutput("zipped")
      )
    ),
    
    ########################
    # Second tab content
    ########################
    tabItem(
      tabName = "widgets",
      h2("Widgets tab content")
    )
  )
)