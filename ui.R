###################
# ui.R
# 
# Initializes the ui. 
# Used to load in your header, sidebar, and body components.
###################

ui <- fluidPage(
    theme = bslib::bs_theme(bootswatch = "journal"),
  titlePanel("plagiaRized"),
  h6(em("A quantitative and visual file comparison tool")),
  br(),
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected == 'panel1'", 
      h3("Submission and selection tab"),
      br(),
      "Please upload the files that you would like to compare. Once you have
      processed the relevant documents, you can visually compare the files in the 
      next tab by selecting a particular row in the generated table on the right.",
      br(), br(),
      "This app will only accept files with extensions .rmd, .qmd, and .txt. 
      Additional support for other formats will be implemented in other releases.",
      column(12,
       fileInput("upload", "",
           accept = c(".rmd", ".qmd", ".txt"), 
           multiple = TRUE,),
           actionButton("run", "Run analyses", icon = icon("check"),
                                 style = "color: #fff; background-color: #27ae60; border-color: #fff"),
                                 br(), hr(), align = "center")
      ),
        conditionalPanel(condition = "input.tabselected == 'panel2'", 
                                   h3("Visual comparison tab"),
                                   br(),
                                   "Please select the documents that need 
                                       to be compared in this tab, please click in the relevant
                                       lines displayed in the table presented under the stats tab.",
                                       br(), br(), hr()
                        ),
                       em("Author: Cristian Roman-Palacios. 
                        Assistant professor of practice. 
                        University of Arizona, Tucson, AZ.",
                        a("Contact.", href="https://cromanpa94.github.io/cromanpa/", target="_blank"), 
                        "V1.0. 2022.")
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
