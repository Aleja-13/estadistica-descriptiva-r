# 01. Importar los datos y mirarlos por primera vez
# Antes de calcular nada, conviene saber qué tenemos: cuántas filas, qué columnas y de qué tipo.

# Fija la carpeta del repositorio como directorio de trabajo (Session > Set Working Directory).
ventas <- read.csv("datos/ventas_tienda.csv", encoding = "UTF-8")

dim(ventas)        # filas y columnas (esperado: 300 filas, 10 columnas)
names(ventas)      # nombres de las variables
head(ventas)       # primeras 6 filas
str(ventas)        # tipo de cada variable (número, texto...)
summary(ventas)    # resumen rápido de todas las columnas

# La fecha llegó como texto. La convertimos a fecha de verdad.
ventas$fecha <- as.Date(ventas$fecha)
range(ventas$fecha)   # primera y última venta
