pollutantmean <- function(directory, pollutant, id) {
    files <- file.path(directory, list.files(directory, "*.csv"))
    files_df  <- lapply(files, read.csv)
    df <- do.call("rbind", files_df[id])
    avg <- mean(df[pollutant][,1], na.rm = T)
    return(avg)
}
    
