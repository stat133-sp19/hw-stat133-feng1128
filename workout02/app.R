library(shiny)
library(ggplot2)
library(dplyr)

# Define UI for application that visualize the saving/investing scenarios
ui <- fluidPage(
   
   # Application title
   titlePanel("Saving Money"),
   
   fluidRow(
     column(4,sliderInput("amount",
                     "Initial Amount",
                     min = 0,
                     max = 100000,
                     value = 1000,
                     pre = '$',
                     sep = ",",
                     animate = TRUE,
                     step = 500
                     )),
         
    column(4,sliderInput("rate",
                     "Return Rate (in %)",
                     min = 0,
                     max = 20,
                     value = 5,
                     step = 0.1
                     )),
         
    column(4,sliderInput("years",
                     "Years",
                     min = 0,
                     max = 50,
                     value = 20,
                     step = 1
                     ))
    ),
    
    fluidRow(column(4,sliderInput("contrib",
                     "Annual Contribution",
                     min = 0,
                     max = 50000,
                     value = 2000,
                     pre = '$',
                     sep = ",",
                     animate = TRUE,
                     step = 500
                     )),
         
    column(4,sliderInput("growth",
                     "Growth Rate (in %)",
                     min = 0,
                     max = 20,
                     value = 2,
                     step = 0.1
                     )),
         
    column(4,selectInput("facet",
                     "facet?",
                     choices = c("Yes","No"),
                     selected = "No"))
         
      ),
      
    # Show a plot of the generated distribution
    mainPanel(
         plotOutput("plot",
                    width = 900,
                    height = 600),
         verbatimTextOutput("balance")
         )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$plot <- renderPlot({
     #set the input
     amount<-input$amount
     rate<-(input$rate)/100
     contrib<-input$contrib
     growth<-(input$growth)/100
     
     #mode 1
     ab1<-rep(0,(input$years + 1))
     for(i in 1:(input$years + 1)){
       ab1[i]<- amount * (1 + rate) ^ (i - 1)
     }

     #mode 2
     ab2<-rep(0,(input$years + 1))
     for(i in 1:(input$years + 1)){
       ab2[i]<- amount * (1 + rate) ^ (i - 1) + contrib * (((1 + rate) ^ (i-1) - 1) / rate)
     }
     
     #mode 3
     ab3<-rep(0,(input$years + 1))
     for(i in 1:(input$years + 1)){
       ab3[i]<- amount * (1 + rate) ^ (i - 1) + contrib * (((1 + rate)^ (i-1) - (1 + growth)^ (i-1)) / (rate - growth))
     }
     
     #create a data frame called modalities, containing the annual balances in each modality
     year<-0:input$years
     modalities<-data.frame(year=year, 
                            no_contrib=ab1, 
                            fixed_contrib=ab2, 
                            growing_contrib=ab3, 
                            stringsAsFactors = FALSE)
     
     modalities1<-data.frame(year=rep(year,3),
                             type=rep(c("no_contrib","fixed_contrib","growing_contrib"),each=length(year)),
                             value=c(ab1,ab2,ab3), 
                             stringsAsFactors = FALSE)
     
    #make one graph with the data obtained for each savings modality
    gg <- ggplot(modalities,aes(x=year))+
        geom_line(aes(y=no_contrib, color="no_contrib"))+
        geom_line(aes(y=fixed_contrib, color="fixed_contrib"))+
        geom_line(aes(y=growing_contrib, color="growing_contrib"))+
        geom_point(aes(y=no_contrib, color="no_contrib",shape = "."))+
        geom_point(aes(y=fixed_contrib, color="fixed_contrib",shape = "."))+
        geom_point(aes(y=growing_contrib, color="growing_contrib",shape = "."))+
        xlab("Year")+
        ylab("Growth of Investments")+
        ggtitle("Timeline Graph")
    
    #decide whether to facet or not
    if(input$facet=="No"){
      gg
      }
    else{
      ggplot(modalities1,aes(x=year,y=value))+
        geom_line(aes(color=type))+
        geom_point(aes(shape = ".", color=type))+
        geom_area(aes(fill=type,stat ="bin", alpha=0.5))+
        xlab("Year")+
        ylab("Growth of Investments")+
        ggtitle("Timeline Graph")+
        facet_wrap(~type)
      }
   })
   
  output$balance <- renderPrint({
    #set the input
    amount<-input$amount
    rate<-(input$rate)/100
    contrib<-input$contrib
    growth<-(input$growth)/100
    
    #mode 1
    ab1<-rep(0,(input$years + 1))
    for(i in 1:(input$years + 1)){
      ab1[i]<- amount * (1 + rate) ^ (i - 1)
    }
    
    #mode 2
    ab2<-rep(0,(input$years + 1))
    for(i in 1:(input$years + 1)){
      ab2[i]<- amount * (1 + rate) ^ (i - 1) + contrib * (((1 + rate) ^ (i-1) - 1) / rate)
    }
    
    #mode 3
    ab3<-rep(0,(input$years + 1))
    for(i in 1:(input$years + 1)){
      ab3[i]<- amount * (1 + rate) ^ (i - 1) + contrib * (((1 + rate)^ (i-1) - (1 + growth)^ (i-1)) / (rate - growth))
    }
    
    #create a data frame called modalities, containing the annual balances in each modality
    year<-0: input$years
    modalities<-data.frame(year=year, no_contrib=ab1, fixed_contrib=ab2, growing_contrib=ab3, stringsAsFactors = FALSE)
    modalities
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

