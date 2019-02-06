library(ggrepel)
library(ggplot2)
library(ggthemes)
library(extrafont)
library(grid)
library(cowplot)
library(readr)


EconomistData <- read_csv("data/EconomistData.csv")

View(EconomistData)

EconomistData$Region <- factor(EconomistData$Region,
                               levels = c("EU W. Europe",
                                          "Americas",
                                          "Asia Pacific",
                                          "East EU Cemt Asia",
                                          "MENA",
                                          "SSA"),
                               labels = c("OECD",
                                          "Americas",
                                          "Asia &\nOceania",
                                          "Central &\nEastern Europe",
                                          "Middle East &\nnorth Africa",
                                          "Sub-Saharan\nAfrica"))

graph1 <-  ggplot(EconomistData, aes (x=CPI, y=HDI))
graph1 + geom_point(aes(color = Region))

# Mudando o 'shape' 
graph1 + geom_point(aes(color = Region),
                    shape=21, 
                    fill= "White")

g2 <- graph1 + geom_point(aes(color = Region),
                          shape=21, 
                          fill= "White",
                          size =3, 
                          stroke=1.5)

ggdraw(g2)

g2 + geom_smooth(method = "lm", 
                 formula = y ~log(x))


g2 + geom_smooth(method = "lm",
                 formula = y ~log(x), 
                 se=FALSE)


g3 <- g2 + geom_smooth(aes(fill="red"),method = "lm", 
                       formula = y ~log(x),
                       se=FALSE, 
                       linetype=1 , 
                       color= "Red") 

ggdraw(g3)


g3 <- g2 + geom_smooth(aes(fill="red"),method = "lm", 
                       formula = y ~log(x),
                       se=FALSE, 
                       linetype=1 , 
                       color= "Red") 

ggdraw(g3)


point_1 <- c( "Venezuela", "Iraq", "Myanmar", "Sudan",
              "Afghanistan", "Congo", "Greece", "Argentina", 
              "India", "Italy",
              "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
              "United States",  "Britain", "Barbados", "Norway", 
              "New Zealand", "Singapore")
point_2 <- c("Russia","Brazil","Spain","Germany", "Japan","China","South Africa")
point_3 <-  c( "Venezuela", "Iraq", "Myanmar", "Sudan",
               "Afghanistan", "Congo", "Greece", "Argentina", 
               "India", "Italy",
               "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
               "United States",  "Britain", "Barbados", "Norway", 
               "New Zealand", "Singapore","Russia","Brazil","Spain","Germany", "Japan","China","South Africa")


g3 + geom_text(data=EconomistData[EconomistData$Country %in% point_1,], 
               aes(label=Country))

g4 <- g3 + geom_text_repel(data=EconomistData[EconomistData$Country %in% point_1,],
                           aes(label=Country))

g4 + geom_text_repel(data=EconomistData[EconomistData$Country %in% point_2,],
                     aes(label=Country))

g5 <- g4 + geom_text_repel(data=EconomistData[EconomistData$Country %in% point_2,],
                           aes(label=Country),
                           box.padding = unit(1.75, 'lines'))
ggdraw(g5)

g6 <- g5 +  scale_color_manual( values = c("#23576E", "#099FDB", 
                                           "#29B00E", "#208F84", 
                                           "#F55840", "#924F3E")) +
  scale_fill_manual(name='My Lines', values=c("red"),labels=c("R^2=52%"))


g6 + theme(legend.position="top")

# step 7
g7 <- g6 + theme(legend.position="top",
                 legend.title = element_blank(),
                 legend.box = "horizontal" ,
                 legend.text=element_text(size=8.5)) +
  guides(col = guide_legend(nrow = 1))
ggdraw(g7)


# step 8
g8 <- g7 + theme(panel.grid.minor = element_blank(), 
panel.grid.major = element_line(color = "gray50", size = 0.5),
panel.grid.major.x = element_blank(),
panel.background = element_blank(),
line = element_blank())
ggdraw(g8)

# Step 9
g9 <- g8 + scale_x_continuous(expand = c(0, 0),
                              limits=c(-.2,10.2),
                              breaks=seq(0,10,1), 
                              name = "Corruption Perception Index (10=Least corrupt)") +
  scale_y_continuous(expand = c(0, 0),
                     limits=c(0.2,1),
                     breaks=seq(0.2,1,0.1), 
                     name = "Human Development Index,2011 (1=best)")
ggdraw(g9)


# Step 10
g10 <-g9 +theme(axis.ticks.length = unit(.15, "cm"),
                axis.ticks.y = element_blank(),
                axis.title.x = element_text(color="black", 
                                            size=10,
                                            face="italic"),
                axis.title.y = element_text(color="black",
                                            size=10,
                                            face="italic"))
ggdraw(g10)

# Step 11
g11 <- g10+ ggtitle("Corruption and human development\n") + 
  theme(plot.title = element_text(hjust = -0.15, 
                                  vjust=2.12, 
                                  colour="black",
                                  size = 14,
                                  face="bold"))
ggdraw(g11)

# Step 12

g12 <-  add_sub(g11,"Source:Transparency International; UN Human Development report",
                x = -0.07,
                hjust = 0,
                fontface = "plain",
                size= 10) 

ggdraw(g12)