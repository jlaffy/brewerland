# brewerland

<!-- badges: start -->
<!-- badges: end -->

The goal of brewerland is: to make your life colourful

brewerland's two most useful functions are colourPal() and colourScale(), for retrieving a colour palette and for generating a colour scale of the same length as your data type, respectively. See ?colourPal and ?colourScale for more information.


## Installation

You can install the released version of brewerland from [GitHub](https://CRAN.R-project.org) with:

``` r
devtools::install_github("jlaffy/brewerland")
```


## Examples

Some basic examples which show you how to solve some common problems:

``` r
library(brewerland)

brewerland::discrete_colours # a character vector with 297 brewer colours
scales::show_col(discrete_colours, labels = F)


scales::show_col(colourPal(pal = NULL, type = 'seq')) # default palette for continuous data is 'YlOrBr'
scales::show_col(colourPal(pal = NULL, type = 'div')) # default palette for divergent data is 'RdBu' (reversed)
scales::show_col(colourPal(pal = NULL, type = 'qual')) # default palette for qualitative/categorical data is 'Dark2'


scales::show_col(colourPal(pal = 'Spectral')
scales::show_col(colourPal(pal = 'Spectral', len = 5, reverse = T))


toy_numeric_data = rnorm(1:100)
scales::show_col(colourScale(data = toy_numeric_data), labels = FALSE)
scales::show_col(colourScale(data = toy_numeric_data, pal = 'RdPu'), labels = F) # different colour palette
scales::show_col(colourScale(data = toy_numeric_data, pal = 'RdPu', bin = T, bins = 3), labels = F) # data binned into 4 groups


toy_categorical_data = rep(letters[1:5], 10)
scales::show_col(colourScale(data = toy_categorical_data), labels = FALSE) # default palette for qualitative data is 'Dark2'
scales::show_col(colourScale(data = toy_categorical_data, levels = letters[5:1])
scales::show_col(colourScale(data = toy_categorical_data, levels = letters[5:1], pal = discrete_colours))
```







