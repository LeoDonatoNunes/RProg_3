### Load package
require(data.table)

### Create pseudo data
data <- data.table(id     = 1:10,
                   height = rnorm(10, mean = 182, sd = 20),
                   weight = rnorm(10, mean = 160, sd = 10),
                   color  = rep(c('blue', 'gold'), times = 5))

### Reclass all columns
data <- data[, lapply(.SD, as.character)]

### Search for columns to be reclassed
index <- grep('(id)|(height)|(weight)', names(data))

### data frame method
df <- data.frame(data)
df[, index] <- as.numeric(unlist(df[, index]))

### Failed attempt to reclass columns used the data.table method
data <- data[, lapply(index, as.character), with = F]


## solution?
data[, names(data)[index] := lapply(.SD, as.character) , .SDcols = index ]


############# Example
dd <- data.frame(b = factor(c("Hi", "Med", "Hi", "Low"), 
                            levels = c("Low", "Med", "Hi"), ordered = TRUE),
                 x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9),
                 z = c(1, 1, 1, 2))
dd
dd[ order(-dd[,4], dd[,1]), ]
dd[ order(-dd[,4]), ]
dd[ order(dd[,1]), ]
dd[ order(dd[,3])]
dd[order(x,-y,z),]
str(dd)

(ii <- order(x <- c(1,1,3:1,1:4,3), y <- c(9,9:1), z <- c(2,1:9)))
## 6  5  2  1  7  4 10  8  3  9
rbind(x, y, z)[,ii] # shows the reordering (ties via 2nd & 3rd arg)
jj <- order(x <- c(1,1,3:1,1:4,3), y <- c(9,9:1), z <- c(2,1:9))
jj


set.seed(1)  # reproducible example:
d4 <- data.frame(x = round(   rnorm(100)), y = round(10*runif(100)),
                 z = round( 8*rnorm(100)), u = round(50*runif(100)))
(d4s <- d4[ do.call(order, d4), ])
(i <- which(diff(d4s[, 3]) == 0))
#   in 2 places, needed 3 cols to break ties:
d4s[ rbind(i, i+1), ]

CustomData <- data.frame(Value1=rnorm(100,1,2), Value2=rnorm(100,2,3),
                         Value3=rexp(100,5), Value4=rexp(100,2))

CD.sorted <- apply(CustomData,2,sort,decreasing=F)
CustomData[do.call(order, as.list(CustomData)),]
