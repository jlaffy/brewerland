#' @title Colour vectors
#' @description Test if an object is interpretable as colours.
#' @param x character vector of colours to test
#' @return a boolean value
#' @rdname areColours
#' @export 
areColours <- function(x) {
    
    if (is.null(x)) return(F)

    is.character(x) &
        sapply(x, function(X) tryCatch(is.matrix(grDevices::col2rgb(X)), error = function(e) FALSE))
}


#' @title Retrieve Information on RColorBrewer Palettes
#' @description Retrieve information on RColorBrewer palette lengths, categories and colourblind friendliness.
#' @return dataframe with four columns: name, maxcolors, category, colorblind
#' @rdname brewerPalInfo
#' @export 
#' @importFrom RColorBrewer brewer.pal.info
#' @importFrom tibble rownames_to_column
brewerPalInfo = function() {
    info = RColorBrewer::brewer.pal.info
    tibble::rownames_to_column(info, 'name')
}

#' @title Get RColorBrewer Palette Names
#' @description Get RColorBrewer Palette Names
#' @return a character vector containing all RColorBrewer palette names 
#' @rdname brewerPalNames
#' @export 
brewerPalNames = function() {
    brewerPalInfo()$name
}

#' @title Test for Valid RColorBrewer Palette Name
#' @description Test if a character string is a valid RColorBrewer palette name.
#' @param name a character string
#' @return a boolean value
#' @rdname isBrewerPal
#' @export 
isBrewerPal = function(name) {
    all(name %in% brewerPalNames())
}

#' @title Diverging RColorBrewer Palettes
#' @description Check if an RColorBrewer palette is diverging.
#' @param name a character string
#' @return a boolean value
#' @rdname isBrewerDiv
#' @export 
isBrewerDiv = function(name) {
    info = brewerPalInfo()
    info$category[info$name == name] == 'div'
}

#' @title RColorBrewer Palette Length
#' @description Get the maximum length of an RColorBrewer Palette
#' @param name a character string 
#' @return a numeric value
#' @rdname brewerPalLength
#' @export 
brewerPalLength = function(name) {
    stopifnot(name %in% brewerPalNames())
    info = brewerPalInfo()
    info$maxcolors[info$name %in% name]
}


