####Incomplete

ExecutionParse <- function(file="char") {
        setwd("~/Trading - GPC/Executions/Raw")
        data <- read.table(file, sep="\t", header=TRUE)
        sdata <- data[with(data,order(Symbol, Received)),]
        
        stocks <- unique(sdata$Symbol)
        count <- length(stocks)
        individual <- data.frame()
        for (i in 1:count) {
                individual[i] <- subset(sdata, Symbol == stocks[i])
                
        }
        
        write.table(sdata, "C:/Users/llau/Documents/Trading - GPC/Executions/Parsed/ParsedExecutions.txt", append=TRUE, quote=FALSE, sep="\t", row.names=FALSE)
        sdata

}