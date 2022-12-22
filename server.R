###################
# server.R
# 
# For all your server needs 
###################
server <- function(input, output, session) {
    #Submit files
    observeEvent(input$run, {

    files <- input$upload$datapath
    comp <- compOr <- expand.grid.unique(x= files, y =files)
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
    output$comparison <- DT::renderDataTable(comp,
                      selection = 'single')

  output$diffobj_element <- renderDiffr({
    x = input$comparison_rows_selected
    x <- if(is.null(x)){1}else{x}
    diffr::diffr(compOr[x,1], compOr[x,2],
    before = comp2[x,1], after = comp2[x,1]
      )
    )
  })


  })
}
