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
