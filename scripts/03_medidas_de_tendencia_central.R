# 03. Medidas de tendencia central: ¿cuál es un valor "típico"?
ventas <- read.csv("datos/ventas_tienda.csv", encoding = "UTF-8")

# Media: el promedio. Se deja influir por valores extremos.
mean(ventas$precio_unitario)

# Mediana: el valor del medio. No se deja influir por extremos.
median(ventas$precio_unitario)

# Moda: el valor que más se repite. R no trae una función lista, así que la creamos.
moda <- function(x) {
  x <- x[!is.na(x)]
  tabla <- table(x)
  as.numeric(names(tabla)[tabla == max(tabla)])
}
moda(ventas$unidades)

# Si la media es mayor que la mediana, hay valores altos que la jalan hacia arriba.
# Con el precio pasa: la media es mayor que la mediana.

# Cuando hay datos faltantes (NA), hay que decirle a R que los ignore
mean(ventas$edad_cliente)                    # da NA
mean(ventas$edad_cliente, na.rm = TRUE)      # ya funciona
median(ventas$satisfaccion, na.rm = TRUE)
