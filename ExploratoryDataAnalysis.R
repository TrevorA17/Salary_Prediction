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

# Measures of Frequency
gender_frequency <- table(employee_salary_data$Gender)
education_frequency <- table(employee_salary_data$Education_Level)
job_title_frequency <- table(employee_salary_data$Job_Title)

# Display frequency tables
print("Frequency of Gender:")
print(gender_frequency)
print("Frequency of Education Level:")
print(education_frequency)
print("Frequency of Job Title:")
print(job_title_frequency)

# Measures of Central Tendency
age_mean <- mean(employee_salary_data$Age)
age_median <- median(employee_salary_data$Age)
years_of_exp_mean <- mean(employee_salary_data$Years_of_Experience)
years_of_exp_median <- median(employee_salary_data$Years_of_Experience)
salary_mean <- mean(employee_salary_data$Salary)
salary_median <- median(employee_salary_data$Salary)

# Display measures of central tendency
print("Measures of Central Tendency:")
print(paste("Mean Age:", age_mean))
print(paste("Median Age:", age_median))
print(paste("Mean Years of Experience:", years_of_exp_mean))
print(paste("Median Years of Experience:", years_of_exp_median))
print(paste("Mean Salary:", salary_mean))
print(paste("Median Salary:", salary_median))

# Measures of Distribution
age_range <- range(employee_salary_data$Age)
years_of_exp_range <- range(employee_salary_data$Years_of_Experience)
salary_range <- range(employee_salary_data$Salary)
age_variance <- var(employee_salary_data$Age)
years_of_exp_variance <- var(employee_salary_data$Years_of_Experience)
salary_variance <- var(employee_salary_data$Salary)
age_sd <- sd(employee_salary_data$Age)
years_of_exp_sd <- sd(employee_salary_data$Years_of_Experience)
salary_sd <- sd(employee_salary_data$Salary)
age_quantiles <- quantile(employee_salary_data$Age)
years_of_exp_quantiles <- quantile(employee_salary_data$Years_of_Experience)
salary_quantiles <- quantile(employee_salary_data$Salary)

# Display measures of distribution
print("Measures of Distribution:")
print(paste("Age Range:", paste(age_range, collapse = " - ")))
print(paste("Years of Experience Range:", paste(years_of_exp_range, collapse = " - ")))
print(paste("Salary Range:", paste(salary_range, collapse = " - ")))
print(paste("Age Variance:", age_variance))
print(paste("Years of Experience Variance:", years_of_exp_variance))
print(paste("Salary Variance:", salary_variance))
print(paste("Age Standard Deviation:", age_sd))
print(paste("Years of Experience Standard Deviation:", years_of_exp_sd))
print(paste("Salary Standard Deviation:", salary_sd))
print("Age Quantiles:")
print(age_quantiles)
print("Years of Experience Quantiles:")
print(years_of_exp_quantiles)
print("Salary Quantiles:")
print(salary_quantiles)

# Measures of Relationship
correlation_matrix <- cor(employee_salary_data[c("Age", "Years_of_Experience", "Salary")])

# Display correlation matrix
print("Correlation Matrix:")
print(correlation_matrix)

