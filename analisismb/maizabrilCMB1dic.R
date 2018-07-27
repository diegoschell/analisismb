library(lattice)
library(ggplot2)
library(GGally)
# paso mis datos a un dataframe
testlote1 <- as.data.frame(read.csv(file = "owncloud/7-aplicaciones/monte-buey/analisis/maizabrilCMB1dic.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(testlote1) <- c("Dryield", "HarvestM", "YieldMas", "YieldWet", "GEMI", "GNDVI", "IRECI", "MCARI", "MSAVI", "MTCI", "NDI45",
                      "NDVI", "PVI", "REIP", "SAVI", "TNDVI", "S2REP", "EVI", "TSAVI", "LAI", "FPAR")
#nombro alguna variablxe para plotear
Dry<- testlote1$Dryield
HarvestM <- testlote1$HarvestM
YieldMas <- testlote1$YieldMas
YieldWwet <- testlote1$YieldWet
#Genero las variables

GEMI <- testlote1$GEMI
GNDVI <- testlote1$GNDVI
IRECI <- testlote1$IRECI
MCARI <- testlote1$MCARI
MSAVI <- testlote1$MSAVI
MTCI <- testlote1$MTCI
NDI45 <- testlote1$NDI45
NDVI <- testlote1$NDVI
PVI <- testlote1$PVI
REIP <- testlote1$REIP
SAVI <- testlote1$SAVI
TNDVI <- testlote1$TNDVI
S2REP <- testlote1$S2REP
EVI <- testlote1$EVI
TSAVI <- testlote1$TSAVI
LAI <- testlote1$LAI
FPAR <- testlote1$FPAR



#Genero los plots
p1 <- ggplot(testlote1, aes(x = YieldMas, y = GEMI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("GEMI")
p2 <- ggplot(testlote1, aes(x = YieldMas, y = GNDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("GNDVI")
p3 <- ggplot(testlote1, aes(x = YieldMas, y = IRECI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("IRECI")
p4 <- ggplot(testlote1, aes(x = YieldMas, y = MCARI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MCARI")
p5 <- ggplot(testlote1, aes(x = YieldMas, y = MSAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MSAVI")
p6 <- ggplot(testlote1, aes(x = YieldMas, y = MTCI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("MTCI")
p7 <- ggplot(testlote1, aes(x = YieldMas, y = NDI45)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDI45")
p8 <- ggplot(testlote1, aes(x = YieldMas, y = NDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("NDVI")
p9 <- ggplot(testlote1, aes(x = YieldMas, y = PVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("PVI")
p10 <- ggplot(testlote1, aes(x = YieldMas, y = REIP)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("REIP")
p11 <- ggplot(testlote1, aes(x = YieldMas, y = SAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("SAVI")
p12 <- ggplot(testlote1, aes(x = YieldMas, y = TNDVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("TNDVI")
p13 <- ggplot(testlote1, aes(x = YieldMas, y = S2REP)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("S2REP")
p14 <- ggplot(testlote1, aes(x = YieldMas, y = EVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("EVI")
p15 <- ggplot(testlote1, aes(x = YieldMas, y = TSAVI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("TSAVI")
p16 <- ggplot(testlote1, aes(x = YieldMas, y = LAI)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("LAI")
p17 <- ggplot(testlote1, aes(x = YieldMas, y = FPAR)) + geom_smooth(method = lm, se = FALSE) + geom_point() + ggtitle("FPAR")

#levanto un script para mostrar varios graficos
source("owncloud/7-aplicaciones/monte-buey/analisis/multiplot.R")
multiplot(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, cols=3)
ggpairs(testlote1, lower = NULL, diag = NULL)
