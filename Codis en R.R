library(forecast)  
library(ggplot2)   
library(zoo)       

#càrrega de dades
setwd("C:/Users/victo/Downloads")  
df <- read.csv("DATASET.csv", sep=";", fileEncoding="ISO-8859-1")
df1 <- subset(df, Destino == "07 Castilla y León")
df2 <- subset(df1, Concepto.turístico == "Duración media de los viajes") 

# Preparació de les dades
total <- df2$Total
total_bien <- as.numeric(gsub(',', '.', gsub('[.]', '', total)))
datos_ord <- total_bien[order(df2$Periodo)] 
periodos <- as.yearqtr(df2$Periodo[order(df2$Periodo)], format="%YQ%q")
ts_data <- ts(datos_ord, start=c(2015, 1), frequency=4) 

# Anàlisi descriptiva
plot(ts_data, main="Duració mitjana dels viatges a Castilla y León", col="blue", lwd=2, ylab="Dies", xlab="Any")
decompose_result <- decompose(ts_data, type="additive")
plot(decompose_result)

# Model Holt-Winters
hw_model <- HoltWinters(ts_data, seasonal="additive")
hw_forecast <- forecast(hw_model, h=6)  
plot(hw_forecast, main="Pronòstic Holt-Winters")

# Fórmules del model Holt-Winters
cat("Fórmules de Holt-Winters:\n")
cat("Lt = α*(Yt – St) + (1 – α)*(Lt-1 + Tt-1)\n")
cat("Tt = β*(Lt – Lt-1) + (1 – β)*Tt-1\n")
cat("St = γ*(Yt – Lt) + (1 – γ)*St-4\n")
cat("Yt = Lt-1 + Tt-1 + St\n")

# Resultats detallats de Holt-Winters
cat("Pronòstics Holt-Winters (en dies):\n")
cat("2024T3:", round(hw_forecast$mean[1], 2), "dies\n")
cat("2024T4:", round(hw_forecast$mean[2], 2), "dies\n")
cat("2025T1:", round(hw_forecast$mean[3], 2), "dies\n")
cat("2025T2:", round(hw_forecast$mean[4], 2), "dies\n")

# Model de regressió
time <- 1:length(ts_data)
quarter <- cycle(ts_data)
reg_model <- lm(ts_data ~ time + as.factor(quarter))
summary(reg_model)

# Pronòstics amb regressió
future_time <- seq(length(ts_data) + 1, length(ts_data) + 6)
future_quarter <- rep(1:4, length.out=6)
future_data <- data.frame(time=future_time, quarter=future_quarter)
reg_forecast <- predict(reg_model, newdata=future_data)

# Gràfic amb el pronòstic de regressió
plot(ts_data, main="Pronòstic amb Regresió Lineal", col="blue", lwd=2, ylab="Dies", xlab="Any")
lines(future_time, reg_forecast, col="red", lwd=2)

# Fórmula del model de regressió
cat("Fórmula del model de regressió:\n")
cat("Yt = β0 + β1*time + β2*quarter\n")

# Resultats detallats de la regressió
cat("Pronòstics Regressió (en dies):\n")
cat("2024T3:", round(reg_forecast[1], 2), "dies\n")
cat("2024T4:", round(reg_forecast[2], 2), "dies\n")
cat("2025T1:", round(reg_forecast[3], 2), "dies\n")
cat("2025T2:", round(reg_forecast[4], 2), "dies\n")

# Conclusions
cat("Conclusions:\n")
cat("- El model Holt-Winters captura millor l'estacionalitat, amb valors coherents en cada trimestre.\n")
cat("- La regressió lineal és útil per identificar la tendència global, però no captura l'estacionalitat de manera precisa.\n")
cat("- Els pronòstics mostren estabilitat amb lleugeres variacions estacionals.\n")
