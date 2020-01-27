data <- read.csv('fake_companies_data.csv')
str(data)
summary(data)
dim(data)

#1-Combien d'entreprises californiennes ("CA") et du Texas ("TX") il y a dans ce fichier ?
length(which(data$state == "CA" | data$state == "TX"))

#2-Combien d'Erick ont une entreprise dans l'Illinois ("IL")?
length(which(data$first_name == "Erick" & data$state == "IL"))

#3-Changez 'last_name' en majuscule
data$last_name <- toupper(data$last_name)

#4-Creez la variable 'name' en mettant ensemble 'first_name' et 'last_name' separes par un espace
data$name <- paste(data$first_name, data$last_name, sep = " ")

#5-Creez la variable 'countyInit' avec les premiers trois caracteres de la variable 'county'
data$countyInit <- substr(data$county, start=1, stop=3)

#6-Enlevez le '-' de la variable 'phone1'
data$phone1 <- gsub("-", "", data$phone1)

#7-Creez le dataframe 'contacts' avec les variables 'name', 'phone1' et 'email'
contacts <- data[, c("name", "phone1", "email")]

#8-Combien de personnes ont 'y' ou 'Y' dans leur nom/prenom ?
length(grep(pattern="[Yy]", contacts$name, value=F))

#9-Combien de personnes ont gmail comme provider ? 
length(grep(pattern="gmail", contacts$email, value=F))

#10-Visualisez la distribution du nombre de caractères contenus dans 'last_name'.
library(dplyr)
data$last_name %>%
  nchar() %>%
  as.factor() %>%
  table() %>%
  barplot()

hist(nchar(data$last_name))
