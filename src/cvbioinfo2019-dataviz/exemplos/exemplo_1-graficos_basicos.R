
# Valores aleatorios de uma distribuição normal
normal_values <- rnorm(1000, mean = 10, sd = 1)

# Histograma dos valores
hist(normal_values)


hist(normal_values, breaks=12, col="red")

?hist

# Distribuição com curva
head(mtcars)
View(mtcars)

x <- mtcars$mpg

h <- hist(x, breaks=10, col="red", xlab="Milhas por galão",
        main="Histograma com curva normal")
xfit <- seq(min(x), max(x), length = 40)
yfit <- dnorm(xfit, mean = mean(x),sd = sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col = "blue", lwd = 2)

# Grafico de densidade

densidade <- density(x)

plot(densidade)


