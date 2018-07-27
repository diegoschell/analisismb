library(ggplot2)
library(GGally)

setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")



imgdicmaizabrilCMB1 <- as.data.frame(read.csv(file = "ultimaversion/imgdic-maizabrilCMB1.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgdicmaizabrilCMB1) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                      "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "FPAR")
#nombro alguna variablxe para plotear

imgfebmaizabrilCMB1  <- as.data.frame(read.csv(file = "ultimaversion/imgfeb-maizabrilCMB1.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgfebmaizabrilCMB1) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                                "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI", "LAI", "FPAR")

imgmarzomaizabrilCMB1 <- as.data.frame(read.csv(file = "ultimaversion/imgmarzo-maizabrilCMB1.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgmarzomaizabrilCMB1) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                      "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI", "LAI")

write.csv(cor(imgdicmaizabrilCMB1), "corrimgdicmaizabrilCMB1.csv")
write.csv(cor(imgfebmaizabrilCMB1), "corrimgfebmaizabrilCMB1.csv")
write.csv(cor(imgmarzomaizabrilCMB1), "corrimgmarzomaizabrilCMB1.csv")

correlacionesimgdic<- as.data.frame(read.csv(file = "corrimgdicmaizabrilCMB1.csv", header = T))
correlacionesimgfeb<- as.data.frame(read.csv(file = "corrimgfebmaizabrilCMB1.csv", header = T))
correlacionesimgmarzo<- as.data.frame(read.csv(file = "corrimgmarzomaizabrilCMB1.csv", header = T))


Yieldmascorrdic <-(correlacionesimgdic$YieldMas[5:20])
Yieldmascorrfeb <-(correlacionesimgfeb$YieldMas[5:20])
Yieldmascorrmar<-(correlacionesimgmarzo$YieldMas[5:20])

names(Yieldmascorrdic)<- c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45","NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI", "LAI")
names(Yieldmascorrfeb)<- c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45","NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI", "LAI")
names(Yieldmascorrmar)<- c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45","NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI", "LAI")

joindata1 <- rbind(Yieldmascorrdic, Yieldmascorrfeb)
correlacionestotal <- rbind(joindata1, Yieldmascorrmar)
datosfinal<- as.data.frame.matrix(correlacionestotal)


write.csv(Yieldmascorrdic, file = "produc-correlaDIC.csv")
write.csv(Yieldmascorrfeb, file = "produc-correlaFEB.csv")
write.csv(Yieldmascorrmar, file = "produc-correlaMAR.csv")

ggplot(datosfinal, aes(x = meses, y = value, color = indices, group = 3)) + ggtitle("Correlaciones") + labs(x = "Mes") +  
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
  geom_line(aes(y = datosfinal$LAI, col = "LAI"))