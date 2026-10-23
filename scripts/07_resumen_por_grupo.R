# 07. Resumen por grupos: comparar categorías y ciudades
ventas <- read.csv("datos/ventas_tienda.csv", encoding = "UTF-8")
ventas <- ventas[ventas$unidades < 60, ]
ventas$ingreso <- ventas$unidades * ventas$precio_unitario * (1 - ventas$descuento_pct / 100)

# Media del precio por categoría
aggregate(precio_unitario ~ categoria, data = ventas, FUN = mean)

# Varias medidas a la vez
resumen <- aggregate(ingreso ~ categoria, data = ventas,
                     FUN = function(x) c(n = length(x), media = mean(x), mediana = median(x), sd = sd(x)))
resumen

# Ingreso total por ciudad, de mayor a menor
ing_ciudad <- tapply(ventas$ingreso, ventas$ciudad, sum)
round(sort(ing_ciudad, decreasing = TRUE), 2)

# Satisfacción promedio por canal (ignorando faltantes)
round(tapply(ventas$satisfaccion, ventas$canal, mean, na.rm = TRUE), 2)
