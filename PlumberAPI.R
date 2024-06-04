# Load the saved linear regression model
loaded_lm_model <- readRDS("./models/saved_lm_model.rds")

#* @apiTitle Salary Prediction API
#* @apiDescription Used to predict salaries based on input features.

#* @param Age Age of the employee
#* @param Gender Gender of the employee (Male/Female)
#* @param Education_Level Education level of the employee (e.g., Bachelor's, Master's, PhD)
#* @param Job_Title Job title of the employee
#* @param Years_of_Experience Years of experience of the employee
#* @param Salary Placeholder value for prediction (will be overwritten)

#* @post /predict_salary
predict_salary <- function(Age, Gender, Education_Level, Job_Title, Years_of_Experience, Salary) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    Age = as.numeric(Age),
    Gender = factor(Gender),
    Education_Level = factor(Education_Level),
    Job_Title = Job_Title,
    Years_of_Experience = as.numeric(Years_of_Experience),
    Salary = as.numeric(Salary)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_lm_model, newdata = to_be_predicted)
  
  # Return the prediction
  return(prediction)
}
