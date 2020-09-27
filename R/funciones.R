# Limpiecito.

#' @title Limpieza de caracteres o strings.
#' @description Es una función para limpiar espacios por demás al inicio, final o intermedio. Asimismo
#' elimina tildes y arroja los resultados en letras mayúsculas o minúsculas.
#' @param x Un elemento o vector character.
#' @param capital Valor lógico  que toma por defecto TRUE, lo que indica que los resultados
#' se mostrarán en mayúsculas y si toma el valor de FALSE los resultados se mostrarán en
#' minúsculas.
#' @details Esta función se usará para la limpieza de base de datos.
#' @examples
#' limpiecito(c("    raul", " yo uso    R"))
#' # "RAUL" "YO USO R"
#' @export

limpiecito<-function(x, capital=TRUE){
  if(capital==TRUE){
    x<-gsub("(^\\s+|\\s+$)","",x)
    x<-gsub("\\s+", " ",x)
    x<-toupper(x)
    x<-gsub("Á", "A", x)
    x<-gsub("É", "E", x)
    x<-gsub("Í", "I", x)
    x<-gsub("Ó", "O", x)
    x<-gsub("Ú", "U", x)
  } else if(capital==FALSE){
    x<-gsub("(^\\s+|\\s+$)","",x)
    x<-gsub("\\s+", " ",x)
    x<-toupper(x)
    x<-gsub("Á", "A", x)
    x<-gsub("É", "E", x)
    x<-gsub("Í", "I", x)
    x<-gsub("Ó", "O", x)
    x<-gsub("Ú", "U", x)
    x<-tolower(x)
  } else {
    stop("capital tiene que ser una valor lógico: TRUE o FALSE")
  }
  x
}


# UBIGEO PERÚ.

#' @title Ubigeo Peru
#' @description Convertir el código numérico de ubigeo (código de ubicación geográfica del Perú)
#' a nivel departamental.
#' @param x un elemento o vector character.
#' @details El o los elementos de `x` pueden ser los 6 dígitos que brinda el INEI.
#' Incluso el vector `x` puede tener entre 1 y 2 caracteres, por tanto no es necesario expresar
#' el ubigeo con un `0` antes de los primeros 9 departamentos.
#' @examples
#' dpto_peru(c("1", "01", "010405", "12", "120902", "9", "090302"))
#' # "AMAZONAS" "AMAZONAS"  "AMAZONAS" "JUNIN" "JUNIN" "HUANCAVELICA" "HUANCAVELICA"
#' @export

dpto_peru<-function(x) {
  x<-ifelse(grepl("^1$|^01",x),"AMAZONAS",
            ifelse(grepl("^2$|^02",x),"ANCASH",
                   ifelse(grepl("^3$|^03",x),"APURIMAC",
                          ifelse(grepl("^4$|^04",x),"AREQUIPA",
                                 ifelse(grepl("^5$|^05",x),"AYACUCHO",
                                        ifelse(grepl("^6$|^06",x),"CAJAMARCA",
                                               ifelse(grepl("^7$|^07",x),"CALLAO",
                                                      ifelse(grepl("^8$|^08",x),"CUSCO",
                                                             ifelse(grepl("^9$|^09",x),"HUANCAVELICA",
                                                                    ifelse(grepl("^10$|^10",x),"HUANUCO",
                                                                           ifelse(grepl("^11$|^11",x),"ICA",
                                                                                  ifelse(grepl("^12$|^12",x),"JUNIN",
                                                                                         ifelse(grepl("^13$|^13",x),"LA LIBERTAD",
                                                                                                ifelse(grepl("^14$|^14",x),"LAMBAYEQUE",
                                                                                                       ifelse(grepl("^15$|^15",x),"LIMA",
                                                                                                              ifelse(grepl("^16$|^16",x),"LORETO",
                                                                                                                     ifelse(grepl("^17$|^17",x),"MADRE DE DIOS",
                                                                                                                            ifelse(grepl("^18$|^18",x),"MOQUEGUA",
                                                                                                                                   ifelse(grepl("^19$|^19",x),"PASCO",
                                                                                                                                          ifelse(grepl("^20$|^20",x),"PIURA",
                                                                                                                                                 ifelse(grepl("^21$|^21",x),"PUNO",
                                                                                                                                                        ifelse(grepl("^22$|^22",x),"SAN MARTÍN",
                                                                                                                                                               ifelse(grepl("^23$|^23",x),"TACNA",
                                                                                                                                                                      ifelse(grepl("^24$|^24",x),"TUMBES",
                                                                                                                                                                             ifelse(grepl("^25$|^25",x),"UCAYALI",NA)))))))))))))))))))))))))
  x
}


# ESTADÍSTICOS.

#' @title Estadisticos
#' @description Devuelve lo principales estadísticos como: la media, la mediana, la desviación estándar
#' el mínimo, máximo, coeficiente de variación y el número de observaciones.
#' @param x Vector numérico.
#' @param miss valor lógico que por defecto toma el valor de TRUE, que indica que no se debe
#' de considerar a los NAs en el cálculo.
#' @details el vector `x` tiene que ser numérico, sino no se podrá calcular los estadísticos.
#' El coeficiente de variación es mayor a 20% indica que deberíamos tomar a la mediana como estadístico
#' de tendencia central, y si es menor el mejor estadísitico de tendencia central será la media.
#' Los resultados están configurados para que el número de decimales sea de 3. Asimismo, si usa
#' algunas de las funciones de la familia `apply` el nombre de los estadísticos no se mostrará.
#' En todo caso si quiere hacer el cálculo para varios vectores a la vez se recomienda usar la siguiente
#' sintaxis: `do.call(cbind,lapply(df, estadisticos))`, donde `df` es el data frame que contiene todos
#' los vectores del cual se desea calcular los estadísticos.
#' @examples
#' set.seed(2020)
#' estadisticos(sample(1:100, 400,T))
#' #                   [,1]
#' # MEDIA           49.862
#' # MEDIANA         48.000
#' # DESV.STAND.     28.487
#' # MINIMO           1.000
#' # MAXIMO         100.000
#' # COEF.VARIACION   0.571
#' # N              400.000
#' @export

estadisticos<-function (x, miss=T) {
  media<-mean(x, na.rm = miss)
  mediana<-median(x, na.rm = miss)
  desv.s<-sd(x, na.rm = miss)
  minimo<-min(x, na.rm = miss)
  maximo<-max(x, na.rm = miss)
  CV<-desv.s/media
  tam<-sum(!is.na(x))
  tabla1<-round(matrix(c(media,mediana,desv.s,minimo,maximo,CV,tam)),3)
  row.names(tabla1)<-c("MEDIA","MEDIANA","DESV.STAND.","MÍNIMO","MÁXIMO","COEF.VARIACIÓN","N")
  tabla1
}

# ELEMENTOS POR PERCENTIL.

#' @title Numero de elementos por percentil.
#' @description Devuelve el número de elementos que se encuentran por cada percentil especificado
#' Es así que se puede calcular los elementos por terciles, cuartiles, quintiles, deciles, centiles, etc.
#' @param x Vector numérico.
#' @param len parámetro numérico que equivale al numero de cortes que se desea hacer, es así que si
#' se desea calcular los elementos divididos por terciles, `len` toma el valor de 3. len tomo el
#' valor de 4 por defecto.
#' @param p_corte valor lógico que toma el valor de TRUE por defecto, que indica que en los resultados
#' se muestre los puntos de cortes de los percentiles. Si es FALSE, en el resultado se mostrará por
#' partes, es así que si se escoge cuartiles, se mostrará el nombre de las filas del uno al 4, que hace
#' referencia a las partes en las que se dividió.
#' @details Los resultados se muestran en una matriz, donde el nombre de las filas dependerá de la elección
#' de p_corte, si es TRUE en los nombres de las filas se mostrará el rango de los puntos de corte de cada percentil,
#' si es FALSE se mostrará por el número de partes. Asimismo, si usa algunas de las funciones de la
#' familia `apply` el nombre de las filas no se mostrará.
#' @examples
#' # El nombre de las filas en partes. Para el caso de quintiles.
#' set.seed(2020)
#' n_percentil(sample(1:100, 400,T), len=5, p_corte=F)
#' #    [,1]
#' # 1   82
#' # 2   82
#' # 3   80
#' # 4   77
#' # 5   79
#
#' # El nombre de las filas con los puntos de corte. Para el caso de quintiles.
#' # set.seed(2020)
#' n_percentil(sample(1:100, 400,T), len=5)
#' #           [,1]
#' # [1,22]     82
#' # (22,41]    82
#' # (41,58]    80
#' # (58,80]    77
#' # (80,100]   79
#' @export

n_percentil<-function(x,len=4, p_corte=T){
  if(isTRUE(p_corte)){
    a<-quantile(x, prob=seq(0, 1, length = len+1), na.rm=T)
    b<-as.matrix(table(cut(x, breaks = a, right = T, include.lowest=T)))
  } else {
    a<-quantile(x, prob=seq(0, 1, length = len+1))
    b<-as.matrix(table(cut(x, breaks = a, labels = seq(len), right = T, include.lowest=T)))
  }
  return(b)
}


# ÀREA BAJO LA CURVA.

#' @title Area bajo la curva de los graficos de densidad dividido por percentiles.
#' @description Devuelve sub áreas de los gráficos de densidad divididos por percentiles.
#' Por ejemplo, terciles, cuartiles, quintiles, deciles, centiles, etc.
#' @param x Vector numérico del cual se desea obtener su gráfico de densidad.
#' @param len Parámetro numérico que equivale al numero de cortes que se desea hacer, es así que si
#' se desea calcular los elementos divididos por terciles, `len` toma el valor de 3. len tomo el
#' valor de 4 por defecto.
#' @param color_area Elemento numérico o vector caracter que especifica el color de las sub áreas.
#' Su valor por defecto es NA.
#' @param col_border Elemento caracter para especificar el color de los bordes que dividen las
#' sub áreas. El color por defecto es "black".
#' @param titulo Elemento caracter que se colocará en el título del gráfico.
#' Su valor por defecto es "".
#' @param dureza Elemento numérico que indica el grosor de la línea que divide las sub áreas.
#' Es el mismo argumento que `lwd` de la función plot. Su valor por defecto es 2.
#' @param ... Otros argumentos que se pueden usar en la función plot. Estos argumentos afectarán
#' al plot, pero no a las sub áreas. Por ejemplo, puede usar `xlab`, `font`, `sub`, `bty`, etc. Pero no
#' puede usar el argumento `main`, ya que ya está especificado con el argumento `título`.
#' @details Para el cálculo de los percentiles se usa como base el vector definido en el argumento `x`
#' con esos puntos de corte se procede a dividir los valores del eje de las abscisas de la densidad
#' del vector `x` (la densidad se calcula con la función `density` de R base). Cabe precisar que al
#' ser transformado el vector `x` por la función de densidad los valores
#' de `x` se ajustan, por lo que no serán los mismos. Por tanto, si se desea determinar el número
#' de elementos que se encuentran por cada percentil se debería de calcular en el mismo vector `x`,
#' antes de transformar estos valores por la función de densidad.
#' Lo recomendable es que `color_area` sea un vector caracter con el mismo número de elementos
#' que `len`.
#' @examples
#' # Vamos a usar la tabla de datos iris.
#' # Graficando las sub areas de la funcion de densidad de la variable Sepal.Length por quintiles
#' # y usando el argumento bty para quitar el marco del grafico.
#'
#' area_quantile(iris$Sepal.Length, len = 5, bty="n")

#' @export

area_quantile<-function(x, len=4, color_area=NA, col_border="black", titulo="", dureza=2, ...){

  if(len<1){
    stop("No se puede dividir el área en partes menores a 1. Intente con un len mayor igual a 1")
  }

  if(sum(is.na(color_area))>=1 | (is.numeric(color_area))){
    if(sum(is.na(color_area))>=1 | len==color_area){
      color_area<-terrain.colors(len, 0.7)
    } else if(is.numeric(color_area) & len>color_area) {
      color_area<-rep(terrain.colors(color_area, 0.7), 20, length.out=len)
      warning("Esta viendo colores repetidos en el gráfico.
              Esto sucede porque el número de colores para las sub áreas no es igual al número de divisiones.
              len debe de ser igual a color_area, sino se especifica colores para las áreas.")
    } else if(is.numeric(color_area) & len<color_area) {
      color_area<-rep(terrain.colors(color_area, 0.7),20)
      warning("Esta viendo menos colores de los que especificó.
              Esto sucede porque el número de colores para las sub áreas no es igual al número de divisiones.
              len debe de ser igual a color_area, sino se especifica colores para las áreas.")
    }
    } else if(is.character(color_area) & len!=length(color_area)) {
      color_area<-rep(color_area, 20, length.out=len)
      warning("El número de colores para las sub áreas debe de ser igual al número de divisiones.")
    } else {
      color_area
    }

  plot(density(x), main=titulo, ...)

  a<-quantile(x, probs = seq(0, 1, length=len+1), na.rm = T)
  x1<-density(x, na.rm = T)$x
  y1<-density(x, na.rm = T)$y

  if(len==1){
    range<-x1>min(x1) & x1<=max(x1)
    polygon(c(min(x1), x1[range],max(x1)), c(0, y1[range], 0),
            col = color_area[1], border = col_border, lwd=dureza)
  }else {
    for (i in 1:len) {
      if(i==1){
        range<-x1>min(x1) & x1<=a[i+1]
        polygon(c(min(x1), x1[range],a[i+1]), c(0, y1[range], 0),
                col = color_area[i], border = col_border, lwd=dureza)
      } else if(i>1 & i<len){
        range<-x1>a[i] & x1<=a[i+1]
        polygon(c(a[i], x1[range], a[i+1]), c(0, y1[range], 0),
                col = color_area[i], border = col_border, lwd=dureza)
      } else {
        range<-x1>a[i] & x1<max(x1)
        polygon(c(a[i], x1[range], max(x1)), c(0, y1[range], 0),
                col = color_area[i], border = col_border, lwd=dureza)
      }
    }
  }
}


# TEST GRUBBS - ELEMENTOS.

#' @title Test de grubbs para determinar outliers.
#' @description Devuelve un valor lógico de TRUE si el elemento del vector es un outliers
#' según el método de detección de outliers de Grubbs.
#' @param x1 Elemento numérico que se desea saber si es outliers o no. Es un elemento del
#' vector `x`.
#' @param x Vector numérico de donde se determina si un elemento es outliers o no.
#' @param alpha Es el nivel de significancia con el que se desea determinar el valor crítico de
#' Grubbs. El valor por defecto es de 0.05.
#' @param num_colas Valor numérico que toma el valor de 1 si se desea calcular el valor
#' crítico a una sola cola. Si toma el valor de 2 se calcula el valor crítico a dos colas.
#' El valor por defecto es de 2 colas.
#' @param vista Valor lógico que toma por defecto TRUE, lo cual implica que en los resultados se
#' muestren el valor estadístico del test de grubbs, el valor crítico del test de grubbs, la
#' comparación que se hace y el resultado que es un valor lógico TRUE o FALSE, donde TRUE indica
#' que el elemento es un outliers.
#' @details Para calcular el estadístico de Grubbs se usa:
#' \deqn{G=\frac{\left|x_i-\bar{x}\right|}{\sigma}}
#' Asimismo, la elección que se hace para saber si el elemento es outliers o no se hace con la
#' siguiente comparación.
#' \deqn{G_t>G_{tc} \rightarrow TRUE \rightarrow \textrm{Es outliers}}
#' \deqn{G_t>G_{tc} \rightarrow FALSE \rightarrow \textrm{No es outliers}}
#' @examples
#' # Definimos primero el siguiente vector.
#' set.seed(2020)
#' x<-c(25, 30, sample(1:10, 30, T), 21)
#'
#' Aplicando el testm para poder ver si el primer elemento es un outliers.
#' test_grubbs(x[2], x)
#' # TRUE
#'
#' si se desea saber si el segundo elemento es un outliers.
#' test_grubbs(x[2], x, vista=TRUE)
#' # $grubbs_test
#' # [1] 3.526906
#' # $grubbs_crit
#' # [1] 2.951949
#' # $decision
#' # [1] "3.52690609285061>2.95194890641393"
#' # $resultado
#' # [1] TRUE
#' @export

test_grubbs<-function(x1, x, alpha=0.05, num_colas=2, vista=TRUE){
  sd<-sqrt(var(x))
  md<-mean(x)

  v_g<-abs(x1-md)/sd

  if(num_colas==2){
    G<-((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(2*length(x)), df=length(x)-2)**2/(length(x)-2+(qt(alpha/(2*length(x)), df=length(x)-2)**2)))
  } else if(num_colas==1){
    G<-((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(length(x)), df=length(x)-2)**2/(length(x)-2+(qt(alpha/(length(x)), df=length(x)-2)**2)))
  } else {
    stop("No es un número de colas permitido.")
  }
  if(vista==FALSE){
    v_g>G
  } else if(vista==TRUE){
    list(Grubbs_test=v_g, Grubbs_critico=G, Elección=paste0(v_g,">",G), Resultado=v_g>G)
  } else{
    stop("Tiene que ser un valor lógico TRUE o FALSE")
  }
}


# TEST GRUBBS - CONJUNTO

#' @title Test de grubbs que sirve para determinar si uno o varios elementos del
#' vector son outliers.
#' @description Devuelve un vector de elementos lógicos, en donde si es TRUE un elemento
#' significa que ese elemento es outliers según el método de Grubss.
#' @param x Vector numérico de donde se determina si uno o varios elemento son outliers o no.
#' @param alpha Es el nivel de significancia con el que se desea determinar el valor crítico de
#' Grubbs. El valor por defecto es de 0.05.
#' @param num_colas Valor numérico que toma el valor de 1 si se desea calcular el valor
#' crítico a una sola cola. Si toma el valor de 2 se calcula el valor crítico a dos colas.
#' El valor por defecto es de 2 colas.
#' @details Para calcular el estadístico de Grubbs se usa:
#' \deqn{G=\frac{\left|x_i-\bar{x}\right|}{\sigma}}
#' Asimismo, la elección que se hace para saber si el elemento es outliers o no se hace con la
#' siguiente comparación.
#' \deqn{G_t>G_{tc} \rightarrow TRUE \rightarrow \textrm{Es outliers}}
#' \deqn{G_t>G_{tc} \rightarrow FALSE \rightarrow \textrm{No es outliers}}
#' @examples
#' # Definimos primero el siguiente vector.
#' set.seed(2020)
#' x<-c(25, sample(1:10, 30, T), 21)
#' Aplicando el test para poder ver que elementos son outliers.
#' grubbs_total(x)
#' #  [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#' #  [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#' #  [22] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#' @export

grubbs_total<-function(x, alpha=0.05, num_colas=2){
  sd<-sqrt(var(x))
  md<-mean(x)
  if(num_colas==2){
    G<-((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(2*length(x)), df=length(x)-2)**2/(length(x)-2+(qt(alpha/(2*length(x)), df=length(x)-2)**2)))
  } else if(num_colas==1){
    G<-((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(length(x)), df=length(x)-2)**2/(length(x)-2+(qt(alpha/(length(x)), df=length(x)-2)**2)))
  } else {
    stop("No es un número de colas permitido.")
  }
  t<-c()
  for (i in 1:length(x)) {
    v_g<-abs(x[i]-md)/sd
    t<-c(t,v_g>G)
  }
  t
}




