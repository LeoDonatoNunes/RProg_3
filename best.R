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
        outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        valid_outcome <- c("heart attack", "heart failure", "pneumonia")
        valid_state <- state.abb

        if(is.na(match(state, valid_state))) {stop("test message for invalid state")}

        if(is.na(match(outcome, valid_outcome))) {stop("test message for invalid outcome")}

        ## where i left off *************************************************
## Return hospital name in that state with lowest 30-day death
## rate
}
