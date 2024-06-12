#load library
library(babynames)
#Make an object called bb_names
bb_names <- babynames
#load more libraries
library(ggplot2)
library(tidyverse)
#Create a histogram for the name Marie since 1982. Notice anything weird?
ggplot(data = bb_names %>% filter(name=="Marie", year >= 1981))+
  geom_col(aes(x= year,y = n))
#Create a line plot for proportion of the name Joe, colored by sex.
ggplot(data = bb_names %>%filter(name=="Joe"))+
  geom_line(aes(x=year, y=prop, color = sex), alpha = .5, linewidth=2)+
  labs(x = "Year", 
       y = "Proportion",
       color = "Sex",
       title = "Proportion of the name Joe over time",
       subtitle = "1880-2017" )

max(bb_names$year) 
min(bb_names$year)

#Create a bar chart of all female names in 2002.
ggplot(data = bb_names %>% filter(year == 2002, sex == "F", name %in% c("Madison", "Sarah", "Emma", "Emily", "Olivia")))+
  geom_col(aes(x=name, y=n), alpha = .5, fill = "blue")

the_nineties <- bb_names %>% 
  filter(year >= 1990, year < 2000)

write.csv(the_nineties)
write_csv(the_nineties, file = "babynames_90s.csv")

#Now that everything is up to date, make a visualisation of you and your team member’s names for a year of your choice.
bb_team <- bb_names %>% 
  filter(name %in% c("Emily", "Nicole", "Adri", "Linnea"))

ggplot(data = bb_team %>% filter(year == 2010))+
  geom_col(aes(x = name, y = n))
# make a visual that looks at your name over time. What happens if you color by sex?
ggplot(data = bb_names %>%filter(name=="Linnea"))+
  geom_line(aes(x=year, y=n, color=sex))


