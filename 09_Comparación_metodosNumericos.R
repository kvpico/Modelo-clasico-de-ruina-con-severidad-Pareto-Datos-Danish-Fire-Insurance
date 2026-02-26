###############################################################
# 06_Comparación_metodosNumericos.R
# Comparación numérica de métodos de inversión de Laplace
# Modelo con solución exacta conocida
#
# Métodos:
# - Gaver–Stehfest
# - Integral de Bromwich
###############################################################

###############################################################
# 1. Parámetros del modelo (caso con solución cerrada)
###############################################################

c      <- 1
mu     <- 1
lambda <- 2

###############################################################
# 2. Función de escala exacta W(x)
###############################################################
# Derivada analíticamente para este modelo exponencial

W_exact <- function(x){
  (1/c) * (
    1 +
      (mu/(c*lambda - mu)) *
      (1 - exp(-(lambda - mu/c)*x))
  )
}

###############################################################
# 3. Exponente de Laplace ψ(s)
###############################################################

psi <- function(s){
  c*s - mu + (lambda*mu)/(s + lambda)
}

Laplace_W <- function(s){
  1/psi(s)
}

###############################################################
# 4. Método Gaver–Stehfest
###############################################################

gaver_stehfest <- function(t, N=6){

  if(N %% 2 != 0){
    stop("N debe ser par")
  }

  V <- numeric(N)

  for(i in 1:N){
    sum_term <- 0
    for(k in ceiling(i/2):min(i,N/2)){
      sum_term <- sum_term +
        k^(N/2) * factorial(2*k) /
        ( factorial(N/2-k) *
            factorial(k) *
            factorial(k-1) *
            factorial(i-k) *
            factorial(2*k-i) )
    }
    V[i] <- (-1)^(i+N/2)*sum_term
  }

  approx <- 0
  for(i in 1:N){
    approx <- approx +
      V[i]*Laplace_W(i*log(2)/t)
  }

  log(2)/t * approx
}

###############################################################
# 5. Método Integral de Bromwich
###############################################################

bromwich <- function(t, n=900, c0=0.5){

  omega_max <- 50
  omega <- seq(0, omega_max, length.out=n)

  integrand <- Re(
    exp((c0+1i*omega)*t) *
      Laplace_W(c0+1i*omega)
  )

  trap <- sum(integrand[-1]+integrand[-n]) *
    (omega_max/(n-1))/2

  trap/pi
}

###############################################################
# 6. Comparación gráfica
###############################################################

x_vals <- seq(0.2,1.6,length.out=200)

W_ex <- sapply(x_vals,W_exact)
W_gs <- sapply(x_vals,gaver_stehfest)
W_br <- sapply(x_vals,bromwich)

plot(x_vals,W_ex,
     type="l",
     col="red",
     lwd=2,
     ylim=range(W_ex),
     xlab="x",
     ylab="W(x)",
     main="Comparación de métodos de inversión")

lines(x_vals,W_gs,
      col="blue",
      lty=2,
      lwd=2)

lines(x_vals,W_br,
      col="black",
      lty=3,
      lwd=2)

legend("bottomright",
       legend=c("Exacta","Gaver–Stehfest","Bromwich"),
       col=c("red","blue","black"),
       lty=c(1,2,3),
       lwd=2)
