# Curso de ver?o em Bioinform?tica
# Introdu??o ao R
# Autor: Lucio Rezende Queiroz

## Parte 1

# Tipos de dados

## Numérico
1
0.1
0.1245524235
28.5
pi

## inteiro

1L
5L
10L
1L

## Números complexos

1i
5i
6 + 5i

## Caracter

"A"
"Livro"
"Salada de frutas"

'Salada'

## Lógico

TRUE
FALSE

## Vetores

c(1, 2, 3)

c("A", "B", "C")

c("X", "Y", "Z")

c("A","B", "C", c("X", "Y", "Z"))

c("A", "1" )

## Listas

list( 1 ,"A")

list(1, "A", 2, "Livro", TRUE)

list( c(1, 2, 3), 2, "Livro", TRUE, c("A","B","C"))

list( 1, 2, 3, list(10, "B") )


list(pedido_id = 8001406,
     pedido_registro = "2017-05-25",
     nome = "Athos",
     sobrenome = "Petri Damiani")


# Opera??es matem?ticas

## O R pode ser uma calculadora

1 + 1
4 - 2
2 * 3
5 / 3
4 ^ 2
4 ** 2

5 / 3

5 %% 3  # resto da divis?o de 5 por 3

5 %/% 3  # parte inteira da divis?o de 5 por 3

## Opera??es longas

5 * 8 + 2 + 9 * 124235236 / 12124154 ** 10


(((2 + 2) * 5) / 10)
2 + 2  * 5


## Mensagens de Erro e Avisos

5 * "A"

145.5L

# Atribuindo valores a var?aveis

x <- 2
x
y <- "A"
y
y <- 5
y

z <- x * 3 ## Atribuindo valor de x vezes 3 em z

z <- x + y

pi <- 5 ## cuidado!

1 <- 5 ## Erro!
z
z2 <- 10
valor_de_expressao_genica <- 10
valor.de.expressao.genica <- 20
Valor_de_expressao_genica <- 30
z
Z <- 15
Z

x * 5

vetor1 <- c(1, 2, 3, 4)

vetor2 <- c("a", "b", "c")

vetor1

vetor2

class(vetor1)
## [1] "numeric"
class(vetor2)
## [1] "character"


## Operaçes com vetores

vetor1
vetor1 - 1
## [1] 0 1 2 3

vetor1 / 2

vetor1 * 10

vetor1 * vetor1
vetor2 <- c(5, 6, 7)
vetor2
vetor1 + vetor2

vetor3 <- c(3, 4)
vetor1 + vetor3
vetor1 * vetor2


vetor4 <- c("A","B","C")
vetor4
vetor1 + vetor4

## Coerção de tipos

x <- 1

class(x)

as.character(x)

as.logical(x)


y <- c(1.7, "a")  ## character
y
y <- c(TRUE, 2)   ## numeric
y
y <- c(TRUE, "a") ## character
y

x <- c(0, 1, 2, 3)

class(x)

as.numeric(x)

as.logical(x)

as.character(x)

## character > complex > numeric > integer > logical

x <- c("a", "b", "c")

as.numeric(x)

as.logical(x)

## Matrizes

x <- c( 1, 2, 3, 4, 5, 6)
x

m <- matrix(x, nrow = 3, ncol = 2)
matrix( c(c(1,2,3),c(4,5,6)), nrow =3, ncol =2)

vetor1 <- c(1,2,3)
vetor2 <- c(4,5,6)
vetor3 <- c(vetor1, vetor2)
vetor3
matrix(c(vetor1, vetor2))

matrix(vetor3, ncol= 1)
matrix(vetor3, nrow = 1)

matrix( vetor3, nrow = 2, ncol =3 )
matrix( vetor3, nrow = 2, ncol =3 , byrow = TRUE)

matrix( vetor3 , 2, 3, TRUE)

matriz1 <- matrix( ncol =2 , nrow =3 , data = vetor3 )

matriz1

dim(matriz1)

matriz1[3,  ]   # seleciona a terceira linha
matriz1[ , 2]   # seleciona a segunda coluna
matriz1[1, 2]   # seleciona o primeiro elemento da segunda coluna
matriz1[3,2]

is.matrix(matriz1)
is.character(matriz1)
class(matriz1)

t(matriz1)      # matriz transposta


matriz2 <- matrix(c(4,5,1,2), nrow = 2, ncol = 2)

matriz1 %*% matriz2

m %*% n   # multiplica??o matricial

matriz1
matriz1 + 1

matriz1 * 2


## Funções
x <- c(1, 2, 3, 4, 5 ,6 ,7, 8, 9, 10)
x
y <- 10.11451

x

mean(x)

sum(x)

round(y)

round(y, digits = 30)

round(mean(x), digit = 1 )

round(mean(x), 1)

vetor1 <- c(1,2,3,4,5)
vetor2 <- c(6,7,8,9,10)
t.test(vetor1,vetor2)
## Como pedir ajuda no R

?mean()
?sum()

help(mean)
help(help)

## Opera??es l?gicas

x <- 5
y <- 7

x < y     ## x menor que y?
x <= y  ## x menor ou igual a y?
5 < 4
5 < 5
5 <= 5
x > y     ## x maior que y?
x >= y  ## x maior ou igual a y?
7 >= 7

x <- 5
x = 5

x == y  ## x igual a y?
1 == 2
1==1

"A" == "A"

"A" == "B"


x != y  ## x diferente de y?
7 != 7

!TRUE

!(7 == 7)

!x          ## Negativa de x

x | y     ## x ou y s?o verdadeiros?
x & y   ## x e y s?o verdadeiros?


1 == 1
2 ==2

1 == 1 & 2 == 3

(4 == 1 | 2 == 3 ) & 5 > 7

7 > 5 | 4 < 6
x
y

x > 4 | x > 7

## Controles de Fluxo

### IF e ELSE

x <- 1

Sys.time()

if( x == 1 ) {
  Sys.time()      # Imprime a data/hora no momento da execu??o.
}

x <- 2

if(x == 1) {
  Sys.time()      # Imprime a data/hora no momento da execu??o.
}


x <- 1

if(FALSE) {
  Sys.time()
}


x <- 1
x == 2
if(x == 2) {
  print( "operaçao correta" )
} else {
  print( "x é diferente de 2" )
}


## Objetos aninhados

x <- 4

if( x == 5) {
  print( " x é igual a 5 ")
} else {
  if( x == 4 ){
    print( "x é igual a 4")
  }
}

if( x == 5 ){
  print(x)
}
if( x ==4 ){
  print(x)
}

if(5==6){
  print(5)
} else {
  print(" é diferente de 6 ")
}
print("1")
x<-c(1,2,3,4)
mean(x)
sd(x)
var(x)


x <- 0

if(x < 0) {
  sinal <- "negativo"
} else if(x == 0) {
  sinal <- "neutro"
} else if(x > 0) {
  sinal <- "positivo"
}
sinal

## Laços de repetiçoes
### FOR
1:1000
50:-10
vetor1 <- c(1,2,3,4,5,6)
vetor2 <- c("A","B","C","D","E")

vetor2[-1]
vetor2[c(2,4)]
vetor2[2:4]
vetor1[4]

vetor2[ c( -2, -4)]

1:10
x <- 1:10   # Cria um vetor com a sequ?ncia 1, 2, ..., 10.
x

## Para
soma <- 0
soma
for(numero in c(1:10)) {
  soma <- soma + x[numero]
}
soma

## Como crair suas pr?prias fun??es

soma_dos_x <- function( x1 , x2){
  resposta <- x1 + x2
  return(resposta)
}

soma_dos_x( 2 , 3 )

soma_dos_quadrados <- function(numero1, numero2) {
  resposta <- (numero1 ^ 2) + (numero2 ^ 2 )
  resposta <- resposta / 2
  return(resposta)
}

x <- soma_dos_quadrados( 2 , 3 )

calcular_quadrado <- function(numero1) {
  resposta <- numero1 ^ 2
  return(resposta)
}

calcular_soma_dos_quadrados <- function( numero1, numero2) {
  resposta <- calcular_quadrado(numero1) + calcular_quadrado(numero2)
  return(resposta)
}

calcular_soma_dos_quadrados( 5,6)

x <- c(4,10,20,30,100)

calcular_amplitude <- function( vetor1 ){
  maximo <- max(vetor1)
  minimo <- min(vetor1)
  media <- mean(vetor1)
  resposta <- c(maximo,media,minimo)
  return(resposta)
}

calcular_amplitude(x)


vetor1 <- c(1,2,3,4,5)

vetor2 <- c( 6,7,8,9,10)

vetor3 <- c(100,200, 300,1000,10)

lista1 <- list(vetor1,vetor2,vetor3)

class(lista1)

class(lista1[1])

lista1[1]

lista1[[1]]

unlist(lista1[2])

lista1[[3]][1]

lista1

for (vetor in lista1) {
  vetor <- unlist(vetor)
  resposta <- calcular_amplitude(vetor)
  print(resposta)
}

lista1



data.frame( coluna1 = vetor1, coluna2 = vetor2, coluna3 = vetor3)


tabela_de_expressao <- data.frame( nome_do_gene = c("HERC","BRCA1","R2D2","BRCA2"),
                                   valor_de_expressao = c(10,15,12,5),
                                   numero_do_cromossomo = c( 2,3,4,3),
                                   diferencialmente_expresso = c(TRUE,FALSE,FALSE,FALSE))


tabela_de_expressao[c(1,3),c("valor_de_expressao","numero_do_cromossomo")]

class(tabela_de_expressao)
nome_das_colunas <- colnames(tabela_de_expressao)
nome_das_colunas

tabela_de_expressao[nome_das_colunas[1]]
colnames(tabela_de_expressao)

rownames(tabela_de_expressao) <- tabela_de_expressao[ ,"nome_do_gene"]

tabela_de_expressao

tabela_de_expressao["BRCA1","valor_de_expressao"]

tabela_de_expressao$nome_do_gene

grepl("")

x <- c("bacterwa","peixe","bacterya")


grepl("bacter.a", x )

brca_linha <- grep("BRCA",tabela_de_expressao$nome_do_gene)

tabela_brca <- tabela_de_expressao[brca_linha,]


write.table(x = tabela_brca, file = "resultados/tabela_brca.txt")
write.csv(x = tabela_brca, "resultados/tabela_brca.csv" )


getwd()
setwd("resultados")
getwd()
setwd("../")
getwd()

tabela_nova <- read.csv("resultados/tabela_brca.csv")

tabela_nova

tabela_antiga <- read.table("resultados/tabela_brca.txt")

class(tabela_antiga)

## Bibliotacas

library("readxl")

readxl::read_excel("resultados/")

tabela_brca <- read.csv("~/cursodeverao2018/resultados/tabela_brca.csv", row.names=1)

soma <- function(x, y = 0) {
  resposta <- x + y
  return(resposta)
}



soma( 5, 10)
