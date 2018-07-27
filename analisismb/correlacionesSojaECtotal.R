library(ggplot2)
library(GGally)

setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")

imgdicsojamarzoECtotal <- as.data.frame(read.csv(file = "ultimaversion/imgdic-sojamarzoECtotal.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgdicsojamarzoECtotal) <-c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                               "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI")
#elimino la columna fpar de la tabla original



#creo una columna nueva "RVI" y le pongo valor cero

imgdicsojamarzoECtotal["RVI"] <- 0

#paso RVI a no dato  
imgdicsojamarzoECtotal$RVI[ imgdicsojamarzoECtotal$RVI == 0] <-NA

#hago coincidir datos de las tablas

imgfebsojamarzoECtotal <- as.data.frame(read.csv(file = "ultimaversion/imgfeb-sojamarzoECtotal.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgfebsojamarzoECtotal) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                                   "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")




# calculo las correlaciones de cada tabla y creo un csv

indices <-c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
            "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")

correlacionesimgdic<- as.data.frame(cor(imgdicsojamarzoECtotal))
correlacionesimgfeb<- as.data.frame(cor(imgfebsojamarzoECtotal))

correlacionesimgfeb <- correlacionesimgfeb["YieldMas", indices]
correlacionesimgdic <- correlacionesimgdic["YieldMas", indices]


joindata <- rbind(correlacionesimgdic, correlacionesimgfeb)
datosfinal<- as.data.frame.matrix(joindata)


write.csv(datosfinal, "ultimaversion/correlacionsojaECtotal.csv")

meses <- c("Dic", "Feb")
#scale_y_continuous(breaks=seq(-1,1,0.1))
ggplot(datosfinal, aes(x = meses, y = value, color = indices, group = 2)) +  ggtitle("Correlaciones Soja EC1") + labs(x = "Mes") +  
  geom_point(aes(y = datosfinal$GEMI, col = "GEMI"))+  
  geom_point(aes(y = datosfinal$GNDVI, col = "GNDVI"))+
  geom_point(aes(y = datosfinal$IRECI, col = "IRECI"))+
  geom_point(aes(y = datosfinal$MCARI, col = "MCARI"))+
  geom_point(aes(y = datosfinal$MSAVI, col = "MSAVI"))+
  geom_point(aes(y = datosfinal$MTCI, col = "MTCI"))+
  geom_point(aes(y = datosfinal$NDI45, col = "NDVI45"))+
  geom_point(aes(y = datosfinal$NDVI, col = "NDVI"))+
  geom_point(aes(y = datosfinal$REIP, col = "REIP"))+
  geom_point(aes(y = datosfinal$SAVI, col = "SAVI"))+
  geom_point(aes(y = datosfinal$TNDVI, col = "TNDVI"))+
  geom_point(aes(y = datosfinal$S2REP, col = "S2REP"))+
  geom_point(aes(y = datosfinal$EVI, col = "EVI"))+
  geom_point(aes(y = datosfinal$TSAVI, col = "TSAVI"))+
  geom_point(aes(y = datosfinal$RVI, col = "RVI"))+
  geom_point(aes(y = datosfinal$LAI, col = "LAI"))+
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
  geom_line(aes(y = datosfinal$LAI, col = "LAI")) + scale_y_continuous(limits = c(-1,1),breaks=seq(-1,1,0.1)) 
