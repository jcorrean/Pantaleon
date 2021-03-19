# Script de Modelo de Regresión Paramétrica con No-Parametrica
library("np")
data("cps71")
model.parametrico <- lm(logwage ~ age + I(age^2), data = cps71)
mp <- summary(model.parametrico)

#### Ahora vamos con un modelo NO-PARAMÉTRICO

model.noparametrico <- npreg(logwage ~ age,
                    regtype = "ll", 
                  bwmethod = "cv.aic", 
                  gradients = TRUE, 
                  data = cps71)


summary(model.noparametrico)
npsigtest(model.noparametrico)


### Comparemos resultados de ajuste global
model.noparametrico$R2
mp$r.squared

# Lecciones aprendidas
# El resultado del modelo paramétrico difiere numéricamente 
# del resultado del modelo no paramétrico. La pregunta obvia
# es entonces ¿A cuál modelo le hacemos caso?
