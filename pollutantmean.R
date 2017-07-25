pollutantmean <- function (directory, pollutant, id=1:332 ){
  #directory is a char vector of length 1 indicating the location of the CSV files
  #polluntant is char vector of length 1 indicating the name of the pollutant
  #id is an integer vector indicating the monitor ID numbers to be used
  #Return the mean of the pollutant across all monitors list in the id vector
  
  my_dat <- data.frame()
  files_full <- list.files (directory, full.names = TRUE)
  
  for (i in id){
    my_dat <- rbind (my_dat, read.csv(files_full[i]))
  }
  
  datasub <- my_dat[ , pollutant]
  print(mean(datasub, na.rm = TRUE))
}

#test
pollutantmean("specdata", "nitrate", 1:70)