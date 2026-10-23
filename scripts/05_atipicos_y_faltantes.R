# 05. Valores atípicos y datos faltantes
ventas <- read.csv("datos/ventas_tienda.csv", encoding = "UTF-8")

# --- Datos faltantes ---
colSums(is.na(ventas))                       # cuántos NA hay en cada columna
round(100 * colMeans(is.na(ventas)), 1)      # en porcentaje
filas_completas <- ventas[complete.cases(ventas), ]
nrow(filas_completas)                        # filas sin ningún faltante

# --- Valores atípicos con la regla del IQR ---
# Es atípico lo que queda por debajo de Q1 - 1.5*IQR o por encima de Q3 + 1.5*IQR
q <- quantile(ventas$unidades, c(0.25, 0.75))
iqr <- q[2] - q[1]
limite_sup <- q[2] + 1.5 * iqr
limite_inf <- q[1] - 1.5 * iqr
atipicos <- ventas[ventas$unidades > limite_sup | ventas$unidades < limite_inf, ]
nrow(atipicos)
atipicos[order(-atipicos$unidades), c("id", "ciudad", "categoria", "unidades")]

# Una venta de 60 unidades en un producto de consumo personal parece un error de digitación.
# Qué le hace a la media y a la desviación:
mean(ventas$unidades); sd(ventas$unidades)
sin_error <- ventas[ventas$unidades < 60, ]
mean(sin_error$unidades); sd(sin_error$unidades)
# Regla práctica: investiga el dato antes de borrarlo. Si es un error, corrígelo o exclúyelo y déjalo documentado.
