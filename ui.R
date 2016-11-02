
navbarPage("Example Replication Dashboard",
           tabPanel("Compare",
                    fluidRow(
                      column(4,
                             selectInput("Outcome",
                                         "Outcome:",
                                         c("All",
                                           unique(as.character(display$Outcome))))
                      ),
                      column(4,
                             selectInput("Measure",
                                         "Measure:",
                                         c("All",
                                           unique(as.character(display$Measure))))
                      ),
                      column(4,
                             selectInput("Adjusted",
                                         "Adjusted:",
                                         c("All",
                                           unique(as.character(display$Adjusted))))
                      ),
                      column(4,
                             selectInput("Status",
                                         "Status:",
                                         c("All",
                                           unique(as.character(display$Status))))
                      )
                      
                    ),
                    
                    
                    # Create a new row for the table.
                    fluidRow(
                      DT::dataTableOutput("table")
                    )
           ),
           
           ########################
           tabPanel("Print",
                    # verbatimTextOutput("summary")
                    
                    
                    # Sidebar with search box to choose an object 
                    sidebarLayout(
                      sidebarPanel(
                        
                        textInput("text", label = h3("Display specific object"), 
                                  value = "prop.y")
                        
                      ),
                      
                      # Print object for each replicator as html table
                      mainPanel(
                        
                        h4("A:"),
                        tableOutput("view1"),
                        h4("B:"),
                        tableOutput("view2"),
                        h4("Difference:"),
                        tableOutput("view3")
                      )
                      
                    )
                    
                    
           ))
