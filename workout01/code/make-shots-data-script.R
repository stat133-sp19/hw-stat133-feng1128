#title: GSW Shot Data
#descrption: This script includes the code for manipulating the shot data of the five players in the team GSW.
#inputs: five CSV files about the shot data of each player
#outputs: five respecitve summaries of the shot data for each player in txt format, one CSV file including all the shot data of the five players , and one summary of all the shot data in txt format

#reading files with relative path
iguodala<-read.csv("../data/andre-iguodala.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
green<-read.csv("../data/draymond-green.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
durant<-read.csv("../data/kevin-durant.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
thompson<-read.csv("../data/klay-thompson.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)
curry<-read.csv("../data/stephen-curry.csv",colClasses=c("character","character","integer","integer","integer","integer","character","character","character","integer","character","real","real"),stringsAsFactors = FALSE)

#add a column name to each imported data
iguodala$name="Andre Iguodala"
green$name="Draymond Green"
durant$name="Kevin Durant"
thompson$name="Klay Thompson"
curry$name="Stephen Curry"

#change the original values of shot_made_flag
iguodala$shot_made_flag[iguodala$shot_made_flag=="n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag=="n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag=="y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag=="n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag=="y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag=="n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag=="y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag=="n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag=="y"] <- "shot_yes"

#add a column minute that contains the minute number where a shot occured
iguodala$minute=iguodala$period*12-iguodala$minutes_remaining
green$minute=green$period*12-green$minutes_remaining
durant$minute=durant$period*12-durant$minutes_remaining
thompson$minute=thompson$period*12-thompson$minutes_remaining
curry$minute=curry$period*12-curry$minutes_remaining

#use sink() to send the summary() output of each imported data frame
sink("../output/andre-iguodala.txt",append = TRUE,split = TRUE)
cat(summary(iguodala))
sink()

sink("../output/draymond-green.txt",append = TRUE,split = TRUE)
cat(summary(green))
sink()

sink("../output/kevin-durant.txt",append = TRUE,split = TRUE)
cat(summary(durant))
sink()

sink("../output/klay-thompson.txt",append = TRUE,split = TRUE)
cat(summary(thompson))
sink()

sink("../output/stephen-curry.txt",append = TRUE,split = TRUE)
cat(summary(curry))
sink()

#stack the tables into one single data frame
shots_data<-rbind(iguodala, green, durant, thompson, curry)

#export the assembled table
write.csv(shots_data,file="../data/shots-data.csv")

#use sink() to send the summary() output of the assembled data
sink("../output/shots-data-summary.txt",append = TRUE,split = TRUE)
cat(summary(shots_data))
sink()