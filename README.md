
<!-- README.md is generated from README.Rmd. Please edit that file -->
BIENVENIDOS!!!
==============

EN LA SIGUIENTE GUÍA SE MOSTRARÁ COMO USAR EL PAQUETE DATAMETRÍA.
=================================================================

FUNCIONES.
----------

El paquete está en pleno desarrollo, por el momento sólo contamos con 7 funciones:

1.  **limpiecito**: Esta función limpia elementos o vectores caracter, quitándo las tildes, espacios en blanco al inicio, entre caracteres y al final. Tiene la opción de arrojar los resultados en minúsculas o mayúsculas.
2.  **estadisticos**: Esta función permite calcular los principales estadísticos como: la media, mediana, desviación estándar, mínimo, máximo, coeficiente de variación y el total de observaciones.
3.  **dpto\_peru**: Esta función permite convertir el ubigeo de las regiones de Perú a su descripción, es decir, al nombre de la región.
4.  **n\_percentil**: Esta función permite calcular el número de elementos de un vector que pertenecen a un determinado percentil. Arroja los resultados mostrando los puntos de corte o por bloques determinados por el percentil.
5.  **test\_grubbs**: Test que permite determinar si un elemento de un vector es outliers, mediante el test de grubss. Esta función tiene la opción de arrojar como resultado un valor lógico o todos los estadísticos de grubbs que se usaron para determinar si es o no outliers.
6.  **grubss\_total**: Esta función realiza, el test de grubbs, que sirve para determinar si uno o varios elementos del vector son outliers.
7.  **area\_quantile**: Esta función grafica la funciones de densidad y divide el gráfico por percetiles.

Para usar el paquete primero se tiene que instalar el paquete `devtools` (si aún no lo tienes instalado).

``` r
install.packages("devtools")
```

Una vez instalado `devtools`, se procede a descargar el paquete `datametria`, para lo cual digitamos el siguiente código:

``` r
devtools::install_github("CesarAHN/datametria")
```

Una vez descargado, se tiene que cargar el paquete `datametria`. Para esto corremos el siguiente código:

``` r
library(datametria)
```

EJEMPLOS DE COMO USAR LAS FUNCIONES:
------------------------------------

### FUNCIÓN limpiecito():

La función `limpiecito()` es una función para limpiar espacios por demás al inicio, final o intermedio. Asimismo elimina tildes y arroja los resultados en letras mayúsculas o minúsculas. Esta función sólo recibe dos parámetros: `x` que es un elemento o vector caracter y `capital` que es un valor lógico que si toma el valor de `TRUE` arrojará los resultados en mayúsculas, mientras que si toma el valor `FALSE` arrojará los resultados en minúsuculas, el valor por defecto es `TRUE`.

Veamos un ejemplo de uso.

Si se tiene el siguiente vector:

``` r
x<-c("   mucho    espacio", "VAYA      de     espacios    ", "CÓMO se hicieron    tantos espacios   ")
x
# [1] "   mucho    espacio"                   
# [2] "VAYA      de     espacios    "         
# [3] "CÓMO se hicieron    tantos espacios   "
```

Como se puede ver el vector `x` tiene 3 elementos caracter y cada elemento tienen más de un espacio ya sea al inicio, intermedio o fin, además hay palabras con mayúscula y minúsculas, y por último, palabras con tildes. Entonces, si queremos que el vector `x` tenga una estructura homogénea tendremos que usar la función `limpiecito()`.

Veamos como:

``` r
# Si deseamos que los resultados del vector x sean mayúsculas.
limpiecito(x)
# [1] "MUCHO ESPACIO"                    "VAYA DE ESPACIOS"                
# [3] "COMO SE HICIERON TANTOS ESPACIOS"
```

Gracias a la función `limpiecito()` se ha podido eliminar los espacios y homogenizar las palabras quitandole las tíldes y convirtiendo todo a mayúscula.

Pero si nosotros deseamos que los resultados estén en minúsculas, entonces, usaremos el argumento `capital`. Veamos como:

``` r
# Si deseamos que los resultados del vector x sean minúsculas.
limpiecito(x, capital = FALSE)
# [1] "mucho espacio"                    "vaya de espacios"                
# [3] "como se hicieron tantos espacios"
```
