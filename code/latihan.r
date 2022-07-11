# Author: Willi Chrisdeardo Sianturi
# Tanggal: 11 Juli 2022
# Bahasa: R (Data Science)

# Membuat program sederhana menggunakan Hello World.
# print("Hello world")

# Install paket yang diperlukan.
# install.packages("tidyverse")
# install.packages("ggplot2")
# install.packages("readr")

library(tidyverse)
library(ggplot2)

housing <- landdata.states
 # Histogram
hist(housing$Home.Value)
# Histogram ggplot2
ggplot(housing, aes(x=Home.Value))+geom_histogram()

# Grafis lebih rumit sedikit
plot(Home.Value~Date, col = factor(State), data = filter(housing, State %in% c("CA", "OH")))
legend("topleft", legend = c("CA", "OH"),
       col = c("black","red"), pch = 1)
ggplot(filter(housing, State %in% c("CA", "OH")),
       aes (x = Date, y = Home.Value, color = State)) + geom_point()