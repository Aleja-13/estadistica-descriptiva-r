# 04. Medidas de dispersión: ¿qué tanto se separan los datos entre sí?
ventas <- read.csv("datos/ventas_tienda.csv", encoding = "UTF-8")
precio <- ventas$precio_unitario

range(precio)                 # mínimo y máximo
diff(range(precio))           # rango = máximo - mínimo
var(precio)                   # varianza (en unidades al cuadrado)
sd(precio)                    # desviación estándar (en las mismas unidades que el precio)

# Coeficiente de variación: la desviación como porcentaje de la media.
# Sirve para comparar variables con unidades distintas.
cv <- sd(precio) / mean(precio) * 100
cv

# Cuartiles y rango intercuartílico (IQR): el 50% central de los datos
quantile(precio)                       # mín, Q1, mediana, Q3, máx
quantile(precio, probs = c(0.10, 0.90))  # percentiles 10 y 90
IQR(precio)

# Un resumen completo en una sola línea
summary(precio)
