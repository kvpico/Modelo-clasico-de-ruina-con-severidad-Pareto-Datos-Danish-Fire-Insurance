# Modelo-clasico-de-ruina-con-severidad-Pareto-Datos-Danish-Fire-Insurance
Implementación del modelo clásico de riesgo con severidades Pareto ajustadas mediante máxima verosimilitud, utilizando datos reales de incendios en Dinamarca (1980–1990). Se incluye cálculo del exponente de Laplace, aproximación numérica de la función de escala vía Gaver–Stehfest y estimación de la probabilidad de ruina.

 Descripción del Proyecto:

Este repositorio contiene la implementación computacional del modelo clásico de riesgo aplicado al conjunto de datos Danish Fire Insurance Claims (1980–1990).
Se ajusta una distribución Pareto Tipo I a las reclamaciones mediante el metodo de  máxima verosimilitud y se construye el modelo de riesgo espectralmente negativo:

𝑋(𝑡)=𝑢+𝑐𝑡−∑𝑖=1𝑁(𝑡)𝜉𝑖

donde:

𝑁(𝑡) es un proceso Poisson con intensidad estimada,
𝜉𝑖 siguen una distribución Pareto ajustada

Objetivo:

Analizar el impacto de las reclamaciones de cola pesada en la estabilidad financiera bajo el modelo clásico de riesgo.

El proyecto incluye:

Estimación MLE de la distribución Pareto
Cálculo numérico del exponente de Laplace
Inversión numérica de Laplace
Construcción de la función de escala W(x)
Aplicación del Teorema de tiempo de ruina
Análisis de sensibilidad respecto a α (cola pesada)

Resultados Principales:

Severidades con cola pesada α=1.2707
Varianza infinita
Decaimiento polinómico de la probabilidad de ruina
Alta persistencia del riesgo extremo

Implementación:

El código está desarrollado en R e incluye:

Ajuste de distribuciones
Integración numérica
Aproximación Gaver–Stehfest
Simulación de trayectorias
Gráficos de probabilidad de ruina

