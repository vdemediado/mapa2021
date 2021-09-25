Código y bases de datos del artículo "El mapa político que dejan los resultados electorales del 6 de junio"

El código para las gráficas y el cuadro está en "Grafs_cuadro.R". Son generadas con los datos en "distrito1821.csv"

Para el modelo de efectos fijos se usan los datos en "paneldto.Rdata". El código está en "Efectos_fijos.R".

El resto de los archivos contiene el código para agregar los datos seccionales a nivel distrital y añadir información sobre coaliciones y reelección.

La fuente de información proviene de los cómputos distritales del INE, disponible en https://computos2021.ine.mx/ y https://computos2018.ine.mx/.

Los resultados a nivel de sección electoral están en los archivos "diputados2018.csv" y "diputados2021.csv".

La información sobre candidaturas de coalición en los distritos está en "candidaturas2018.csv" y candidaturas2021.csv.

Para obtener los distritos en donde hubo reelección, comparé la lista de diputados y diputadas con la de candidaturas. Los datos están en "cand_reelec.csv".

El código para agregar en distritos y generar tanto "distrito1821.csv" como "paneldto.Rdata" está en "mapaelectoral.R".
