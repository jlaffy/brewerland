
# brewerland

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) 
[![Travis-CI Build Status](https://travis-ci.org/hrbrmstr/ggalt.svg?branch=master)](https://travis-ci.org/jlaffy/brewerland) 
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jlaffy/brewerland?branch=master&svg=true)](https://ci.appveyor.com/project/jlaffy/brewerland) 
[![Github All Releases](https://img.shields.io/github/downloads/jlaffy/brewerland/total.svg)]()


The goal of brewerland is: to make your life colourful

The following data are made availabe:

- `discrete_colours` : A character vector of 297 discrete RColorBrewer colours.

The following functions are implemented:

- `colourScale` : Colour Vectors of any length for any data type 
- `colourPal` : Flexile RColorBrewer Palettes
- `areColours` : Test if character strings are valid colours
- `brewerPalNames` : RColorBrewr Palette Names
- `isBrewerPal` : Test if a name is a valid RColorBrewer Palette name
- `isBrewerDiv` : Test if a name is a divergent RColorBrewer Palette 
- `brewerPalLength` : Maximum length of an RColorBrewer Palette
- `brewerPalInfo` : Retrieve information on RColorBrewer Palettes

Note: brewerland's two most useful functions are colourPal() and colourScale(). See ?colourPal and ?colourScale for more information.

## Installation

You can install the released version of brewerland from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jlaffy/brewerland")
```

## Examples


Some basic examples which show you how to solve some common problems:

``` r
library(brewerland)

# discrete_colours is a brewerland character vector with 297 brewer colours
scales::show_col(discrete_colours, labels = F)

### Choose a palette by type ###
# default palette for continuous data is 'YlOrBr'
scales::show_col(colourPal(name = NULL, type = 'seq'), labels = FALSE)
# default palette for divergent data is 'RdBu' (reversed)
scales::show_col(colourPal(name = NULL, type = 'div'), labels = FALSE) 
# default palette for qualitative/categorical data is 'Dark2'
scales::show_col(colourPal(name = NULL, type = 'qual'), labels = FALSE) 

### Choose a palette by RColorBrewer palette names ###
par(mfrow = c(1, 3))
scales::show_col(colourPal(name = 'Spectral'), labels = FALSE)
scales::show_col(colourPal(name = 'Spectral', reverse = T), labels = FALSE)
scales::show_col(colourPal(name = 'Spectral', reverse = T, shuffle = T), labels = FALSE)


### An Example with continuous (sequential) data ###
set.seed(1492)
toy_numeric_data = sort(rnorm(1:100))
# default colours for sequential data
scales::show_col(colourScale(data = toy_numeric_data), labels = FALSE)
# different RColorBrewer Palette
scales::show_col(colourScale(data = toy_numeric_data, pal = 'RdPu'), labels = F)
par(mfrow = c(1, 2))
# data split into 4 equally-spaced groups
scales::show_col(colourScale(data = toy_numeric_data, pal = 'RdPu', bin = T, n = 4), labels = F) # data binned into 4 groups
# data split into 4 equally-sized groups
scales::show_col(colourScale(data = toy_numeric_data, pal = 'RdPu', quantile = T, n = 4), labels = F) # data binned into 4 groups

### An Example with qualitative data ###
toy_categorical_data = sort(rep(letters[1:5], 10))
scales::show_col(colourScale(data = toy_categorical_data), labels = FALSE)
# choose levels
scales::show_col(colourScale(data = toy_categorical_data, levels = letters[5:1]), labels = FALSE)
# provide a different colour palette
scales::show_col(colourScale(data = toy_categorical_data, levels = letters[5:1], pal = discrete_colours))
```












