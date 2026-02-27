library(ggplot2)
library(dplyr)

basic <- data.frame(
    A = c(2, 1, 4, 9),
    B = c(3, 2, 5, 10),
    C = c(4, 1, 15, 80),
    D = c("a", "a", "b", "b")
)

basic

ggplot(data = basic, mapping = aes(x = A, y = C, shape = D)) +
    layer(
        geom = "point",
        stat = "identity",
        position = "identity"
    ) +
    scale_x_continuous() +
    scale_y_continuous() +
    coord_cartesian() +
    facet_null()

ggplot(basic, aes(x = A, y = C, shape = D)) +
    geom_point() +
    facet_wrap(~D)

mpg

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point()

unique(mpg$model)
colnames(mpg)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point()

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy))

ggplot(
    data = mpg,
    mapping = aes(x = displ, y = hwy, color = class)
) +
    geom_point()

ggplot(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
) +
    geom_point(color = "red")

ggplot(
    data = mpg,
    mapping = aes(x = displ, y = hwy, color = class)
) +
    geom_point() +
    facet_grid(~drv)


ggplot(
    data = mpg,
    mapping = aes(x = displ, y = hwy, color = class),
    labs(
        x = "Engine displacement (liters)",
        y = "Highway miles per gallon",
        title = "Fuel economy decreases with increasing engine displ"
    )
) +
    geom_point() +
    facet_grid(~drv)

ggplot(data = mpg, mapping = aes(x = class)) +
    geom_bar()

ggplot(data = mpg, mapping = aes(x = class, color = class)) +
    geom_bar()

ggplot(data = mpg, mapping = aes(x = class, fill = class)) +
    geom_bar()


# NOTE: stacked bar chart
ggplot(data = mpg, mapping = aes(x = class, fill = drv)) +
    geom_bar()

ggplot(data = mpg) +
    geom_bar(mapping = aes(x = class, fill = drv), position = "fill")

ggplot(data = mpg) +
    geom_bar(mapping = aes(x = class, fill = drv), position = "dodge")

# NOTE: Histogram

ggplot(data = mpg, mapping = aes(x = hwy)) +
    geom_histogram(fill = "blue", bins = 30)


ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
    geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
    geom_boxplot() +
    coord_flip()
