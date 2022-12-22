###################
# server.R
# 
# For all your server needs 
###################
server <- function(input, output, session) {

    #Submit files
    observeEvent(input$submit, {

    files <- unzip(input$upload$datapath, list = TRUE, exdir = getwd())

    targetFiles <- files$Name
    #targetFilesPath <- files$datapath

    extFiles <-  grep(input$Fileextension, targetFiles, ignore.case = TRUE)
    targetFiles <- targetFiles[extFiles]

    if(!is.null(input$FilePattern)){
      selected <-  grep(input$FilePattern, targetFiles, ignore.case = TRUE)
      targetFiles <- targetFiles[selected]
    }
    readLines(paste0("./",targetFiles[1]),)

    output$zipped <- renderTable({


      comp <- expand.grid.unique(x = targetFiles, y = targetFiles)
      #differences <- sapply(1:nrow(comp), function(x){
      #    length(ses(readLines(comp[x,1]), readLines(comp[x,2])))
      #})
    #comp <- cbind.data.frame(comp, differences)
    })

      output$text <- renderUI({paste(targetFiles, collapse = ", ") })

  })

  
}
