complete <- function(directory, id=1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  my_dat2 <- data.frame()
  nobs <- 0
  files_full <- list.files (directory, full.names = TRUE)
  
  for (i in id){
    my_dat2 <- rbind (my_dat2, read.csv(files_full[i]))
  }
  completedat <- my_dat2[complete.cases(my_dat2)==TRUE,]
  
  for (j in 1: length(id)){
    nobs[j] <- nrow(completedat[completedat$ID==id[j],])
  }
  
  datasub2 <- cbind(id, nobs)
  datasub2 <- as.data.frame(datasub2)
  
  return(datasub2)
  
}

#tests
complete("specdata", 25:26)
complete("specdata", 3)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)