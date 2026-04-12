library(ggplot2)
library(dplyr)
pam_score <- 1800
meu <- 1500
sigma <- 300
dnorm(pam_score, mean = meu, sd = sigma)

SAT <- tibble(x = seq(-4, 4, length = 100) * sigma + meu, y = dnorm(x, mean = meu, sd = sigma))
SAT
ggplot(SAT, aes(x, y)) +
    geom_line(linewidth = 0.7, color = "blue") +
    labs(x = "SAT scores", y = "density") +
    scale_x_continuous(breaks = seq(300, 2700, by = 300)) +
    theme(
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 14)
    )
sat_ribbon <- filter(SAT, x <= 1800)
ggplot(SAT, aes(x, y)) +
    geom_line(linewidth = 0.7, color = "blue") +
    geom_vline(
        xintercept = 1800, color = "darkred",
        linetype = "dashed", linewidth = 0.6
    ) +
    geom_ribbon(aes(ymin = 0, ymax = y),
        fill = "skyblue",
        data = sat_ribbon
    ) +
    labs(x = "SAT scores", y = "density") +
    scale_x_continuous(breaks = seq(300, 2700, by = 300)) +
    theme(
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 14)
    )

pnorm(pam_score, mean = meu, sd = sigma)
qnorm(0.945, mean = meu, sd = sigma)

lower_68 <- qnorm(0.16, mean = meu, sd = sigma)
upper_68 <- qnorm(0.84, mean = meu, sd = sigma)
cat(
    "68% of women are between", round(lower_68, 1),
    "and", round(upper_68, 1), "inches tall"
)
