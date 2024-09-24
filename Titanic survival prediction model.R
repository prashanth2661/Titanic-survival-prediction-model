install.packages(c("dplyr", "caret", "e1071"))
library(dplyr)
library(caret)
library(e1071)

data <- read.csv("C:/Users/prash/OneDrive/Desktop/CODSOFT/Data science/Titanic-Dataset.csv")

data$Age[is.na(data$Age)] <- median(data$Age, na.rm = TRUE)
data$Embarked[is.na(data$Embarked)] <- 'S'
data$Fare[is.na(data$Fare)] <- median(data$Fare, na.rm = TRUE)

data$Sex <- as.numeric(data$Sex == "male")
data$Embarked <- as.numeric(factor(data$Embarked, levels = c("C", "Q", "S")))

data$FamilySize <- data$SibSp + data$Parch + 1
data$IsAlone <- ifelse(data$FamilySize > 1, 0, 1)

data <- na.omit(data)

set.seed(42)
trainIndex <- createDataPartition(data$Survived, p = 0.8, list = FALSE)
trainSet <- data[trainIndex, ]
valSet <- data[-trainIndex, ]

model <- train(Survived ~ Pclass + Age + Fare + FamilySize + IsAlone + Sex + Embarked, 
               data = trainSet, method = "glm", family = binomial)

predictions <- predict(model, valSet)
accuracy <- mean(predictions == valSet$Survived)
print(paste("Prediction Accuracy:", round(accuracy * 100, 2), "%"))
