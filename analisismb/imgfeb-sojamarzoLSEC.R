library(lattice)
library(ggplot2)
library(GGally)

# paso mis datos a un dataframe
setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")

# paso mis datos a un dataframe

imgfebsojamarzoLSEC <- as.data.frame(read.csv(file = "ultimaversion/imgfeb-sojamarzoLASECtotal.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgfebsojamarzoLSEC) <- c("YieldMas","YieldWet", "Dryield", "HarvestM", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                      "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "RVI")
#nombro alguna variablxe para plotear
Dry<- imgfebsojamarzoLSEC$Dryield
HarvestM <- imgfebsojamarzoLSEC$HarvestM
YieldMas <- imgfebsojamarzoLSEC$YieldMas
YieldWwet <- imgfebsojamarzoLSEC$YieldWet
#Genero las variables

GEMI <- imgfebsojamarzoLSEC$GEMI
  GNDVI <- imgfebsojamarzoLSEC$GNDVI
IRECI <- imgfebsojamarzoLSEC$IRECI
MCARI <- imgfebsojamarzoLSEC$MCARI

MSAVI <- imgfebsojamarzoLSEC$MSAVI
MTCI <- imgfebsojamarzoLSEC$MTCI
NDI45 <- imgfebsojamarzoLSEC$NDI45
NDVI <- imgfebsojamarzoLSEC$NDVI
REIP <- imgfebsojamarzoLSEC$REIP
SAVI <- imgfebsojamarzoLSEC$SAVI
TNDVI <- imgfebsojamarzoLSEC$TNDVI
S2REP <- imgfebsojamarzoLSEC$S2REP
EVI <- imgfebsojamarzoLSEC$EVI
TSAVI <- imgfebsojamarzoLSEC$TSAVI
LAI <- imgfebsojamarzoLSEC$LAI



#Genero los plots
p1 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = GEMI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("GEMI") + labs(x = "Rendimiento ton/ha") +theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
                                                                                                                                                                     
p2 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = GNDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("GNDVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p3 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = IRECI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("IRECI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p4 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = MCARI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MCARI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p5 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = MSAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MSAVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p6 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = MTCI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MTCI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p7 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = NDI45)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDI45") + labs(x = "Rendimiento ton/ha")+theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p8 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = NDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p9 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = REIP)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("REIP") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p10 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = SAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("SAVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p11 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = TNDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("TNDVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p12 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = S2REP)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("S2REP") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p13 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = EVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("EVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p14 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = TSAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("TSAVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p15 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = LAI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("LAI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p16 <- ggplot(imgfebsojamarzoLSEC, aes(x = YieldMas, y = FPAR)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("FPAR") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))

#ploteo graficos



multiplot(p1, p2, p3, p4, p5, p6, p7, p8, cols=3)
multiplot(p9, p10, p11, p12, p13, p14, p15, p16, cols=3)
#correlaciones entre las variables
ggpairs(imgfebsojamarzoLSEC, lower = NULL, diag = NULL)

