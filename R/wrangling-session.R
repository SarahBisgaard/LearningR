# Load up the packages
source(here::here("R/package_loading.R"))

#Briefly glimpse content of dataset. Kig på del af dataset
glimpse(NHANES)

#Check column names
colnames(NHANES)

#Look at contents
str(NHANES)
glimpse(NHANES)

#See summary
summary(NHANES)

#Look over the dataset documentation
?NHANES

#View selected columns (here Age)
select(NHANES, Age)

#Select more columns
select(NHANES, Age, Weight, BMI)

#Exclude a column
select(NHANES, -HeadCirc)

# All columns starting with "BP" --> noget med bogstaver "" undtagen når det er defineret f.eks. kolonnenavne, men det kan også virke med "" her
select(NHANES, starts_with("BP"))

# All columns ending with "Day"
select(NHANES, ends_with("Day"))

# All columns containing "AGE"
select(NHANES, contains("Age"))

#For help:
#?select_helpers

# Save the selected columns as a new data frame
# Recall the style guide for naming objects
nhanes_small <- select(NHANES, Age, Gender, Height,
                       Weight, BMI, Diabetes, DiabetesAge,
                       PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)

# View the new data frame
nhanes_small

## Renaming
# Rename all columns to snake case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

# Have a look at the data frame
nhanes_small

#Renaming specific columns
rename(nhanes_small, sex = gender) #nyt navn først, og det gamle der erstattes til sidst. Sker kun i console!
nhanes_small #Se data i console

nhanes_small <- rename(nhanes_small, sex = gender) #gemmer navneændringen
nhanes_small #Se data i console

## The pipe operator

# Without the pipe operator
colnames(nhanes_small)

# With the pipe operator (genvej: ctrl + shift + m)
nhanes_small %>% colnames()

#Styling (genvej: ctrl + shift + a)

# With the pipe operator with more functions (genvej: ctrl + shift + m)
nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

## Exercise 9.9
#Select three columns
nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

#rename
nhanes_small %>%
    select(diabetes_age) %>%
    rename(diabetes_diagnosis_age = diabetes_age)

#
nhanes_small %>%
    select(bmi, contains("Age"))

#
nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

##Filtering
# Filter for all females
nhanes_small %>%
    filter(sex == "female")

# Filter for all non-females
nhanes_small %>%
    filter(sex != "female")        #!= is not


# Participants with a BMI equal to 25
nhanes_small %>%
    filter(bmi == 25)

# Participants with a BMI greater or equal to 25
nhanes_small %>%
    filter(bmi >= 25)

# Participants with a BMI equal to 25 AND female (| (OR) & (AND))
nhanes_small %>%
    filter(bmi >= 25 & sex == "female")


# Participants with a BMI greater than 25 OR female (| (OR) & (AND))
nhanes_small %>%
    filter(bmi > 25 | sex == "female")



## Arranging the rows of your data by column

# Arranging by age in ascending order
nhanes_small %>%
    arrange(age)

# Arrange by sex in ascending order
nhanes_small %>%
    arrange(sex)

# Arrange by age in descending order
nhanes_small %>%
    arrange(desc(age))

# Arranging by sex, then age in ascending order
nhanes_small %>%
    arrange(sex, age)


# Arranging by descending sex, then age in ascending order
nhanes_small %>%
    arrange(desc(sex), age)


# Transform or add columns

#Højde i meter frem for centimeter
nhanes_small %>%
    mutate(height = height/100)


#Add an additional column with logged height values
nhanes_small %>%
    mutate(logged_height = log(height))


#transform and Add columns at the same time
nhanes_small %>%
    mutate(height = height/100,
           logged_height = log(height))

# New column based on how active participants are
nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

# Add and save the changes we made
nhanes_update <- nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height),
           highly_active = if_else(phys_active_days >= 5, "Yes", "No"))


str(nhanes_update)


##Summary statistics by group

# Maximum BMI
nhanes_small %>%
    summarise(max_bmi = max(bmi))

# Remove NA
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))

# How many NA are removed
nhanes_small %>%
    summarise(sum_na = sum(is.na(bmi)))

# Calculating 2 summary statistics
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))



## Exercise 9.16
# 1.
nhanes_small %>%
summarise(mean_weight = mean(weight, na.rm = TRUE),
          mean_age = mean(age, na.rm = TRUE))

# 2.
nhanes_small %>%
    summarise(max_height = max(height, na.rm = TRUE),
              min_height = min(height, na.rm = TRUE))

# 3.
nhanes_small %>%
    summarise(median_age = median(height, na.rm = TRUE),
              median_phys_active_days = median(phys_active_days, na.rm = TRUE))



