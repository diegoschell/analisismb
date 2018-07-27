library(lattice)
library(ggplot2)
library(GGally)


setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")

# paso mis datos a un dataframe

testlote1 <- as.data.frame(read.csv(file = "ultimaversion/imgmarzo-maizabrilCMB1.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(testlote1) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                      "NDVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "RVI", "LAI")
#nombro alguna variablxe para plotear
Dry<- testlote1$Dryield
HarvestM <- testlote1$HarvestM
YieldMas <- testlote1$YieldMas
YieldWwet <- testlote1$YieldWet
#Genero las variables

GEMI <- testlote1$gemimean
GNDVI <- testlote1$gndvimean
IRECI <- testlote1$irecimean
MCARI <- testlote1$mcarimean
MSAVI <- testlote1$msavimean
MTCI <- testlote1$mtcimean
NDI45 <- testlote1$ndi45mean
NDVI <- testlote1$ndvimean
REIP <- testlote1$reipmean
SAVI <- testlote1$savimean
TNDVI <- testlote1$tndvimean
S2REP <- testlote1$s2repmean
EVI <- testlote1$evimean
TSAVI <- testlote1$tsavimean
RVI <- testlote1$RVI
LAI <- testlote1$laimean




#Genero los plots
p1 <- ggplot(testlote1, aes(x = YieldMas, y = GEMI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("GEMI") + labs(x = "Rendimiento ton/ha") +theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p2 <- ggplot(testlote1, aes(x = YieldMas, y = GNDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("GNDVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p3 <- ggplot(testlote1, aes(x = YieldMas, y = IRECI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("IRECI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p4 <- ggplot(testlote1, aes(x = YieldMas, y = MCARI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MCARI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p5 <- ggplot(testlote1, aes(x = YieldMas, y = MSAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MSAVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p6 <- ggplot(testlote1, aes(x = YieldMas, y = MTCI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MTCI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p7 <- ggplot(testlote1, aes(x = YieldMas, y = NDI45)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDI45") + labs(x = "Rendimiento ton/ha")+theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p8 <- ggplot(testlote1, aes(x = YieldMas, y = NDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p9 <- ggplot(testlote1, aes(x = YieldMas, y = REIP)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("REIP") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p10 <- ggplot(testlote1, aes(x = YieldMas, y = SAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("SAVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p11 <- ggplot(testlote1, aes(x = YieldMas, y = TNDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("TNDVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p12 <- ggplot(testlote1, aes(x = YieldMas, y = S2REP)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("S2REP") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p13 <- ggplot(testlote1, aes(x = YieldMas, y = EVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("EVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p14 <- ggplot(testlote1, aes(x = YieldMas, y = TSAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("TSAVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p15 <- ggplot(testlote1, aes(x = YieldMas, y = RVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("RVI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
p16 <- ggplot(testlote1, aes(x = YieldMas, y = LAI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("LAI") + labs(x = "Rendimiento ton/ha")+ theme(axis.text=element_text(size=10),axis.title=element_text(size=9,face="plain"))
#ploteo graficos



multiplot(p1, p2, p3, p4, p5, cols=3)
multiplot( p6, p7, p8, p9, p10, cols=3)
multiplot(p11, p12, p13, p14, p16, p15, cols=3)

#correlaciones entre las variables
ggpairs(testlote1, lower = NULL, diag = NULL)

