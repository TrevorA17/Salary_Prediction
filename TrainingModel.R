library(caret)

set.seed(42)  # For reproducibility
#data splitting
train_indices <- sample(1:nrow(employee_salary_data_clean), 0.8 * nrow(employee_salary_data_clean))
train_data <- employee_salary_data_clean[train_indices, ]
test_data <- employee_salary_data_clean[-train_indices, ]

dim(train_data)
dim(test_data)

#Bootstrapping
library(boot)
n_bootstraps <- 1000
bootstrap_scores <- numeric(n_bootstraps)
for (i in 1:n_bootstraps) {
  boot_indices <- sample(1:nrow(train_data), replace = TRUE)
  boot_train_data <- train_data[boot_indices, ]
  model <- lm(Salary ~ ., data = boot_train_data)
  bootstrap_scores[i] <- summary(model)$r.squared
}
average_bootstrap_score <- mean(bootstrap_scores)
print(paste("Average bootstrap score:", round(average_bootstrap_score, 4)))

library(caret)  # For cross-validation
model_cv <- train(Salary ~ ., data = train_data, method = "lm",
                  trControl = trainControl(method = "cv", number = 5))
cv_scores <- model_cv$results$RMSE
print(paste("Cross-validation scores:", cv_scores))
print(paste("Mean cross-validation RMSE:", mean(cv_scores)))

print(model_cv)

# Model Training

# Split the data into features (X) and target (y)
X <- employee_salary_data_clean[, c("Age", "Gender", "Education_Level", "Job_Title", "Years_of_Experience")]
y <- employee_salary_data_clean$Salary

# Encode categorical variables (Gender and Education_Level)
X$Gender <- as.numeric(X$Gender == "Male")
X$Education_Level <- as.numeric(X$Education_Level)

# Model training using Linear Regression
lm_model <- lm(y ~ ., data = X)
print("Linear Regression Model:")
print(lm_model)

# Model training using Random Forest Regression
library(randomForest)
rf_model <- randomForest(y ~ ., data = X)
print("Random Forest Regression Model:")
print(rf_model)

# Model training using Support Vector Regression
library(e1071)
svm_model <- svm(y ~ ., data = X, kernel = "radial")
print("Support Vector Regression Model:")
print(svm_model)
