## Read the outcome of care file and plot a histogram of 30 day death rates 
## from heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)
ncol(outcome)
names(outcome)

## plot histogram
outcome[, 11] <- as.numeric(outcome[, 11])  ## coerces to numeric since we read it as character
hist(outcome[, 11])  ## You may get a warning about NAs being introduced; that is okay