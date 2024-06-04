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
