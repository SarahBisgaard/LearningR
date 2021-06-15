source(here::here("R/package_loading.R"))    #here::here gå til begyndelsen af mappen "learningR" og led efter den pågældende mappe. Skifter startpunkt i mappesystemet


#setwd() --> bad practice :)


# Basics of R -------------------------------------------------------------

weight_kilos <- 100 #indsæt 100 i en vektor. Vær beskrivende, brug små bogstaver og _ for mellemrum
weight_kilos

c("a", "b", "c")
c(TRUE, FALSE)
c(1, 2, 4)
factor(c("high", "medium", "low")) #numre; 1, 3, 2

head(CO2, 10) #tallet efter komma er hvor mange rækker der vises
colnames(CO2) #navne på kolonner
str(CO2)
summary(CO2)
colnames(CO2)

# Object names
day_one               #Use lowercase letters and use _ as space
#tuesday <- FALSE      #t betyder true og det giver ikke mening at sætte falsk ind i sandt
descrptive <- 9                #c er combined, så det er allerede en funktion

# Spacing
x[, 1]                #use space after comma
x[, 1]                #never put space before comma
mean(x, na.rm = TRUE) #Do not use space after a function
mean(x, na.rm = TRUE) #Do not use space in the parentheses
height <- feet * 12 + inches #surround by space
df$z                         #remove space, da der refereceres til df
x <- 1:10                   #remove space

# Indenting and brackets
if (y < 0 && debug) {
    message("y is negative")
}


# Object names --> ctrl + shift + a her retter R selv fejlene
DayOne
T <- FALSE
c <- 9

# Spacing
x[, 1]
x[, 1]
mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
height <- feet * 12 + inches
df$z
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")
}

#styler::style_file()           #R pakke til at rette ens kodning

