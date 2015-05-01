# The function reads the outcome-of-care-measures.csv file and returns a character 
# vector with the name of the 
# hospital that has the ranking specified by the num argument.
#  num argument can take values “best”, “worst”, or an integer

rankhospital <- function(state, outcome, num = "best"){
## Sample variable for testing
        #state <- "TX"
        #state <- "SC"
        #state <- "NC"
        #outcome <- "heart attack"
        #outcome <- "heart failure"
        #outcome <- "pneumonia"
        #num <- 5
        #num <- "worst"
        #num <- "best"

## Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", colClasses = "character")
        
## Check that state and outcome are valid
        valid_outcome <- c("heart attack", "heart failure", "pneumonia")
        valid_state <- state.abb
        if(is.na(match(state, valid_state))) {stop("invalid state")}
        if(is.na(match(outcome, valid_outcome))) {stop("invalid outcome")}
#####   Setting up variables to be used in look ups
        stcol <- 7      #state column
        hospNmCol <- 2     # hospital name column
# set column number of valid function argument as outcol for 
# subsetting the outcome data
        if(outcome == "heart attack"){
                outcol <- 11
        }           
        if(outcome == "heart failure"){
                outcol <- 17
        } 
        if(outcome == "pneumonia"){
                outcol <- 23
        }

## Return hospital name in that state with the given rank
        ## If the number given by num is larger than the number of hospitals in that 
        ## state, then the function should return NA.
        ## Hospitals that do not have data on a particular outcome should be excluded
        ## use the order function
# list of hospitals in the desired state, remove the NAs
hosp_list <- outcome_data[which(outcome_data[,stcol] == state), ]
hosp_list_clean <- hosp_list[!is.na(hosp_list[,outcol]),]
#hNamecol <- vector(mode = "numeric", length = 0)
#hNamecol <- hosp_list_clean[hospName]
#hRankcol <- vector(mode = "numeric", length = 0)
#hRankcol <- as.vector(hosp_list_clean[[outcol]])

#sorted <- hosp_list_clean[order(hosp_list_clean[,outcol]),]
#sorted
#dd <- as.numeric(hosp_list_clean[,outcol])
#dd[ order(-dd[,4], dd[,1]), ]
    
## build a new data frame with data in classes as needed.
data <- data.frame(Hospital.Name = character(), Rate = numeric(), Rank = integer(), row.names = NULL)
Hospital.Name <- as.vector(hosp_list_clean[[hospNmCol]])
data <- as.data.frame(cbind(Hospital.Name),"name")
Rate <- as.numeric(hosp_list_clean[[outcol]])
data <- cbind(data, Rate)
##  sort the data 
data <- data[order(data$Rate, data$Hospital.Name), ]
## add a Rank column
Rank <- as.numeric(1:length(Rate))
data <-cbind(data, Rank)
## Set values for best and worst arguments
output <- vector(mode = "character", length = 1)

        if(num == "best"){
                num <- 1     
                hospRank <- data[which(data$Rank == num), ]
                ## Output Hospital.Name
                output <- as.character(hospRank[[1]])
        }
        if(num == "worst"){
                num <- length(Rate)   
                hospRank <- data[which(data$Rank == num), ]
                ## Output Hospital.Name
                output <- as.character(hospRank[[1]])
        }

## Find Hospital.Name for Rank Argument (num)
        if(num <= length(Rate)){
                hospRank <- data[which(data$Rank == num), ]
                ## Output Hospital.Name
                output <- as.character(hospRank[[1]])    
        }
        if(num > length(Rate)){
                output <- as.character("NA")
        }
output
}
