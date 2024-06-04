# Load dataset
employee_salary_data <- read.csv("data/Salary_Data.csv", colClasses = c(
  Age = "numeric",
  Gender = "factor",
  Education_Level = "factor",
  Job_Title = "character",
  Years_of_Experience = "numeric",
  Salary = "numeric"
))

# Display the structure of the dataset
str(employee_salary_data)

# View the first few rows of the dataset
head(employee_salary_data)

# View the dataset in a separate viewer window
View(employee_salary_data)

# Check for missing values
missing_values <- sapply(employee_salary_data, function(x) sum(is.na(x)))
print(missing_values)