% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/funciones.R
\name{test_grubbs}
\alias{test_grubbs}
\title{Test de grubbs para determinar outliers.}
\usage{
test_grubbs(x1, x, alpha = 0.05, num_colas = 2, vista = TRUE)
}
\arguments{
\item{x1}{Elemento numérico que se desea saber si es outliers o no. Es un elemento del
vector `x`.}

\item{x}{Vector numérico de donde se determina si un elemento es outliers o no.}

\item{alpha}{Es el nivel de significancia con el que se desea determinar el valor crítico de
Grubbs. El valor por defecto es de 0.05.}

\item{num_colas}{Valor numérico que toma el valor de 1 si se desea calcular el valor
crítico a una sola cola. Si toma el valor de 2 se calcula el valor crítico a dos colas.
El valor por defecto es de 2 colas.}

\item{vista}{Valor lógico que toma por defecto TRUE, lo cual implica que en los resultados se
muestren el valor estadístico del test de grubbs, el valor crítico del test de grubbs, la
comparación que se hace y el resultado que es un valor lógico TRUE o FALSE, donde TRUE indica
que el elemento es un outliers.}
}
\description{
Devuelve un valor lógico de TRUE si el elemento del vector es un outliers
según el método de detección de outliers de Grubbs.
}
\details{
Para calcular el estadístico de Grubbs se usa:
\deqn{G=\frac{\left|x_i-\bar{x}\right|}{\sigma}}
Asimismo, la elección que se hace para saber si el elemento es outliers o no se hace con la
siguiente comparación.
\deqn{G_t>G_{tc} \rightarrow TRUE \rightarrow \textrm{Es outliers}}
\deqn{G_t>G_{tc} \rightarrow FALSE \rightarrow \textrm{No es outliers}}
}
\examples{
# Definimos primero el siguiente vector.
set.seed(2020)
x<-c(25, 30, sample(1:10, 30, T), 21)

Aplicando el testm para poder ver si el primer elemento es un outliers.
test_grubbs(x[2], x)
# TRUE

si se desea saber si el segundo elemento es un outliers.
test_grubbs(x[2], x, vista=TRUE)
# $grubbs_test
# [1] 3.526906
# $grubbs_crit
# [1] 2.951949
# $decision
# [1] "3.52690609285061>2.95194890641393"
# $resultado
# [1] TRUE
}
