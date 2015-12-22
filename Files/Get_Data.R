##This script is used to scrape the data from "http://www.pro-football-reference.com/teams/sfo/2012.htm" and create a usable data frame
##Gather team statistics on the 49ers
##Load required packages
library(XML)

##Scrape the data from the site
years <- 2014:1970  #Select the years for which you want to get stats
data_df <- data.frame()

for (i in 1:length(years)){
        fileurl <- paste("http://www.pro-football-reference.com/teams/sfo/", years[i], ".htm", sep="")
        tables <- readHTMLTable(fileurl)
        team_stats <- tables$team_stats[1:2,-23:-31]
        record_stats <- as.character(tables$passing[,7])
        
        wins <- vector()
        losses <- vector()
        ties <- vector()
        for (x in 1:length(record_stats)){  #Get the record for the niners each year
                wins <- append(wins, sub("-.+","", record_stats[x]))
                if (wins[x]==""){
                        wins[x]="0"
                }
                check_losses <- sub("[0-9]{1,2}-","",record_stats[x])
                check_losses <- sub("-.+","",check_losses)
                losses <- append(losses, check_losses)
                if (losses[x]==""){
                        losses[x]="0"
                }
                ties <- append(ties, sub(".+-","",record_stats[x]))
                if (ties[x]==""){
                        ties[x]="0"
                }
                
        }
        team_stats <- cbind(team_stats, "Year"=years[i],"Win"=sum(as.numeric(wins)),"Loss"=sum(as.numeric(losses)),"Tie"=sum(as.numeric(ties)))
        data_df <- rbind(data_df, team_stats) 
}


##Change the names of the variables
colnames(data_df) <- c("Team","PF","TotalYards","Off. Plays","Yds/Play","TO","FL","Total1stD","Cmp","Att","PassYds(Sacks Reduce Net Yds)","PTDs","Int",
                       "Yds/Att","Pass1stDowns","RushAtt","RushYds","RushTDs","Yds/RushAtt","Rush1stDowns","Penalties", "PenYds", "Year",
                       "Wins","Losses","Ties")

##Subset to get data frames for only the 49ers not the opponents stats
team_df <- data_df[data_df$Team=="Team Stats",]

##Write the data into csv
setwd("C:/Users/james/SkyDrive/Data Science/Projects/49ers Regression Analysis")
write.csv(team_df, file="FootballData.csv")

