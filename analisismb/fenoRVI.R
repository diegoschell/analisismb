library(raster)
library(rgdal)
library(ggplot2)
library(GGally)
setwd("~/owncloud/7-aplicaciones")
camino <- "monte-buey/RVI-COSMO/"

# Defino que imagenes abrir de los indices
files <- list.files(path = camino, pattern = '.tif$', full.names = TRUE)
indices <- stack(files)
# Abro la imagen cosmo
cosmo <- raster("monte-buey/extraccion/cosmo/EO_CSKS1_20160321_212800_COSMO_SkyMed_IVR_XCV20s.tif")
names(cosmo) <- c("rvi")
# Ajusto los indices a la imagen cosmo
indices <- crop(indices, extent(cosmo))
indices <- resample(indices,cosmo,method="ngb")
# Apilo todo
apilado <- stack(indices,cosmo)

# Cargo el vector para hacer el muestreo
poligonoextraccion <- readOGR(dsn="monte-buey", layer="testindicies")

# Extraigo los datos, el promedio y el desvio
datos <- extract(apilado, poligonoextraccion, df=TRUE)
datos <- datos[-1]
datos <- datos[-4]
names(datos) <- c("lai", "mndwi", "ndwi2", "ndwi",  "rvi")

mean.df <- extract(apilado, poligonoextraccion, df=TRUE, fun=mean)
sd.df <- extract(apilado, poligonoextraccion, df=TRUE, fun=sd)

dataframemediasd <- as.data.frame(cbind(mean.df, sd.df))
dataframemediasd <- dataframemediasd[-5]
dataframemediasd <- dataframemediasd[-1]
dataframemediasd <- dataframemediasd[-6]
dataframemediasd <- dataframemediasd[-9]
names(dataframemediasd) <- c("meanlai", "meanmndwi", "meanndwi2", "meanndwi",  "meanrvi", "sdlai", "sdmndwi", "sdndwi2", "sdndwi",  "sdrvi" )

# Calculo la correlacion
#cor <- rcorr(as.matrix(mean.df), type="spearman")
write.csv(dataframemediasd, "medias-sdlotes.csv")
#subset x LAI
cor(datos[datos$X20160323.lai < 0.7,])
cor(mean.df)

datoslaialto <- (mean.df[mean.df$X20160323.lai > 0.5,])
datoslaibajo<- (mean.df[mean.df$X20160323.lai < 0.5,])



#RVI medias total
ndwi<-dataframemediasd$meanndwi
rvi<-dataframemediasd$meanrvi
sd<-dataframemediasd$sdrvi
qplot(ndwi,rvi)#+geom_errorbar(aes(ndwi=ndwi, ymin=rvi-sd, ymax=rvi+sd), width=0.05)
qplot(ndwi,rvi)#+geom_errorbar(aes(ndwi=ndwi, ymin=rvi-sd, ymax=rvi+sd), width=0.05)
#plotlai <- ggplot(datostotales, aes(x = datos$rvi, y = datos$lai)) + geom_point() + ggtitle("NDVI vs RVI") +labs(x = "NDVI")+labs(y = "RVI")+ 





