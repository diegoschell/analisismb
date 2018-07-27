library(lattice)
library(ggplot2)
library(GGally)
# paso mis datos a un dataframe
testlote1 <- as.data.frame(read.csv(file = "owncloud/7-aplicaciones/monte-buey/analisis/CMBmaiz.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(testlote1) <- c("Dryield", "HarvestM", "YieldMas", "YieldWet", "RVI", "EVI", "RVIfeb", "GNDVI", "NDI45","MSAVI","MSAVI2", "MCARI", "REIP", "NDVI", "IRECI", "toREP", "LAI")
#nombro alguna variablxe para plotear
Dry<- testlote1$Dryield
HarvestM <- testlote1$HarvestM
YieldMas <- testlote1$YieldMas
YieldWwet <- testlote1$YieldWet
#Genero las variables

RVImar <- testlote1$RVI
EVI <- testlote1$EVI
RVIfeb <- testlote1$RVIfeb
GNDVImar <- testlote1$GNDVI
NDI45mar <- testlote1$NDI45
MSAVImar <- testlote1$MSAVI
MSAVI2mar <- testlote1$MSAVI2
MCARImar <- testlote1$MCARI
REIPmar <- testlote1$REIP
NDVImar <- testlote1$NDVI
IRECImar <- testlote1$IRECI
REPmar <- testlote1$toREP
LAImar <- testlote1$LAI
#Calculo la regresion

#fitNDVI <- lm(YieldMas~GNDVImar)
#fitIRECI <- lm(IRECI ~ masa)
#fitOSAVI <- lm(OSAVI ~ masa)
#fitMTCI <- lm(MTCI ~ masa)
#fitGNDVI <- lm(GNDVI ~ masa)
#fitS2REP <- lm(S2REP ~ masa)
#fitNDVI45 <- lm(NDVI45 ~ masa)
#fitMCARI <- lm(MCARI ~ masa)
#fitEVI <-lm(EVI~ masa)

#Genero los plots
p1 <- ggplot(testlote1, aes(x = YieldMas, y = RVImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("RVI Marzo")
p2 <- ggplot(testlote1, aes(x = YieldMas, y = EVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("EVI Marzo")
p3 <- ggplot(testlote1, aes(x = YieldMas, y = RVIfeb)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("RVI Febrero")
p4 <- ggplot(testlote1, aes(x = EVI, y = RVImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("RVI vs EVI")
p5 <- ggplot(testlote1, aes(x = YieldMas, y = GNDVImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("GNDVI Marzo")
p6 <- ggplot(testlote1, aes(x = YieldMas, y = NDI45mar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDI45 Marzo")
p7 <- ggplot(testlote1, aes(x = YieldMas, y = MSAVImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MSAVI Marzo")
p13 <- ggplot(testlote1, aes(x = YieldMas, y = MSAVI2mar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MSAVI2 Marzo")
p8 <- ggplot(testlote1, aes(x = YieldMas, y = MCARImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MCARI Marzo")
p9 <- ggplot(testlote1, aes(x = YieldMas, y = REIPmar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("REIP Marzo")
p10 <- ggplot(testlote1, aes(x = YieldMas, y = NDVImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDVI Marzo")
p11 <- ggplot(testlote1, aes(x = YieldMas, y = IRECImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("IRECI Marzo")
p12 <- ggplot(testlote1, aes(x = YieldMas, y = REPmar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("2REP Marzo")
p14 <- ggplot(testlote1, aes(x = YieldMas, y = LAImar)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("LAI Marzo")

#levanto un script para mostrar varios graficos
source("owncloud/7-aplicaciones/monte-buey/analisis/multiplot.R")
multiplot(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, cols=3)
ggpairs(testlote1, lower = NULL, diag = NULL)

