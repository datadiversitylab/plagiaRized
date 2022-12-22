###################
# server.R
# 
# For all your server needs 
###################
server <- function(input, output, session) {
    #Submit files
    observeEvent(input$run, {

    files <- input$upload$datapath
    comp <- expand.grid.unique(x= files, y =files)
    comp2 <- expand.grid.unique(x = input$upload$name, y = input$upload$name)

    differences <- sapply(1:nrow(comp), function(x){
    length(ses(readLines(comp[x,1]), readLines(comp[x,2])))
    })

    updateSelectizeInput(session, 
       "compare", 
       label = "Select",
       choices = input$upload$name,
       options = list(maxItems = 2)
       )

    comp <- cbind.data.frame(comp2, differences)
    output$comparison <- DT::renderDataTable({comp})

    output$diffobj_element <- renderUI({
      HTML(
        as.character(
          diffPrint(
            1:5, 2:6,
            format = "html",
            style = list(html.output="diff.w.style")
              )
            )
          )
        })
  })
}
