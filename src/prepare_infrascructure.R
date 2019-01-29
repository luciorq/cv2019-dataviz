# 29 January, 2019
cat(format(Sys.time(), '%d %B, %Y'), "\n")

library(dplyr)

set.seed(42)
setwd(here::here())


# Creating infrastructure
fs::dir_create("user_data")
i =21

for (i in 1:200) {
  usuario_de_i <- paste0("usuario", stringr::str_pad(i, 3, side = "left", pad = "0"))
  senha_de_i <- paste0("cursodeverao", stringr::str_pad(i, 3, side = "left", pad = "0"))
  system(paste("bash src/create_user.sh", usuario_de_i, senha_de_i))
}


# Create aditional folders
# criar_data.R
for (i in list.dirs("..", recursive = FALSE)) {
  dir.create(paste0(i,"/data"))
}

# instalar_hanaisa.R
library.install("devtools")

install.packages("RColorBrewer")
install.packages("gplots")
install.packages("randomNames")
install.packages("igraph")
install.packages("magrittr")

install.packages("scales")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("sp")
install.packages("rgeos")
