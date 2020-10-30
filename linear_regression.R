

# Linear Regression

# Importing the dataset
data = read.csv("50Startups.csv")

data$State <- as.factor(data$State)  

round(cor(data[,-4]), 2)


minimum <- apply(data[,-4],2,min) 
maximum <- apply(data[,-4],2,max) 
DataNorm <- scale(data[,-4],center=minimum,scale=(maximum-minimum))

DataNorm = cbind(as.data.frame(DataNorm), data$State) 

#Build Linear Model

linearMod <- lm(Profit ~ ., data=DataNorm)  # build linear regression model on full data

linearMod$coefficients

print(linearMod)

#Linear Regression 
summary(linearMod)  # model summary


y-pred = predict(linearMod,DataNorm)


mean((DataNorm$Profit - y_pred)^2)




