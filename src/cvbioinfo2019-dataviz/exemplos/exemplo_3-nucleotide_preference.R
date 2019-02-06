library(ggplot2)
library(tidyr)

getwd()
setwd("~")
# loading data - carregando dados
data <- read.csv("data/nucleotidePreference_data.tab", sep="#", row.names=NULL, header=TRUE)

View(data)
# dividing data by strand - divindindo os dados por fita
data_negative <- subset(data, strand == "-") 
data_positive <- subset(data, strand == "+") 

# normalizing data - normalizando os dados
head(data_positive)

# Escore padronizado da contagem de ocorrencias
data_positive[,3:6] <- scale(data_positive[,3:6])
data_negative[,3:6] <- scale(data_negative[,3:6])

head(data_positive)

#converting data to format needed by ggplot - convertendo dados para formato necessário para ggplot

data_positive_long <- gather(data_positive, "nucleotide", "value", -c(pos, strand))
data_negative_long <- gather(data_negative, "nucleotide", "value", -c(pos, strand))

#plotting data - plotando os dados
ggplot(data_positive_long, aes(x = pos, y = value, col = nucleotide)) + 
  geom_line() + 
  theme_bw(base_size = 16) + 
  xlab("Nucleotide position") + 
  ylab("Z-score")
ggplot(data_negative_long, aes(x = pos, y = value, col = nucleotide)) + 
  geom_line()+ 
  theme_bw(base_size = 16) + 
  xlab("Nucleotide position") + 
  ylab("Z-score")
