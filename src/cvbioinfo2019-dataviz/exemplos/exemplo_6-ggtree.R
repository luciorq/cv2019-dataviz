library(ggtree)

# àrvore de alinhamento de seuqencia
fasta <- system.file("examples/FluA_H3_AA.fas", package="ggtree")

msaplot(ggtree(beast_tree), fasta) 


# Arvore com anotação
data(iris)
library(ape)
rn <- paste0(iris[,5], "_", 1:150)
rownames(iris) <- rn
d_iris <- dist(iris[,-5], method="man")

# Calculando NJ
tree_iris <- bionj(d_iris)
tree_iris <- groupOTU(tree_iris, list(setosa = rn[1:50],
                                      versicolor = rn[51:100],
                                      virginica_145 = rn[101:150]))

library(RColorBrewer)
cols <- brewer.pal(4, "Set2")

ggtree(tree_iris, aes(color = group)) +
  geom_text(aes(label=label), hjust=-.1) +
  scale_color_manual(values=cols, breaks=1:3,
                     labels=c("Setosa", "Versicolor", "Virginica")) +
  
  theme(legend.position="right")
