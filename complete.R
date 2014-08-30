library(plyr)
library(data.table)

complete <- function(directory, id) {
    files <- file.path(directory, list.files(directory, "*.csv"))
    files_id <- lapply(files[id], fread)
    sum_NA <- ldply(files_id, function(x) sum(complete.cases(x)))
    df <- cbind(id, nobs = sum_NA[,1])
    return(df)
    

}
