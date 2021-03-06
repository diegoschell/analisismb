library(ggplot2)
library(GGally)

setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")

imgdicsojamarzoEC2 <- as.data.frame(read.csv(file = "ultimaversion/imgdic-sojamarzoEC2.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgdicsojamarzoEC2) <-c("YieldMas","YieldWet", "Dryield", "HarvestM", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                               "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "FPAR")
#elimino la columna fpar de la tabla original

imgdicsojamarzoEC2 <- imgdicsojamarzoEC2[-20]

#creo una columna nueva "RVI" y le pongo valor cero

imgdicsojamarzoEC2["RVI"] <- 0

#paso RVI a no dato 
imgdicsojamarzoEC2$RVI[ imgdicsojamarzoEC2$RVI == 0] <-NA

#hago coincidir datos de las tablas

imgfebsojamarzoEC2  <- as.data.frame(read.csv(file = "ultimaversion/imgfeb-sojamarzoEC2.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgfebsojamarzoEC2) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                                "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "FPAR", "RVI")


#elimino la  NDWI
imgfebsojamarzoEC2 <- imgfebsojamarzoEC2 [-22]
imgfebsojamarzoEC2 <- imgfebsojamarzoEC2 [-20]
# calculo las correlaciones de cada tabla y creo un csv

indices <-c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
            "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")

correlacionesimgdic<- as.data.frame(cor(imgdicsojamarzoEC2))
correlacionesimgfeb<- as.data.frame(cor(imgfebsojamarzoEC2))

correlacionesimgdic <- correlacionesimgdic["YieldMas", indices]
correlacionesimgfeb <- correlacionesimgfeb["YieldMas", indices]


joindata <- rbind(correlacionesimgdic, correlacionesimgfeb)
datosfinal<- as.data.frame.matrix(joindata)


write.csv(datosfinal, "ultimaversion/correlacionsojaEC2.csv")

meses <- c("Dic", "Feb")
#scale_y_continuous(breaks=seq(-1,1,0.1))
ggplot(datosfinal, aes(x = meses, y = value, color = indices, group = 3)) +  ggtitle("Correlaciones Maiz marzo CMB2") + labs(x = "Mes") +  
  geom_point(aes(y = datosfinal$GEMI, col = "GEMI"), shape=1, size=3)+  
  geom_point(aes(y = datosfinal$GNDVI, col = "GNDVI"), shape=2, size=3)+
  geom_point(aes(y = datosfinal$IRECI, col = "IRECI"), shape=3, size=3)+
  geom_point(aes(y = datosfinal$MCARI, col = "MCARI"), shape=4, size=3)+
  geom_point(aes(y = datosfinal$MSAVI, col = "MSAVI"), shape=5, size=3)+
  geom_point(aes(y = datosfinal$MTCI, col = "MTCI"), shape=6, size=3)+
  geom_point(aes(y = datosfinal$NDI45, col = "NDVI45"), shape=7, size=3)+
  geom_point(aes(y = datosfinal$NDVI, col = "NDVI"), shape=8, size=3)+
  geom_point(aes(y = datosfinal$REIP, col = "REIP"), shape=9, size=3)+
  geom_point(aes(y = datosfinal$SAVI, col = "SAVI"), shape=10, size=3)+
  geom_point(aes(y = datosfinal$TNDVI, col = "TNDVI"), shape=11, size=3)+
  geom_point(aes(y = datosfinal$S2REP, col = "S2REP"), shape=12, size=3)+
  geom_point(aes(y = datosfinal$EVI, col = "EVI"), shape=13, size=3)+
  geom_point(aes(y = datosfinal$TSAVI, col = "TSAVI"), shape=14, size=3)+
  geom_point(aes(y = datosfinal$RVI, col = "RVI"), shape=15, size=3)+
  geom_point(aes(y = datosfinal$LAI, col = "LAI"), shape=16, size=3)+
  geom_line(aes(y = datosfinal$GEMI, col = "GEMI" ))+ 
  geom_line(aes(y = datosfinal$GNDVI, col = "GNDVI"))+
  geom_line(aes(y = datosfinal$IRECI, col = "IRECI"))+
  geom_line(aes(y = datosfinal$MCARI, col = "MCARI"))+
  geom_line(aes(y = datosfinal$MSAVI, col = "MSAVI"))+
  geom_line(aes(y = datosfinal$MTCI, col = "MTCI"))+
  geom_line(aes(y = datosfinal$NDI45, col = "NDVI45"))+
  geom_line(aes(y = datosfinal$NDVI, col = "NDVI"))+
  geom_line(aes(y = datosfinal$REIP, col = "REIP"))+
  geom_line(aes(y = datosfinal$SAVI, col = "SAVI"))+
  geom_line(aes(y = datosfinal$TNDVI, col = "TNDVI"))+
  geom_line(aes(y = datosfinal$S2REP, col = "S2REP"))+
  geom_line(aes(y = datosfinal$EVI, col = "EVI"))+
  geom_line(aes(y = datosfinal$TSAVI, col = "TSAVI"))+
  geom_line(aes(y = datosfinal$RVI, col = "RVI"))+
  geom_line(aes(y = datosfinal$LAI, col = "LAI")) + scale_y_continuous(limits = c(-1,1),breaks=seq(-0.8,0.8,0.1)) 
