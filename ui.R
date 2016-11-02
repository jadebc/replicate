
navbarPage("WASH Benefits Kenya Replication Dashboard",
           tabPanel("Compare",
                    fluidRow(
                      column(4,
                             selectInput("Outcome",
                                         "Outcome:",
                                         c("All",
                                           unique(as.character(display$Outcome))))
                      ),
                      column(4,
                             selectInput("Time",
                                         "Time:",
                                         c("All",
                                           unique(as.character(display$Time))))
                      ),
                      column(4,
                             selectInput("Hypothesis",
                                         "Hypothesis:",
                                         c("All",
                                           unique(as.character(display$Hypothesis))))
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
                                  value = "wast_t2_h3_pr_adj")
                        
                      ),
                      
                      # Print object for each replicator as html table
                      mainPanel(
                        
                        h4("Jade:"),
                        tableOutput("view1"),
                        h4("Andrew:"),
                        tableOutput("view2"),
                        h4("Difference:"),
                        tableOutput("view3")
                      )
                      
                    )
                    
                    
           ))
