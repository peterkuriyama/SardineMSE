x <- c(0, seq(150000, 5000000, by = 50000))
y <- function(x, Fmsy){
  HG <- (x-150000)*Fmsy
  if(HG < 0) HG <- 0
  if(HG > 200000) HG <- 200000
  
  return(HG)
}

y5 <- sapply(x, y, Fmsy = 0.05)
y20 <- sapply(x, y, Fmsy = 0.2)  

plot(x, y5, type = "l", xlab = "Biomass (mt)", ylab = "Catch (mt)")
abline(h = 200000, col = 2)
lines(x, y20, col = "blue")
