## El mapa político que dejan los resultados electorales del 6 de junio: Coaliciones, participación electoral y reelección

## Modelo de efectos fijos (distrito)
library("plm")
load("paneldto.Rdata")
fixed <- plm(prop.morena ~ comp.alianzas.j,
             data = paneldto,
             index = c("edo_dto", "T"),
             model = "within",
             effect = "twoways")
summary(fixed)

## Errores estándar robustos
library("lmtest")
fixed.r <- coeftest(fixed, vcov = vcovHC, type = "HC1") 
fixed.r 

## Gráfica de coeficientes
library(ggstance)
library(jtools)
library(wesanderson)
color <- wes_palette("Darjeeling1")
plot_summs(fixed.r, ci_level = .99, inner_ci_level = .95,
           coefs = c("Sólo VaXM" = "comp.alianzas.jSólo VaXM", "Sólo JHH" = "comp.alianzas.jSólo JHH",
                     "Ambas" = "comp.alianzas.jAmbas"),
           colors = color[2]) +
  labs(x = "Estimación", y = "") +
  annotate(
    geom = "text", x = .055, y = 3.2, 
    label = "Fuente: Elaboración propia\n con datos del INE", hjust = 0, vjust = 1, size = 3)



## Alterantivamente, con Dif-en-Dif
modelo <- lm(prop.morena ~ alianzas21 * T, data = paneldto)
summary(modelo)

## Errores estándar robustos
library("ivpack")
modelo.rse <- clx(modelo, paneldto$edo_dto)
modelo.rse

