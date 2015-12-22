##Regression for San Francisco 49ers
library(ggplot2)

data <- function(){
        data_df[,-1:-2]
}

regress_plot <- function(predictorx, responsey, years){
        data_df <- data_df[,-1:-2]
        data_df <- data_df[data_df$Year>=as.numeric(years),]
        
        
        if (responsey=="wins"){
                qplot(data=data_df,x=as.numeric(data_df[,as.numeric(predictorx)]),y=as.numeric(Wins),color=Wins, 
                      main=paste("Analysis of the San Francisco 49ers Wins \n During the Given Years"), xlab="Predictor Variable", 
                        ylab="Wins", geom=c("point","smooth"),
                      method="lm")
        }
        else if (responsey=="losses"){
                qplot(data=data_df,x=as.numeric(data_df[,as.numeric(predictorx)]),y=as.numeric(Losses),color=Losses, 
                      main=paste("Analysis of the San Francisco 49ers Losses \n During the Given Years"), xlab="Predictor Variable", 
                      ylab="Losses", geom=c("point","smooth"),
                      method="lm")
        }
                
}

summa <- function(x, y, years){
        data_df <- data_df[,-1:-2]
        data_df <- data_df[data_df$Year>=as.numeric(years),]
        if (y=="wins"){
                line <- lm(as.numeric(Wins) ~ as.numeric(data_df[,as.numeric(x)]), data=data_df)
                print(summary(line))
        }
        else if (y=="losses"){
                line <- lm(as.numeric(Losses) ~ as.numeric(data_df[,as.numeric(x)]), data=data_df)
                print(summary(line))
        }
}

residual <- function(x, y, years){
        data_df <- data_df[,-1:-2]
        data_df <- data_df[data_df$Year>=as.numeric(years),]
        
        par(mfrow=c(1,2), mar=c(5,5,1,1))
        if (y=="wins"){
                line <- lm(as.numeric(Wins) ~ as.numeric(data_df[,as.numeric(x)]), data=data_df)
                plot(as.numeric(data_df[,as.numeric(x)]), resid(line), main="Residuals Scatterplot", xlab="Predictor Variable", col="red",
                     ylab="Residuals", pch=19)
                abline(h = 0, lty = 2)
                hist(resid(line), col="blue", xlab="Residual Value", main="Histogram of Residuals")
                
        }
        else if (y=="losses"){
                line <- lm(as.numeric(Losses) ~ as.numeric(data_df[,as.numeric(x)]), data=data_df)
                plot(as.numeric(data_df[,as.numeric(x)]), resid(line), main="Residuals Scatterplot", xlab="Predictor Variable", col="red",
                     ylab="Residuals", pch=19)
                abline(h = 0, lty = 2)
                hist(resid(line), col="blue", xlab="Residual Value", main="Histogram of Residuals")

        }
}

residual2 <- function(x, y, years){
        data_df <- data_df[,-1:-2]
        data_df <- data_df[data_df$Year>=as.numeric(years),]
        
        if (y=="wins"){
                line <- lm(as.numeric(Wins) ~ as.numeric(data_df[,as.numeric(x)]), data=data_df)
                qqnorm(rstandard(line), col="red")
                qqline(rstandard(line))
                
        }
        else if (y=="losses"){
                line <- lm(as.numeric(Losses) ~ as.numeric(data_df[,as.numeric(x)]), data=data_df)
                qqnorm(rstandard(line), col="red", pch=19)
                qqline(rstandard(line))
        }
}





shinyServer(
        function(input, output){
                output$data_table <- renderDataTable({data()})
                
                output$regression_plot <- renderPlot({regress_plot(input$Predictors, input$Response, input$Years)})
                
                output$Summary <- renderPrint({summa(input$Predictors, input$Response, input$Years)})
                
                output$residual_plot <- renderPlot({residual(input$Predictors, input$Response, input$Years)})
                        
                output$residual_plot2 <- renderPlot({residual2(input$Predictors, input$Response, input$Years)})
                
        })