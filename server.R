

function(input, output, session) {
  
  # COMPARE BAR: 
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- display
    if (input$Outcome != "All") {
      data <- data[data$Outcome == input$Outcome,]
    }
    if (input$Time != "All") {
      data <- data[data$Time == input$Time,]
    }
    if (input$Hypothesis != "All") {
      data <- data[data$Hypothesis == input$Hypothesis,]
    }
    if (input$Measure != "All") {
      data <- data[data$Measure == input$Measure,]
    }
    if (input$Adjusted != "All") {
      data <- data[data$Adjusted == input$Adjusted,]
    }
    if (input$Status != "All") {
      data <- data[data$Status == input$Status,]
    }
    data
  }))
  
  
  # PRINT BAR: 
  
  # Return the requested dataset
  datasetInput <- reactive({
    
    input$text
    
  })
  
  
  # Print object1
  output$view1 <- renderTable({
    dataset <- datasetInput()
    
    rep1data= get(paste(dataset,"_j",sep=""))
    
    print(rep1data)
    
  }, digits=5)
  
  # Print object2
  output$view2 <- renderTable({
    dataset <- datasetInput()
    
    rep2data= get(paste(dataset,"_A",sep=""))
    
    print(rep2data)
    
  }, digits=5)
  
  # Print object1 - object2
  output$view3 <- renderTable({
    dataset <- datasetInput()
    
    rep1data= get(paste(dataset,"_j",sep=""))
    rep2data= get(paste(dataset,"_A",sep=""))
    diff = rep1data-rep2data
    
    print(diff)
    
  }, digits=5)
  
}


