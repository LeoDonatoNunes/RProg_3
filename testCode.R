state <- "TX"
outcome <- "heart attack"

## Read outcome data
outcome_data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", colClasses = "character")

## Check that state and outcome are valid
valid_outcome <- c("heart attack", "heart failure", "pneumonia")
valid_state <- state.abb

if(is.na(match(state, valid_state))) {stop("invalid state")}

if(is.na(match(outcome, valid_outcome))) {stop("invalid outcome")}

#####   Setting up variables to be used in look ups
stcol <- 7      #state column
hnmcol <- 2     # hospital name column
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
print(c("outcol", outcol))
## Return hospital name in desired State with lowest 30-day mortality rate

# list of hospitals in the desired state
hosp_list <- outcome_data[which(outcome_data[,stcol] == state), ]
View(hosp_list)

# determine the minimum value of the desired outcome 
# and find all instances of that minimum value

# min_value <- min(as.numeric(hosp_list[,outcol]), na.rm = TRUE)

min_value <- min(as.numeric(hosp_list[,outcol]), na.rm = TRUE)

print(c("min value",min_value))

hospital <- hosp_list[which(hosp_list[,outcol] == min_value), ]
View(hospital)
hospital[hnmcol]
x <- hosp_list[outcol]
x
## rate
