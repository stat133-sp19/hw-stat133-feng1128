#title: GSW Shot Charts
#descrption: This script includes the code for making the shot charts of the five players in the team GSW.
#inputs: five CSV files about the shot data of each player and one CSV file including all the shot data of the five players
#outputs: five shot charts of each player in PDF format, and one shot chart including all the shot charts in both PDF and PNG format

library(jpeg)
library(grid)
library(ggplot2)

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

shots_data<-rbind(iguodala, green, durant, thompson, curry)

court_file<-"../images/nba-court.jpg"
court_image<-rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

#create shot charts for each player
iguodala_shot_chart <- ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala(2016 season)') +
  theme_minimal()
ggsave("../images/andre-iguodala-shot-chart.pdf",width = 6.5, height = 5, units = "in")

green_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green(2016 season)') +
  theme_minimal()
ggsave("../images/draymond-green-shot-chart.pdf",width = 6.5, height = 5, units = "in")

durant_shot_chart <- ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant(2016 season)') +
  theme_minimal()
ggsave("../images/kevin-durant-shot-chart.pdf",width = 6.5, height = 5, units = "in")

thompson_shot_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson(2016 season)') +
  theme_minimal()
ggsave("../images/klay-thompson-shot-chart.pdf",width = 6.5, height = 5, units = "in")

curry_shot_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry(2016 season)') +
  theme_minimal()
ggsave("../images/stephen-curry-shot-chart.pdf",width = 6.5, height = 5, units = "in")

#create one graph to show all the shot charts
gsw_shot_chart<-ggplot(data = shots_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart:GSW(2016 season)') +
  facet_wrap(~ name)+
  theme_minimal()
ggsave("../images/gsw-shot-chart.pdf",width = 8, height = 7, units = "in")
ggsave("../images/gsw-shot-chart.png",width = 8, height = 7, units = "in")
