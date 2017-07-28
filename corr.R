corr <- function(directory, threshold=0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  #Combine all file dir in one data frame files_full
  files_full <- list.files (directory, full.names = TRUE)
  
  #run complete function to store id and nobs in complete_table
  complete_table <- complete("specdata")
  
  # store id's of dataset that are above the threshold
  id <- complete_table$id[complete_table$nobs > threshold]
  
  #read data 1 file at a time and store the correlation of sulfate and nitrate in var correlation
  correlation <- rep(0, length(id))
  k <- 1
  
  for (j in id ){
    current_file <- read.csv(files_full[j], header=T, sep=",")
    correlation[k] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    k <- k +1
  }
  
  return(correlation)
}

#tests
cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 500)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
cr <- corr("specdata")
summary(cr)
length(cr)
