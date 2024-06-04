# Saving the Linear Regression model
saveRDS(lm_model, "./models/saved_lm_model.rds")

# Load the saved linear regression model
loaded_lm_model <- readRDS("./models/saved_lm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Age = as.numeric(30),
  Gender = factor("Male"),
  Education_Level = factor("Master's"),
  Job_Title = character(0),
  Years_of_Experience = as.numeric(10),
  Salary = as.numeric(0)  # Placeholder value for prediction
)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_lm_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
