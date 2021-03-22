dat<-read.csv(file.choose())
# load packages needed
library("gamlss")
library("gamlss.dist")

# Modelo de parametros de ubicación, escala y forma
muform <- rendimiento ~ pb(TAH) # parametro de ubicación
sigmaform <- tauform  <- nuform  <- ~ pb(TAH) # parametro de escala 


m1 <- gamlss(muform, family=NO, data=na.omit(dat)) # modelo homoscedastico 
m2 <- gamlss(muform, sigmaform, family=NO, data=na.omit(dat)) #  modelo heteroscedastico

# compare by AIC
AIC(m1,m2)
# Observe otras formas de modelar la relación entre
# variables, partiendo de un modelo con dos parametros

m3 <-gamlss(muform, sigmaform, family=LO, data=na.omit(dat)) 
m4 <-gamlss(muform, sigmaform, family=GU, data=na.omit(dat)) 
m5 <-gamlss(muform, sigmaform, family=RG, data=na.omit(dat)) 

# Ahora veamos modelos con distribuciones que requieran 
# tres parametros,
m7 <-gamlss(muform, sigmaform, tauform, family=TF, data=na.omit(dat)) 
m8 <-gamlss(muform, sigmaform, tauform, family=SN1, data=na.omit(dat)) 

# Y ahora veamos otras formas de distribución con 
# cuatro parametros
m22 <-gamlss(muform, sigmaform, tauform, nuform, family=NET, data=na.omit(dat)) 

AIC(m1, m2, m3, m4, m5, m7, m22)
# the 2-parameters Lognormal model seems to give the best fit

#df      AIC
#m3   8.786869 7081.796
#m7  12.682276 7082.380
#m2  10.931932 7088.918
#m1   7.774413 7106.126
#m22  7.539604 7128.675
#m4   5.735842 7137.890
#m5   9.248396 7372.439

par(mfrow=c(1,2))
term.plot(m3, pages = 1, what=c('mu'), xlabs = 'TAH',
          main='Efecto de las TAH sobre el Rendimiento',
          ylabs = 'Rendimiento')
term.plot(m3, pages = 1, what=c('sigma'), xlabs = 'TAH',
          main='Efecto de las TAH sobre el Rendimiento',
          ylabs = 'Rendimiento')
par(mfrow=c(1,1))
