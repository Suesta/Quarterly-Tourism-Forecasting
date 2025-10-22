# 📊 Quarterly Tourism Forecasting – Castilla y León

**Author:** Víctor Suesta Arribas
**Program:** MSc in Data Science, Universitat Autònoma de Barcelona
**Course:** Time Series Analysis (Academic Project, 2024/25)

---

## 🧠 Project Summary

This project applies **Data Science and statistical modeling techniques** to analyze and forecast the *average duration of trips* in **Castilla y León (Spain)**, using official quarterly data from the **Spanish National Statistics Institute (INE)**.

The objective is to identify **seasonal patterns**, **long-term trends**, and **post-pandemic recovery effects** in tourism behavior. The work follows a complete **data science workflow** —from preprocessing and exploratory analysis to predictive modeling and interpretation— using **R** as the analytical environment.

---

## 🧩 Data Source

* **Dataset:** Quarterly tourism indicators (INE – Spanish National Statistics Institute)
* **Variable:** Average duration of trips (*Duración media de los viajes*)
* **Region:** Castilla y León
* **Period:** Q1 2015 – Q2 2023
* **Frequency:** Quarterly (4 observations per year)
* **Download:** [INE – Tourism of Spanish Residents](https://ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736176990&menu=ultiDatos&idp=1254735576863)

---

## ⚙️ Methodology

Two complementary **forecasting models** were implemented and compared to evaluate predictive performance:

### 1️⃣ Holt-Winters Exponential Smoothing

* Additive model capturing both **trend** and **seasonality**.
* Suitable for **short-term forecasting** in periodic data.
* Provides interpretable components (`level`, `trend`, `seasonal`).

Model equations:

```
Lt = α(Yt − St) + (1 − α)(Lt−1 + Tt−1)
Tt = β(Lt − Lt−1) + (1 − β)Tt−1
St = γ(Yt − Lt) + (1 − γ)St−4
Ŷt = Lt + Tt + St
```

### 2️⃣ Linear Regression with Seasonal Dummies

* Captures the **global upward or downward trend** in the data.
* Less accurate for seasonal fluctuations, but interpretable and easy to communicate.

Model equation:

```
Ŷt = β₀ + β₁·time + β₂·quarter
```

---

## 📈 Forecast Results

| Period  | Holt-Winters (days) | Linear Regression (days) |
| :------ | :-----------------: | :----------------------: |
| 2024 Q3 |         6.38        |           3.03           |
| 2024 Q4 |         3.29        |           2.87           |
| 2025 Q1 |         3.13        |           6.37           |
| 2025 Q2 |         2.89        |           3.26           |

---

## 📊 Insights & Interpretation

* **Holt-Winters** effectively captures **quarterly seasonality**, with recurrent peaks in **summer (Q3)** and troughs in **winter (Q1)**.
* **Regression** highlights the **long-term trend** of recovery after the pandemic.
* The forecasts reveal **stabilization** in travel duration and sustained recovery since 2022.

---

## 🧮 Data Science Workflow

1. **Data preprocessing:** filtering, type conversion, and temporal ordering.
2. **Exploratory analysis:** visualization, decomposition, and descriptive insights.
3. **Modeling:** Holt-Winters and regression fitting.
4. **Forecasting:** next six quarters (2024–2025).
5. **Evaluation:** comparison of interpretability and seasonal fit.
6. **Communication:** results presented through visual summaries and slides.

---

## 🧠 Key Data Science Competencies Demonstrated

* Time Series Forecasting
* Statistical Modeling and Predictive Analytics
* Data Preprocessing and Transformation in R
* Visualization with ggplot2
* Interpretation of Temporal Patterns
* Reproducible Analytical Workflow

---

## 🗂️ Repository Structure

```
Quarterly-Tourism-Forecasting/
│
├── 1638272_Slides_Series_Temporals.pdf   # Final presentation slides
├── Codis en R.R                          # Full R script used for analysis
├── Instruccions 1erLliurament ST Curs 24.pdf  # Official assignment statement
├── LICENSE                               # MIT license
└── README.md                             # Project documentation
```

---

## 🧩 Tools & Libraries

* **R** (v4.x)
* `forecast` – Time series modeling and smoothing
* `ggplot2` – Data visualization
* `zoo` – Quarterly time series management

---

## 📄 License

This project is distributed under the **MIT License** — free to use, reproduce, and modify with attribution.

---

## 💼 Tags

`Data Science` · `Time Series` · `Forecasting` · `R Programming` · `Predictive Analytics` · `Statistical Modeling` · `Tourism Data`
