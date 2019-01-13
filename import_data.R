import_data <- function(filepath, start_date, end_date) {
  data <- data.frame()
  
  # initialize connection to the file 
  con <- file(filepath, "r")
  
  # read the column names from the first line
  colNames <- as.list(strsplit(readLines(con, n = 1), split = ";")[[1]])
  
  while (TRUE) {
    # read lines from file in chucks of 1000
    line <- readLines(con, n = 1000)
    if (length(line) == 0) {
      break
    }
    
    # create a data frame from the read data
    # if the current data contains dates between the specified start and end date save it
    textCon <- textConnection(line)
    data_cur <- read.table(textCon, sep = ";", col.names = colNames, na.strings = "?")
    data_cur$Date <- as.Date(data_cur$Date, format = '%d/%m/%Y')
    data <- rbind(data, data_cur[data_cur$Date >= start_date & data_cur$Date <= end_date, ])
    close(textCon)
  }
  
  close(con)
  
  # add a combined date and time variable
  data$datetime <- with(data, as.POSIXct(paste(Date, Time)))
  
  # return the resulting data frame
  data
}