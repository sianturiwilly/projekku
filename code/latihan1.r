library(tidyverse)
library(ggplot2)

# Aesthetic mapping
# scatterplot
housing <- landdata.states

hp2010q1 <- filter(housing, Date == 2010.25)
head(hp2010q1)

ggplot(hp2010q1, aes(x = Structure.Cost, y = Land.Value)) + geom_point()
ggplot(hp2010q1, aes(x = Structure.Cost, y = log(Land.Value))) + geom_point()

# Line (Regression)
hp2010q1$pred.SC <- predict(lm(Structure.Cost~ log(Land.Value), data = hp2010q1))

p1 <- ggplot(hp2010q1, aes(x = log (Land.Value), y = Structure.Cost))
p2 <- p1 + geom_point(aes(color = Home.Value))
p3 <- p2 + geom_line(aes(y = pred.SC))

# Menambah smoothing pada gambar
p3 + geom_smooth()

# Menambahkan teks
p1 + geom_text(aes(label = State), size = 2)

# Menambahkan titik pada text
# install.packages("ggrepel")
library(ggrepel)
p1 + geom_point(aes(color = Home.Value, shape = region)) + geom_text_repel(aes(label = State), size = 2)