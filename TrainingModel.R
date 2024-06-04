library(caret)

set.seed(42)  # For reproducibility

train_indices <- sample(1:nrow(employee_salary_data_clean), 0.8 * nrow(employee_salary_data_clean))
train_data <- employee_salary_data_clean[train_indices, ]
test_data <- employee_salary_data_clean[-train_indices, ]

dim(train_data)
dim(test_data)
