library(XML)

EquityList <- function(find="char") {
        defaultURL <- "http://finance.yahoo.com/lookup/stocks;_ylt=Ag4q2g5V8S91mFJi8bana4XWVax_;_ylu=X3oDMTFiM3RzMzF1BHBvcwMyBHNlYwN5ZmlTeW1ib2xMb29rdXBSZXN1bHRzBHNsawNzdG9ja3M-?s=trust&t=S&m=ALL&r="
        newURL <- gsub("trust", find, defaultURL)
        tbl <- readHTMLTable(newURL, stringAsFactors=FALSE)
        if (length(tbl) > 1) {
                dat <- tbl[[tail(grep("Symbol", tbl),1)]]
                finaldat <- dat[dat$Exchange == 'NYQ' | dat$Exchange == 'ASE'| dat$Exchange == 'PCX' | 
                                        dat$Exchange == 'NMS', ]
                list <- paste(finaldat$Symbol)
                list
        } else stop("none found")

        }