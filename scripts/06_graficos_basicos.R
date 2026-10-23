# 06. Gráficos básicos con R base (no necesita instalar paquetes)
ventas <- read.csv("datos/ventas_tienda.csv", encoding = "UTF-8")
ventas <- ventas[ventas$unidades < 60, ]   # sin el error de digitación (ver script 05)

dir.create("graficos", showWarnings = FALSE)
png("graficos/01_ventas_por_ciudad.png", width = 900, height = 600, res = 120)
barplot(sort(table(ventas$ciudad), decreasing = TRUE),
        main = "Número de ventas por ciudad", ylab = "Ventas", col = "steelblue")
dev.off()

png("graficos/02_histograma_precio.png", width = 900, height = 600, res = 120)
hist(ventas$precio_unitario, breaks = 15, col = "tomato", border = "white",
     main = "Distribución del precio unitario", xlab = "Precio (USD, datos ficticios)")
abline(v = mean(ventas$precio_unitario), lwd = 2)
abline(v = median(ventas$precio_unitario), lwd = 2, lty = 2)
legend("topright", legend = c("Media", "Mediana"), lty = c(1, 2), lwd = 2)
dev.off()

png("graficos/03_precio_por_categoria.png", width = 900, height = 600, res = 120)
boxplot(precio_unitario ~ categoria, data = ventas, col = "lightgreen",
        main = "Precio por categoría", xlab = "", ylab = "Precio (USD, datos ficticios)")
dev.off()

png("graficos/04_satisfaccion.png", width = 900, height = 600, res = 120)
barplot(table(ventas$satisfaccion), col = "goldenrod",
        main = "Satisfacción del cliente (1 a 5)", xlab = "Puntaje", ylab = "Clientes")
dev.off()
