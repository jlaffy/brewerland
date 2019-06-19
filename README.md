# brewerland


<!-- badges: start -->
<!-- badges: end -->

The goal of brewerland is: to make your life colourful.

Disclaimer: UK English spelling

\bold{brewerland}'s two most useful functions are colourPal() and colourScale(), for retrieving a colour palette and for generating a colour scale of the same length as your data type, respectively.
Here's the Description for colourScale() from the help page (accessible with ?colourScale):
Returns a vector of colours of the same length as the data provided. The function will inherently deal with vectors of type numeric, character and factor. Colours can be specified in one of three ways. (1) You can provide the name of a valid RColorBrewer palette. To help with this, you can check that the palette exists with brewerland::isBrewerPal(name). You can also see all existing palettes with brewerland::brewerPalNames(). (2) You can provide a valid character vector of colours. To help with this, you can check that the colours are valid with brewerland::areColours(). Note that here the colours you choose are not limited to those that are in the RColorBrewer palettes. You should however be aware that in this case it is up to you to choose a vector of colours that matches your data type. (3) If you provide neither a palette name or a colour vector, the type of data will be determined internally and a default palette will be chosen accordingly. For all three colour specifications, you can also choose to return binned or quantised colour vectors if you would like numeric values within equally-spaced groups or equally-sized groups to share the same colour.


## Installation

You can install the released version of brewerland from [GitHub](https://CRAN.R-project.org) with:

``` r
devtools::install_github("jlaffy/brewerland")
```


## Example


This is a basic example which shows you how to solve a common problem:

``` r
library(brewerland)

toy_numeric_data = rnorm(1:100)
plot(toy_numeric_data, col = colourScale(data = toy_numeric_data))
plot(toy_numeric_data, col = colourScale(data = toy_numeric_data, pal = 'RdPu'))
plot(toy_numeric_data, col = colourScale(data = toy_numeric_data, pal = 'RdPu', bin = T, bins = 3))

toy_categorical_data = rep(letters[1:10], 10)
scales::show_col(toy_categorical_data, labels = FALSE
```
