# Saving the Linear Regression model
saveRDS(model_cv, "./models/saved_lm_model.rds")

# Load the saved linear regression model
loaded_lm_model <- readRDS("./models/saved_lm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Age = as.numeric(30),
  Gender = factor("Female"),
  Education_Level = factor("PhD"),
  Job_Title = "Software Engineer",
  Years_of_Experience = as.numeric(10),
  Salary = as.numeric(1000)
)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_lm_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
