add <- function(x, y){
    x + y
}

print(add(1,2))
print(add(1.0e10, 2.0e10))

h <- c(1, 2, 3, 4, 5, 6)
M <- c("a", "b", "c", "d", "e", "f")
barplot(h, names.arg = M, xlab = "X", ylab="Y", col = "#00cec9", main="Chart", border="#fdcb6e")