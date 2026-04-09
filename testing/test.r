<<<<<<< Updated upstream
library(tidyverse)
set.seed(100)
rnorm(1)
set.seed(1997)

infection <- c(rep("yes", 11), rep("no", 9))
shuffled <- sample(infection)
shuffled

vaccine <- shuffled[1:14]
placebo <- shuffled[15:20]

vaccine
placebo

table(vaccine)
table(placebo)

mean(placebo == "yes") - mean(vaccine == "yes")

res <- c()
for (i in 1:100) {
    set.seed(1997 + i)
    infection <- c(rep("yes", 11), rep("no", 9))
    shuffled <- sample(infection)
    vaccine <- shuffled[1:14]
    placebo <- shuffled[15:20]
    res <- c(res, mean(placebo == "yes") - mean(vaccine == "yes"))
}

res

mean(res)

dotchart(
    res,
    main = "Simulated Diff in Infection Rates: Placebo minus Vaccine",
    xlab = "Diff in Infection Rates(Placebo - vaccine) (%)",
    color = "blue",
    pch = 19
)

plot(seq_along(res), res, type = "b")
=======
options(digits = 10)
f <- function(x) {
    (2 * cos(7 * x)) / x
}

n <- 8
start <- 1
end <- 5
inc <- (end - start) / n

accum <- 0

for (i in 0:n) {
    if (i == 0 || i == n) {
        accum <- accum + f(start + i * inc)
    } else if (i %% 2 != 0) {
        accum <- accum + 4 * f(start + i * inc)
    } else {
        accum <- accum + 2 * f(start + i * inc)
    }
}

accum * (inc / 3)
>>>>>>> Stashed changes
