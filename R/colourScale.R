#!/usr/bin/env Rscript

#' @title Generate Colour Vectors of Any Length for Any Data Type
#' @description Returns a vector of colours of the same length as the data provided. The function will inherently deal with vectors of type numeric, character and factor. Colours can be specified in one of three ways. (1) You can provide the name of a valid RColorBrewer palette. To help with this, you can check that the palette exists with brewerland::isBrewerPal(name). You can also see all existing palettes with brewerland::brewerPalNames(). (2) You can provide a valid character vector of
#' colours. To help with this, you can check that the colours are valid with brewerland::areColours(). Note that here the colours you choose are not limited to those that are in the RColorBrewer palettes. You should however be aware that in this case it is up to you to choose a vector of colours that matches your data type. (3) If you provide neither a palette name or a colour vector, the type of data will be determined internally and a default palette will be chosen accordingly. For all three colour specifications, you can also choose to return binned or quantised colour vectors if you would like numeric values within equally-spaced groups or equally-sized groups to share the same colour.
#' @param data an atomic vector of type numeric, character or factor.
#' @param pal if provided, either a character string of a valid RColorBrewer palette, or a character vector of valid colours. You can check that your palette name is valid in isBrewerPal(), or see all palette names with brewerPalNames() and you can check your vector of colours with areColours(). If not provided, the type of data will be determined internally and a default palette will be returned accordingly.Default: NULL
#' @param div a boolean value indicating whether a divergent palette is required. Applicable only to numeric data. Default: F
#' @param bin a boolean value indicating whether the data should first be binned (equally-spaced groups) such that all data points within a range of values will share the same colour. Applicable only to numeric data. Default: F
#' @param quantile a boolean value indicating whether the data should first be quantised (equally-sized groups) such that all data points within a group will share the same colour. Applicable only to numeric data.  Default: F
#' @param reverse.pal a boolean value indicating whether the palette colours should be reversed (prior of course to generating the full data-matched colour vector). Default: F
#' @param shuffle.pal a boolean value indicating whether the palette colours should be shuffled (also prior to generating the colour vector). Note that the shuffling of palette colours will be different with each function call. Default: F
#' @param pal.len The number of colours desired in the palette. If the number provided is NULl or is larger than the number of colours available, defaults to the maximum number of colours available. Default: NULL
#' @param nbins a numeric value indicating how many equally-spaced values your data should be binned according to. The minimum number of bins is 2, which would bin your data into 3 groups and thus 3 colours. Default: 7
#' @param nquant a numeric value indicating how many equally-sized groups your data will be split into. A value of 4 would generate 4 groups and thus 4 colours. Default: 4
#' @param levels a character vector that provides an alternate way of specifying levels. Applicable only to character or factor data. If specified, the levels provided here will override those in the data argument. Default: NULL
#' @param ordered applicable only if the data needs to be coerced to a factor. If so 'TRUE' will treat the character vector as already in the correct order. Default: F
#' @param squish a numeric range (i.e. numeric vector with two values) indicating the range that the data should be squished between. In other words, c(-3, 3) would mean that the most extreme colours in the palette are the same for all values -3 and under, and all values 3 and over, respectively. Default: NULL
#' @param return.legend applicable only to character or factor data. If TRUE, then the function will instead return a list of length two: "colours" containing the colour vector, and "legend" containing a named vector of unique colours and their levels. Default: F
#' @return either a character vector of colours of the same length as the input data provided, or, if return.legend is set to TRUE in the case of character or factor data, a list of length two. See "return.legend" for more information.
#' @seealso 
#'  \code{\link[scales]{col_numeric}},\code{\link[scales]{squish}}
#' @rdname colourScale
#' @export 
#' @importFrom scales col_factor col_bin col_quantile col_numeric squish
colourScale = function(data,
                       pal = NULL,
                       div = F,
                       bin = F,
                       quantile = F,
                       reverse.pal = F,
                       shuffle.pal = F,
                       pal.len = NULL,
                       nbins = 7,
                       nquant = 4,
                       levels = NULL,
                       ordered = F,
                       squish = NULL,
                       return.legend = F){

    # nbins of 7 will cut the data at 7 points equally-spaced in value
    # (generating 8 groups/colours)
    # nquant of 4 will cut the data into 4 equally-sized groups

    if (sum(sapply(list(div, bin, quantile), isTRUE)) > 1) {
        stop('Only one of div, bin and quantile should be set to TRUE.')
    }

    if (is.factor(data) | is.character(data)) {
        type = 'qual'
    } else if (isTRUE(div)) {
        type = 'div'
    } else {
        type = 'seq'
    }

    if (!areColours(pal)) {
        pal = colourPal(name = pal,
                        type = type,
                        len = pal.len,
                        reverse = reverse.pal,
                        shuffle = shuffle.pal)
    }

    if (type == 'qual') {
        levs = unique(as.character(data))

        if (length(levs) <= length(pal)) {
            # this will make sure the first three colours are used
            # rather than equidistant colours, in which final colour is often grey
            pal = pal[1:length(unique(as.character(data)))]
        } else {
            # if there are too many colours, load default rds object with all brewer colours
            pal = brewerland::discrete_colours
        }

        scalefun = scales::col_factor(domain = data, palette = pal, levels = levels, ordered = ordered)
    }

    else if (isTRUE(bin)) {
        scalefun = scales::col_bin(domain = data, palette = pal, bins = nbins)
    }

    else if (isTRUE(quantile)) {
        scalefun = scales::col_quantile(domain = data, palette = pal, n = nquant)
    }

    else {
        scalefun = scales::col_numeric(domain = data, palette = pal)
    }

    result = scalefun(data)
    
    if (!is.null(squish) & type != 'qual') {
        result = scales::squish(result, range = squish)
    }

    if (return.legend & type == 'qual') {
        result = list(colours = result,
                      legend = stats::setNames(unique(result), unique(data)))
    }

    result
}


