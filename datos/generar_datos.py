"""Genera datos SIMULADOS (ficticios) de una tienda en línea con ventas en cuatro ciudades.
Semilla fija: siempre produce el mismo archivo. No son datos reales de ningún negocio."""
import csv, random, datetime
random.seed(2026)
ciudades = ["Bogotá", "Medellín", "Cali", "Barranquilla"]
pesos_ciudad = [0.40, 0.28, 0.20, 0.12]
categorias = {"Hogar": (45, 12), "Tecnología": (180, 50), "Moda": (70, 20), "Belleza": (35, 9)}
canales = ["Instagram", "Sitio web", "WhatsApp"]
filas = []
inicio = datetime.date(2026, 1, 1)
for i in range(1, 301):
    ciudad = random.choices(ciudades, pesos_ciudad)[0]
    cat = random.choice(list(categorias))
    mu, sd = categorias[cat]
    precio = max(5, round(random.gauss(mu, sd), 2))
    unidades = random.choices([1, 2, 3, 4, 5, 6], [45, 25, 14, 8, 5, 3])[0]
    desc = random.choice([0, 0, 0, 5, 10, 15, 20])
    sat = random.choices([1, 2, 3, 4, 5], [4, 8, 20, 38, 30])[0]
    edad = int(min(75, max(18, round(random.gauss(34, 10)))))
    fecha = inicio + datetime.timedelta(days=random.randint(0, 179))
    filas.append([i, fecha.isoformat(), ciudad, cat, random.choice(canales), unidades, precio, desc, sat, edad])
# Un valor atípico a propósito (error de digitación) y datos faltantes a propósito
filas[149][5] = 60
for idx in random.sample(range(300), 12): filas[idx][8] = ""
for idx in random.sample(range(300), 8): filas[idx][9] = ""
with open("ventas_tienda.csv", "w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(["id", "fecha", "ciudad", "categoria", "canal", "unidades", "precio_unitario", "descuento_pct", "satisfaccion", "edad_cliente"])
    w.writerows(filas)
