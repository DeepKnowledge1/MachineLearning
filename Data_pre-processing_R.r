


# load your data

dataset = read.csv("Data.csv")

head(dataset)
dim(dataset)


is.na(dataset)

#sum and the percentage of missings in your dataset 
sum(is.na(dataset))
mean(is.na(dataset))

#remove the missings
d = na.omit(dataset)



# this is not a good solution

# replace Missing with mean, or any value

dataset$Age = ifelse(is.na(dataset$Age),
                ave(dataset$Age,FUN = function(x) {sum(x,na.rm = TRUE)})
                ,dataset$Age)

# mean
dataset$Age = ifelse(is.na(dataset$Age),
                mean(dataset$Age, na.rm=TRUE)
                ,dataset$Age)

# Sum
dataset$Age = ifelse(is.na(dataset$Age),
                sum(dataset$Age, na.rm=TRUE)
                ,dataset$Age)
# max 
dataset$Age = ifelse(is.na(dataset$Age),
                max(dataset$Age, na.rm=TRUE)
                ,dataset$Age)

# min 

dataset$Age = ifelse(is.na(dataset$Age),
                min(dataset$Age, na.rm=TRUE)
                ,dataset$Age)



##################

dataset = read.csv("Data.csv")
index = which(is.na(dataset$Age))

m = mean(dataset$Age,na.rm =TRUE)

dataset$Age[index] = m

index = which(is.na(dataset$Salary))



M= mean(dataset$Salary,na.rm = TRUE)

dataset$Salary[index] = M

# Scale features

# Function to do it for each feature (col)
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

#The code for each of the columns is the following:
dataset$Age <- normalize(dataset$Age)
dataset$Salary<-normalize(dataset$Salary)





