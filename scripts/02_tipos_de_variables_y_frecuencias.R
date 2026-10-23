# 02. Tipos de variables y tablas de frecuencias
# Cualitativa (categorías): ciudad, categoria, canal.
# Cuantitativa discreta (conteos): unidades, satisfaccion.
# Cuantitativa continua (puede tener decimales): precio_unitario.

ventas <- read.csv("datos/ventas_tienda.csv", encoding = "UTF-8")

# Frecuencia absoluta: cuántas ventas hay en cada ciudad
tabla_ciudad <- table(ventas$ciudad)
tabla_ciudad

# Frecuencia relativa: qué proporción es cada una (suma 1) y en porcentaje
round(prop.table(tabla_ciudad), 3)
round(100 * prop.table(tabla_ciudad), 1)

# Lo mismo para categoría y canal, ordenado de mayor a menor
sort(table(ventas$categoria), decreasing = TRUE)
sort(table(ventas$canal), decreasing = TRUE)

# Tabla cruzada: categoría por canal
table(ventas$categoria, ventas$canal)

# Satisfacción (1 a 5): los NA son respuestas que faltan
table(ventas$satisfaccion, useNA = "ifany")
