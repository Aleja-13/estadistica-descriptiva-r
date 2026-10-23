# Estadística descriptiva con R

Guía práctica para aprender a **describir un conjunto de datos** con R: qué tipo de variables hay, cuál es un valor típico, qué tanto varían los datos, cómo detectar errores y cómo resumirlos en tablas y gráficos.

Está pensada para estudiantes y para quien empieza en análisis de datos. No necesitas experiencia previa en R. Los scripts usan solo R base, sin paquetes adicionales.

## Los datos

`datos/ventas_tienda.csv` tiene 300 ventas de una tienda en línea **ficticia** en cuatro ciudades (Bogotá, Medellín, Cali y Barranquilla), entre enero y junio de 2026.

> **Importante:** los datos son **simulados**. No corresponden a ningún negocio real. Los generé con `datos/generar_datos.py` (semilla fija, siempre da el mismo archivo) para poder practicar sin usar información de nadie.

| Variable | Qué es | Tipo |
|---|---|---|
| `id` | Número de venta | Identificador |
| `fecha` | Fecha de la venta | Fecha |
| `ciudad`, `categoria`, `canal` | Dónde, qué y por dónde se vendió | Cualitativa |
| `unidades` | Unidades vendidas | Cuantitativa discreta |
| `precio_unitario` | Precio por unidad (USD, ficticio) | Cuantitativa continua |
| `descuento_pct` | Descuento aplicado (%) | Cuantitativa discreta |
| `satisfaccion` | Puntaje del cliente, de 1 a 5 | Ordinal |
| `edad_cliente` | Edad del cliente | Cuantitativa discreta |

Para que la práctica se parezca a la vida real, el archivo trae a propósito **12 respuestas de satisfacción y 8 edades faltantes**, y **una venta de 60 unidades** que parece un error de digitación.

## Cómo usarlo

1. Descarga o clona este repositorio.
2. Abre RStudio y fija la carpeta del repositorio como directorio de trabajo (`Session > Set Working Directory > Choose Directory`).
3. Ejecuta los scripts en orden, línea por línea, y mira qué responde R.

## Contenido

| Script | Qué aprendes |
|---|---|
| `01_importar_y_explorar.R` | Importar un CSV y mirarlo por primera vez |
| `02_tipos_de_variables_y_frecuencias.R` | Tipos de variables, tablas de frecuencias y tablas cruzadas |
| `03_medidas_de_tendencia_central.R` | Media, mediana y moda, y cuándo usar cada una |
| `04_medidas_de_dispersion.R` | Rango, varianza, desviación estándar, coeficiente de variación, cuartiles e IQR |
| `05_atipicos_y_faltantes.R` | Detectar datos faltantes y valores atípicos |
| `06_graficos_basicos.R` | Barras, histograma, diagrama de cajas |
| `07_resumen_por_grupo.R` | Comparar categorías, ciudades y canales |

## Resultados de referencia

Para que compruebes que todo te funciona, esto es lo que debes obtener:

- El archivo tiene **300 filas y 10 columnas**. Hay **115** ventas en Bogotá, **96** en Medellín, **53** en Cali y **36** en Barranquilla.
- Precio unitario: **media 87.59**, **mediana 61.02**, desviación estándar **69.48**. La media es mayor que la mediana porque hay productos caros (tecnología) que la jalan hacia arriba.
- Faltantes: **12** en `satisfaccion` y **8** en `edad_cliente`. Quedan **281** filas completas.
- Unidades vendidas: la moda es **1**. Con el error de digitación la media es **2.35** y la desviación **3.59**. Sin él, la media baja a **2.16** y la desviación a **1.32**. Un solo dato mal escrito casi triplica la desviación.
- Con la regla del IQR, el único valor atípico en `unidades` es la venta de 60.

## Autoría

Material y código de Alejandra González, con fines educativos. Más sobre mi trabajo en analítica de datos: [alejadata.pro](https://alejadata.pro/).
