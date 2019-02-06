# Grammar of Graphics

# Carregando a biblioteca
library(ggplot2)

tabela_de_carros <- ggplot2::mpg

# Inspecionando a tabela
head(tabela_de_carros)

View(tabela_de_carros)

# Estrutura da tabela
str(tabela_de_carros)


# `displ`, capacidade do motor, em litros.
# `hwy`, eficiência do combustível na rodovia, em milhas por galão (mpg)

# Hora do gráfico!

ggplot(data = mpg)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# O maior valor está no que não esperamos

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


# Separando grupos 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)


# Curva de tendência
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Curva de tendendia por grupo
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))


# Juntando tudo 
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy))
  

# aes global ou por função
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()


# Adicionando mais uma camada
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d()

# separando por grupo
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d(aes(group = class))

# Sepaprando por grupo e cor
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d(aes(group = class, color = class))

# Mudando o tema
# bw
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d(aes(group = class, color = class)) +
  theme_bw()

# Escuro
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d(aes(group = class, color = class)) +
  theme_dark()

# Vazio 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d(aes(group = class, color = class)) +
  theme_void()

# Mudando a paleta de cores
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d(aes(group = class, color = class)) +
  theme_dark() +
  scale_color_brewer() # "Blues"

# tons pasteis asteis
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  geom_density_2d(aes(group = class, color = class)) +
  theme_dark() +
  scale_color_brewer(palette = "Pastel2")

# Escala continua de cores
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() +
  theme_bw() +
  scale_color_brewer(palette = "PRGn")

# Mudando a cor de apenas uma camapa
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(color = "red") +
  theme_bw() +
  scale_color_brewer(palette = "PRGn")

library(ggrepel)
# Mudando a cor de elementos de uma camapa
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(color = "turquoise4", fill = "salmon") +
  theme_bw() +
  scale_color_brewer(palette = "PRGn") +
  geom_text_repel(data = dplyr::filter(mpg, model == "a4"),aes(label = model), color = "darkgreen")

# 
colors()


# Pacotes que contem temas

# ggpubr - temas prontos para publicação
library(ggpubr)

# 1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(color = "purple") +
  scale_color_brewer(palette = "PRGn") +
  theme_pubr()

# 2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(color = "purple") +
  scale_color_brewer(palette = "PRGn") +
  ggpubr::theme_cleveland()

# ggsci - temas de revistas cientificas
library(ggsci)
??ggsci

# Atribuindo gráficos a variaveis
plot_1 <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(color = "purple") +
  scale_color_brewer(palette = "PRGn") +
  theme_pubr()

plot_1

plot1_jama <- plot_1 + 
  scale_color_jama()

plot1_jama


plot2_jama <- plot1_jama + scale_fill_jama()

plot2_jama

plot2_aaas <- plot1_jama +
  scale_color_aaas()

plot2_aaas

# Revisando

# Não se esqueça, das camadas!
plot1_jama +
  geom_boxplot()

plot1_jama +
  geom_boxplot(mapping = aes(color = class))


plot1_jama +
  geom_boxplot(mapping = aes(color = class), fill = "black", alpha = 0.4, size = 2) +
  geom_polygon(mapping = aes(fill = class))

plot1_jama +
  geom_polygon(mapping = aes(fill = class)) + 
  geom_point(shape = 4) +
  scale_fill_viridis_d()
