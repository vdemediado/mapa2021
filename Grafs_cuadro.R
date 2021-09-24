## El mapa político que dejan los resultados electorales del 6 de junio: Coaliciones, participación electoral y reelección
## Gráficas y cuadros

## Histograma: diferencia de votos de Morena
distrito1821 <- read.csv("distrito1821.csv")
hist(distrito1821$d.morena * 100, xlab = "% Morena 2021 - % Morena 2018", ylab = "número de distritos",
     main = "", cex.lab = 0.8, col = "#FD6467")
mtext("Fuente: Elaborado por el autor con datos del INE", side = 1, line = 4, cex = 0.7, adj = 1) 


## Cambio en los distritos 
f <- table(distrito1821$cambio.morena)
pr <- round(prop.table(f)*100, digits = 1)
tr <- data.frame(f, pr)
tr <- tr[, - 3]
names(tr)[names(tr) == "Var1"] <- "Situación (Morena)"
names(tr)[names(tr) == "Freq"] <- "n"
names(tr)[names(tr) == "Freq.1"] <- "%"
tr

## Triunfos en distritos de mayoría  (2018 y 2021)
library(ggplot2)
library(ggalluvial)
distrito1821 %>% ggplot(aes(axis1 = gana18,axis2 = gana21)) +
  geom_alluvium(aes(fill = gana18), alpha = 0.8) +
  geom_stratum(color = "grey60", size = 1,  alpha = 0.5) +
  geom_label(stat = "stratum", aes(label = after_stat(stratum)))+
  scale_x_discrete(limits = c("Distritos 2018", "Distritos 2021"),expand = c(.001, .001)) +
  labs(caption = "Fuente: Elaboración propia con datos del INE ", y = "") +
  theme_minimal() +
  theme(axis.text.y = element_blank(),panel.grid = element_blank(), legend.position = "none")+
  scale_fill_manual(values = c("#7294D4", "#D8A499", "#FD6467", "#C6CDF7", "#5B1A18"))

## Triunfos en distritos de mayoría según presencia de coaliciones (2018 y 2021)
library(ggmosaic)
ggplot(data = distrito1821) +
  geom_mosaic(aes(fill = cambio.morena, x = product(alianzas)), na.rm = TRUE) +
  labs(x = "Coaliciones", y = "", fill = "Cambio en distritos\n(Morena)") +
  scale_fill_manual(values = c( "#C6CDF7", "#7294D4", "#FD6467",  "#D8A499",  "#5B1A18")) +
  guides(fill = guide_legend(reverse = TRUE)) +
  annotate(
    geom = "text", x = .4, y = -.01, 
    label = "Fuente: Elaboración propia con datos del INE", hjust = 0, vjust = 1, size = 3)

## Participación electoral (distritos de mayoría)
library(ggridges)
ggplot(distrito1821, aes(x = participacion, y = cambio.morena, fill = stat(quantile))) +
  stat_density_ridges(quantile_lines = TRUE,
                      calc_ecdf = TRUE,
                      geom = "density_ridges_gradient",
                      quantiles = c(0.05, 0.95)) +
  scale_fill_manual(name = "Prob.", values = wes_palette("GrandBudapest1", n = 3),
                    labels = c("(0, 5%]", "(5%, 95%]", "(95%, 1]")) +
  labs(x = "Participación electoral", y = "Desempeño Morena", title = "Participación electoral y desempeño de Morena (2021)",
       subtitle = "Cámara de Diputados (300 distritos por mayoría simple)") +
  annotate(
    geom = "text", x = .65, y = .77, 
    label = "Fuente: Elaboración propia\ncon datos del INE", hjust = 0, vjust = 1, size = 3)
