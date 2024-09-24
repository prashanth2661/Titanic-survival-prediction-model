Titanic Survival Prediction
This project aims to predict whether a passenger on the Titanic survived or not using a logistic regression model. The dataset used for this project contains information about individual passengers, such as their age, gender, ticket class, fare, cabin, and whether or not they survived.

Table of Contents
Installation
Usage
Data Preprocessing
Feature Engineering
Model Building
Prediction and Evaluation
Contributing
License
Installation
To run this project, you need to have R installed on your system. Additionally, you need to install the following R packages:

R

install.packages(c("dplyr", "caret", "e1071"))
AI-generated code. Review and use carefully. More info on FAQ.
Usage
Clone this repository to your local machine.
Set the path to the Titanic dataset in the code.
Run the R script to preprocess the data, build the model, and evaluate its performance.
Data Preprocessing
The data preprocessing steps include:

Filling missing values in the Age, Embarked, and Fare columns.
Converting categorical variables (Sex and Embarked) to numeric.
Handling missing values in the Survived column by removing rows with missing values.
Feature Engineering
New features are created to improve the model:

FamilySize: The total number of family members on board (SibSp + Parch + 1).
IsAlone: A binary feature indicating whether the passenger is alone (1) or not (0).
Model Building
A logistic regression model is built using the caret package. The model is trained on 80% of the data and validated on the remaining 20%.

R

set.seed(42)
trainIndex <- createDataPartition(data$Survived, p = 0.8, list = FALSE)
trainSet <- data[trainIndex, ]
valSet <- data[-trainIndex, ]

model <- train(Survived ~ Pclass + Age + Fare + FamilySize + IsAlone + Sex + Embarked, 
               data = trainSet, method = "glm", family = binomial)
AI-generated code. Review and use carefully. More info on FAQ.
Prediction and Evaluation
The model makes predictions on the validation set, and the accuracy of the predictions is calculated.

R

predictions <- predict(model, valSet)
accuracy <- mean(predictions == valSet$Survived)
print(paste("Prediction Accuracy:", round(accuracy * 100, 2), "%"))
AI-generated code. Review and use carefully. More info on FAQ.
Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

License
This project is licensed under the MIT License.
