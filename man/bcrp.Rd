% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/funciones.R
\name{bcrp}
\alias{bcrp}
\title{Web scraping a la página del BCRP para extracción de datos de las series económicas.}
\usage{
bcrp(periodo = "anuales", serie = "PM04925AA", nombre = NULL)
}
\arguments{
\item{periodo}{Elemento caracter que toma el periodo de la serie que se desea descargar.
Puede ser: "diarias", "mensuales", "trimestrales" o "anuales". El valor por defecto es
"anuales", es decir, extraerá series anuales. Pero usted puede modificarlo por una de las
opciones. La elección dependerá del periodo en la que se encuentre disponible
la serie en el BCRP. Para más detalle ver los details.}

\item{serie}{Elemento caracter que toma el nombre de la serie. El valor por defecto es
"PM04925AA" que corresponde a la demanda interna. Pero usted puede colocar el código de la
serie que desee descargar, recuerde que esta serie viene asociado al argumento periodo.}

\item{nombre}{Elemento caracter que indica el nombre con el que saldrá la serie que se desea
descargar. El valor por defecto es NULL. Lo que indica que asignará el nombre de la variable
que esté disponible desde la página del BCRP.}
}
\description{
Función que automatiza la descarga de datos de la series económicas del BCRP
sin la necesidad de descargar archivos excel o text.
}
\details{
El periodo de la serie y el nombre de las series lo puede encontrar en los metadatos
del BCRP en el siguiente enlace: https://estadisticas.bcrp.gob.pe/estadisticas/series/ayuda/metadatos
que es de actualización no tan constante. Pero si desea tener las fechas de inicio fin más actualizas
puede acceder a esta información en nuestra web:
}
\examples{
# Si queremos extraer la demanda interna en periodos anuales.
df<-bcrp(periodo="anuales", serie="PM04925AA", nombre="Demanda Interna")
# Aplicando un head() para observar las 6 primeras observaciones.
#    Fecha Demanda Interna
#    1950           38832
#    1951           44094
#    1952           46430
#    1953           49023
#    1954           50438
#    1955           54687

# Si queremos extraer las reservas internacionales netas en periodos mensuales.
df<-bcrp(periodo="mensuales", serie="PN00026MM", nombre="RIN")
# Aplicando un head() para observar las primero 5 observaciones.
     Fecha   RIN
#    Dic94 12464
#    Ene95 12530
#    Feb95 12759
#    Mar95 12823
#    Abr95 12681
#    May95 12720
}
