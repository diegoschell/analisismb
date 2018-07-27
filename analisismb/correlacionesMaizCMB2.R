library(ggplot2)
library(GGally)

setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")

imgdicmaizmarzoCMB2 <- as.data.frame(read.csv(file = "ultimaversion/imgdic-maizmarzoCMB2.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgdicmaizmarzoCMB2) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                                "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI","LAI", "FPAR")
#elimino la columna fpar de la tabla original

imgdicmaizmarzoCMB2 <-imgdicmaizmarzoCMB2[-20]

#creo una columna nueva "RVI" y le pongo valor cero

imgdicmaizmarzoCMB2["RVI"] <- 0

#paso RVI a no dato 
imgdicmaizmarzoCMB2$RVI[ imgdicmaizmarzoCMB2$RVI == 0] <-NA

#hago coincidir datos de las tablas

imgfebmaizmarzoCMB2 <- as.data.frame(read.csv(file = "ultimaversion/imgfeb-maizmarzoCMB2.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgfebmaizmarzoCMB2) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                                "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI1", "LAI", "FPAR")

#creo un RVI al final, así coinciden todas con la primera tabla (diciembre)
imgfebmaizmarzoCMB2["RVI"] <- imgfebmaizmarzoCMB2$RVI1

#elimino las columnas RVI1 Y FPAR
imgfebmaizmarzoCMB2<- imgfebmaizmarzoCMB2[-19]
imgfebmaizmarzoCMB2<- imgfebmaizmarzoCMB2[-20]



# asigno un nombre a cada columna de mi dataframe

#write.csv(cor(imgdicmaizabrilCMB1), "corrimgdicmaizabrilCMB1.csv")
#write.csv(cor(imgfebmaizabrilCMB1), "corrimgfebmaizabrilCMB1.csv")

indices <-c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
            "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")
correlacionesimgdic<- as.data.frame(cor(imgdicmaizmarzoCMB2))
correlacionesimgfeb<- as.data.frame(cor(imgfebmaizmarzoCMB2))
correlacionesimgfeb <- correlacionesimgfeb["YieldMas", indices]
correlacionesimgdic <- correlacionesimgdic["YieldMas", indices]



#A partir de aca se puede continuar igual cambiando el data frame
#Yieldmascorrdic <-(correlacionesimgdic$YieldMas[5:20])
#Yieldmascorrfeb <-(correlacionesimgfeb$YieldMas[5:20])


#names(Yieldmascorrdic)<- c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45","NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")
#names(Yieldmascorrfeb)<- c("GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45","NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")


datosfinal <- rbind(correlacionesimgdic, correlacionesimgfeb)
colnames(datosfinal) <- c("MES", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
  "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI","LAI", "FPAR")

#datosfinal<- as.data.frame.matrix(joindata1)

write.csv(datosfinal, "ultimaversion/correlacionmaziCMB2.csv")

#write.csv(Yieldmascorrdic, file = "produc-correlaDIC.csv")
#write.csv(Yieldmascorrfeb, file = "produc-correlaFEB.csv")

meses<- c("Dic", "Feb")

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
  geom_line(aes(y = datosfinal$LAI, col = "LAI")) + scale_y_continuous(limits = c(-0.8,0.8),breaks=seq(-0.8,0.8,0.1)) 



