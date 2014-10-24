

ExecutionParse <- function(file="char") {
        setwd("~/Trading - GPC/Executions/Raw")
        path <- "C:/Users/llau/Documents/Trading - GPC/Executions/Parsed/"
        full_path <- paste(path, file, sep="")
        data <- read.table(file, sep="\t", header=TRUE)
        sdata <- data[with(data,order(Symbol, Received)),]
        write.table(sdata, full_path, append=TRUE, quote=FALSE, sep="\t", row.names=FALSE)
        sdata

}