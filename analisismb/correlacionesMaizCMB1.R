library(ggplot2)
library(GGally)

setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")

imgdicmaizabrilCMB1 <- as.data.frame(read.csv(file = "ultimaversion/imgdic-maizabrilCMB1.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgdicmaizabrilCMB1) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                      "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI","LAI", "FPAR")
#elimino la columna fpar de la tabla original

imgdicmaizabrilCMB1 <- imgdicmaizabrilCMB1[-20]

#creo una columna nueva "RVI" y le pongo valor cero

imgdicmaizabrilCMB1["RVI"] <- 0

#paso RVI a no dato 
imgdicmaizabrilCMB1$RVI[ imgdicmaizabrilCMB1$RVI == 0] <-NA

#hago coincidir datos de las tablas

imgfebmaizabrilCMB1  <- as.data.frame(read.csv(file = "ultimaversion/imgfeb-maizabrilCMB1.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgfebmaizabrilCMB1) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                                "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI1", "LAI", "FPAR")

#creo un RVI al final, así coinciden todas con la primera tabla (diciembre)
imgfebmaizabrilCMB1["RVI"] <- imgfebmaizabrilCMB1$RVI1

#elimino las columnas RVI1 Y FPAR
imgfebmaizabrilCMB1<- imgfebmaizabrilCMB1[-21]
imgfebmaizabrilCMB1<- imgfebmaizabrilCMB1[-19]



imgmarzomaizabrilCMB1 <- as.data.frame(read.csv(file = "ultimaversion/imgmarzo-maizabrilCMB1.csv", header = T))

names(imgmarzomaizabrilCMB1) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                      "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI1", "LAI")

imgmarzomaizabrilCMB1["RVI"] <- imgmarzomaizabrilCMB1$RVI1
imgmarzomaizabrilCMB1<- imgmarzomaizabrilCMB1[-19]


indices <-c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
            "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")

correlacionesimgdic<- as.data.frame(cor(imgdicmaizabrilCMB1))
correlacionesimgfeb<- as.data.frame(cor(imgfebmaizabrilCMB1))
correlacionesimgmarzo <- as.data.frame(cor(imgmarzomaizabrilCMB1))
correlacionesimgfeb <- correlacionesimgfeb["YieldMas", indices]
correlacionesimgdic <- correlacionesimgdic["YieldMas", indices]
correlacionesimgmarzo <- correlacionesimgmarzo["YieldMas", indices]


joindata1 <- rbind(correlacionesimgdic, correlacionesimgfeb)
joindata2 <- rbind(joindata1, correlacionesimgmarzo)
datosfinal<- as.data.frame.matrix(joindata2)

write.csv(datosfinal, "ultimaversion/correlacionmaziCMB1.csv")

datosfinal<-datosfinal[-16]

 meses <- c("Dic", "Feb", "Mar")

ggplot(datosfinal, aes(x = meses, y = value, color = indices, group = 3)) +  ggtitle("Correlaciones Maiz abril CMB1") + labs(x = "Mes") +  
  geom_point(aes(y = datosfinal$GEMI, col = "GEMI"), shape=1)+  
  geom_point(aes(y = datosfinal$GNDVI, col = "GNDVI"), shape=2)+
  geom_point(aes(y = datosfinal$IRECI, col = "IRECI"), shape=3)+
  geom_point(aes(y = datosfinal$MCARI, col = "MCARI"), shape=4)+
  geom_point(aes(y = datosfinal$MSAVI, col = "MSAVI"), shape=5)+
  geom_point(aes(y = datosfinal$MTCI, col = "MTCI"), shape=6)+
  geom_point(aes(y = datosfinal$NDI45, col = "NDVI45"), shape=7)+
  geom_point(aes(y = datosfinal$NDVI, col = "NDVI"), shape=8)+
  geom_point(aes(y = datosfinal$REIP, col = "REIP"), shape=9)+
  geom_point(aes(y = datosfinal$SAVI, col = "SAVI"), shape=10)+
  geom_point(aes(y = datosfinal$TNDVI, col = "TNDVI"), shape=11)+
  geom_point(aes(y = datosfinal$S2REP, col = "S2REP"), shape=12)+
  geom_point(aes(y = datosfinal$EVI, col = "EVI"), shape=13)+
  geom_point(aes(y = datosfinal$TSAVI, col = "TSAVI"), shape=14)+
  geom_point(aes(y = datosfinal$RVI, col = "RVI"), shape=15)+
  geom_point(aes(y = datosfinal$LAI, col = "LAI"), shape=16)+
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
  geom_line(aes(y = datosfinal$LAI, col = "LAI")) + scale_y_continuous(limits = c(-0.8,0.8),breaks=seq(-0.8,0.8,0.1)) 
