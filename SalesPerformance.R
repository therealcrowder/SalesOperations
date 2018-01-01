library(readxl)
SalesPerformance <- read_excel("~/Documents/Resume/SalesPerformance.xlsx")
head(SalesPerformance)

# We want to look at this information without scientic notation
options(scipen=999)

# Check to make sure
head(SalesPerformance)

library(ggplot2)

# Create a cutoff variable to rep 95%
cutoff <- data.frame( x = c(-Inf, Inf), y = .95, cutoff = factor(.95))

ggplot(SalesPerformance, aes(x=Wins, y=ToPlan)) + 
  geom_point(shape=18, color="blue")+
  geom_smooth(method=lm,  linetype="dashed",
    color="darkred", fill="blue") +
  geom_line(aes( x, y, linetype = cutoff), cutoff)