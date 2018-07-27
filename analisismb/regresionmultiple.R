library(ggplot2)
library(GGally)

setwd("~/owncloud/7-aplicaciones/monte-buey/analisis")

imgdicsojaabrilCMB2 <- as.data.frame(read.csv(file = "ultimaversion/imgdic-sojamabrilCMB2sector2.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgdicsojaabrilCMB2) <-c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMIdic", "GNDVIdic", "IRECIdic", "MCARIdic", "MSAVIdic", "MTCIdic", "NDI45dic",
                               "NDVIdic", "REIPdic", "SAVIdic", "TNDVIdic", "S2REPdic", "EVIdic", "TSAVIdic","LAIdic")

imgdicsojaabrilCMB2 <- imgdicsojaabrilCMB2[-1]
imgdicsojaabrilCMB2 <- imgdicsojaabrilCMB2[-1]
imgdicsojaabrilCMB2 <- imgdicsojaabrilCMB2[-2]

imgfebsojaabrilCMB2<- as.data.frame(read.csv(file = "ultimaversion/imgfeb-sojamabrilCMB2sector2.csv", header = T))
# asigno un nombre a cada columna de mi dataframe
names(imgfebsojaabrilCMB2) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMIfeb", "GNDVIfeb", "IRECIfeb", "MCARIfeb", "MSAVIfeb", "MTCIfeb", "NDI45feb",
                                "NDVIfeb", "REIPfeb", "SAVIfeb", "TNDVIfeb", "S2REPfeb", "EVIfeb", "TSAVIfeb", "LAIfeb", "RVIfeb")

imgfebsojaabrilCMB2 <- imgfebsojaabrilCMB2[-1]
imgfebsojaabrilCMB2 <- imgfebsojaabrilCMB2[-1]
imgfebsojaabrilCMB2 <- imgfebsojaabrilCMB2[-2]
imgfebsojaabrilCMB2 <- imgfebsojaabrilCMB2[-17]

#elimino la  FPAR
#imgfebsojaabrilCMB2 <- imgfebsojaabrilCMB2 [-20]

imgmarzosojaabrilCMB2<- as.data.frame(read.csv(file = "ultimaversion/imgmarzo-sojamabrilCMB2sector2.csv", header = T))
# asigno un nombre a cada columna de mi dataframe

names(imgmarzosojaabrilCMB2) <- c("Dryield", "HarvestM", "YieldMas","YieldWet", "GEMImar", "GNDVImar", "IRECImar", "MCARImar", "MSAVImar", "MTCImar", "NDI45mar",
                                  "NDVImar", "REIPmar", "SAVImar", "TNDVImar", "S2REPmar", "EVImar", "TSAVImar", "LAImar", "RVImar")

imgmarzosojaabrilCMB2 <- imgmarzosojaabrilCMB2 [-1]
imgmarzosojaabrilCMB2 <- imgmarzosojaabrilCMB2 [-1]
imgmarzosojaabrilCMB2 <- imgmarzosojaabrilCMB2 [-2]
imgmarzosojaabrilCMB2 <- imgmarzosojaabrilCMB2 [-17]


jointablas <- cbind(imgdicsojaabrilCMB2, imgfebsojaabrilCMB2)
#elimino el duplicado de YieldMas
jointablas <- jointablas[-17]
jointablas2 <-cbind(jointablas, imgmarzosojaabrilCMB2)
jointablas2 <- jointablas2[-32]