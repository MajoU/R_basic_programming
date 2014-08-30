library(data.table)

corr <- function(directory, threshold = 0) {
    files <- file.path(directory, list.files(directory, "*.csv"))
    files_id <- lapply(files, function(x) fread(x, na.strings = "NA"))
    na_ex <- lapply(files_id, na.omit)
    filter <- lapply(seq_along(na_ex), function(i) nrow(na_ex[[i]]) > threshold)
    final_df <- na_ex[unlist(filter)]
    cor_vector <- sapply(seq_along(final_df), function(i) cor(final_df[[i]]$sulfate, final_df[[i]]$nitrate))
    return(cor_vector)

}
