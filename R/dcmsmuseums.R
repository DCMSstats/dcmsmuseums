# DCMS Museums and Gallries Convertor
#
# This package converts the DCMS Museums and galleries monthly visits stats excel file into a
# CSV file for upload to GOV.UK.

dcmsmuseums <- function(inputfile,outputfile) {

  # Read in Excel spreadsheet
  datain=readxl::read_excel(inputfile,
                            sheet="Data", col_names = FALSE)

  xextent=0

  # Find X extent of data
  for(xcol in names(datain)){
    xextent=xextent+1
    if(typeof(datain[[xcol]])=='double') break
  }

  # Extract the bit with the data actually in it
  data=datain[,0:(xextent-1)]

  # Rename the columns based on the years
  y1=04
  y2=05

  # Rename columns for referencing and debugging - not important for output
  for(i in 2:dim(data)[2]){
    colnames(data)[i] <- paste0("y",stringr::str_pad(y1,2,pad="0"),stringr::str_pad(y2,2,pad="0"))
    y1=y1+1
    y2=y2+1
  }

  # Create months array
  months=c(04,05,06,07,08,09,10,11,12,01,02,03)

  # Setup output data frame format
  output=data.frame(museum=character(),year=integer(),month=integer(),visits=integer())

  # Loop through every row
  for(i in 1:length(data$X0)){
    if(is.na(data$X0[i])==FALSE){
      # Find where month is equal to april and locate museum name in cell above it
      if(data$X0[i]=="April"){
        # Set up initial years
        years=c(rep(2004,8),rep(2005,4))
        # Loop across each museum's individual table and add to the dataframe
        for(j in 2:dim(data)[2]){
          outj=data.frame(data$X0[i-1],years,months,data[i:(i+11),j])
          colnames(outj) <- c("museum","year","month","visits")
          output=rbind(output,outj)
          years=years+1
        }
      }
    }
  }

  write.csv(output,file=outputfile,row.names=FALSE)
}
