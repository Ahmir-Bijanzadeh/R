#time series data processing

?nottem
class(nottem)
plot(nottem)
decompose(nottem)
plot(decompose(nottem))

nottem.vec = as.vector(nottem)
nottem.vec
decompose(nottem.vec) #error cant decompose pure vectors
nottem.ts  = ts(nottem.vec, frequency = 12)
nottem.ts
plot(nottem.ts)


acf(nottem.vec)
nottem.ts

#decompostion  myts
