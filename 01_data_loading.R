###############################################################
# 01_data_loading.R
# Modelo clásico de riesgo – Danish Fire Insurance Data
# Autor: Karen Pico
# Descripción:
# Carga y visualización inicial del conjunto de datos
# Danish Fire Insurance Claims (1980–1990)
###############################################################

# -------------------------------------------------------------
# 1. Instalación y carga de paquetes
# -------------------------------------------------------------

# Instalar solo si no está instalado
if(!require(evir)){
  install.packages("evir")
  library(evir)
} else {
  library(evir)
}

# -------------------------------------------------------------
# 2. Cargar el conjunto de datos
# -------------------------------------------------------------

data(danish)

# 'danish' contiene 2167 pérdidas por incendio las pérdidas están expresadas en millones de coronas danesas (DKK)

# observaciones
head(danish)

# Resumen descriptivo
summary(danish)

# Verificamos el  tamaño
n <- length(danish)
cat("Número total de observaciones:", n, "\n")

# -------------------------------------------------------------
# 3. Construcción de eje temporal artificial
# -------------------------------------------------------------

# Con este paquete el dataset no incluye fechas exactas y para tener la visualización exploratoria, construimos una secuencia uniforme de fechas entre 1980 y 1990.

date_seq <- seq(
  as.Date("1980-01-01"),
  as.Date("1990-12-31"),
  length.out = n
)

# -------------------------------------------------------------
# 4. Gráfico de dispersión de pérdidas
# -------------------------------------------------------------

plot(
  date_seq,
  danish,
  main = "Incendios en Dinamarca (1980–1990)",
  xlab = "Fecha",
  ylab = "Pérdida (millones DKK)",
  pch = 1,
  col = "steelblue",
  cex = 0.6
)

grid(col = "lightgray", lty = "dotted")

# -------------------------------------------------------------
# 5. RESUMEN OBTENIDO
# -------------------------------------------------------------
# El gráfico permite observar:
# - Alta concentración de pérdidas pequeñas
# - Presencia de valores extremos
# - Evidencia visual de asimetría positiva
# - Posible comportamiento de cola pesada
