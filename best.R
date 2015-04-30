##      The best function takes two arguments: 
##      the 2-character abbreviated name of a state and an outcome name
############# Requirement 1
##      It reads the outcome-of-care-measures.csv file and returns 
##      a character vector with the name of the hospital that has the lowest
##      30-day mortality for the specified outcome in that state.
##      Excludes hospitals that do not have data on the specified outcome.
##      Outcomes are: “heart attack”, “heart failure”, or “pneumonia”
##      Ties are ranked by alphabetical order, displaying the first in the list

########### Requirement 2
##      This function also checks validity of the arguments:  
##
##      If an invalid state value is passed to best, the function should 
##      throw an error via the stop function with the exact message “invalid state”. 
##
##      If an invalid outcome value is passed to best, the function should 
##      throw an error via the stop function with the exact message “invalid outcome”.


best <- function(state, outcome) {
        ## Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", colClasses = "character")
        
        ## Check that state and outcome are valid
        valid_outcome <- c("heart attack", "heart failure", "pneumonia")
        valid_state <- state.abb

        if(is.na(match(state, valid_state))) {stop("invalid state")}

        if(is.na(match(outcome, valid_outcome))) {stop("invalid outcome")}

#####   Setting up variables to be used in look ups
        stcol <- 7      #state column
        hospName <- 2     # hospital name column
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
## Return hospital name in desired State with lowest 30-day mortality rate

# list of hospitals in the desired state
        hosp_list <- outcome_data[which(outcome_data[,stcol] == state), ]

# determine the minimum value of the desired outcome 
# and find all instances of that minimum value
        
# min_value <- min(as.numeric(hosp_list[,outcol]), na.rm = TRUE)

min_value <- min(as.numeric(hosp_list[,outcol]), na.rm = TRUE)

hospital <- hosp_list[which(hosp_list[,outcol] == min_value), ]
output <- vector(mode ="character", length = 1)
output <- hospital[[hospName]]

## rate
}
