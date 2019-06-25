#' @title Flexible RColorBrewer Palettes
#' @description Retrieve an RColorBrewer Palette of desired type. The default palettes are 'YlOrBr' for sequential palettes, 'RdBu' for qualitative palettes and 'Dark2' for qualitative palettes. Options to reverse or shuffle the palette prior to returning. Note that in the default RColorBrewer configuration, the warmer colours in the divergent palettes are at the start rather than the end of the scales. In this function, all divergent palettes are by default reversed, such that the RdBu palette for example will go from Blue to Red rather than the original Red to Blue.
#' @param name a character string. Default: NULL
#' @param len desired length of output palette. Note that if the length is larger than the maximum number of colours in the palette, the maximum number of colours will be returned. Default: NULL
#' @param type a character string indicating the type of palette desired. One of 'seq', 'sequential', 'div', 'diverging', 'qual', or 'qualitative'. Default: 'seq'
#' @param reverse a boolean value indicating whether the palette should be returned in reverse order. Note that for diverging palettes, this will effectively restore the original palette order since the function by default reverses them (see also Description). Default: F
#' @param shuffle a boolean value indicating whether the palette should be shuffled prior to return. Default: F
#' @param alpha modify colour transparency. 'NA' or numeric value between 0 and 1. Default: NA
#' @return a character vector of colours.
#' @seealso 
#'  \code{\link[RColorBrewer]{RColorBrewer}}
#' @rdname colourPal
#' @export 
#' @importFrom RColorBrewer brewer.pal
colourPal = function(name = NULL,
                     len = NULL,
                     type = 'seq',
                     reverse = F,
                     shuffle = F,
                     alpha = NA) {

    paletteTypes = c(seq = 'YlOrBr', div = 'RdBu', qual = 'Dark2')
    paletteTypes = c(paletteTypes, paletteTypes)
    names(paletteTypes)[4:6] = c('sequential', 'divergent', 'qualitative')

    if (is.null(name)) {
        if (!type %in% names(paletteTypes)) {
            stop('Palette type must be one of "seq(uential)", "div(ergent)" or "qual(itative)"')
        }
        name = paletteTypes[type]
        msg = paste0("Getting default RColorBrewer palette '", name, "' of type '", type, "'...")
        print(noquote(msg))
    }

    if (!isBrewerPal(name)) {
        stop('Palette name must be a valid RColourBrewer palette.')
    }

    max.len = brewerPalLength(name)

    if (is.null(len)) {
        len = max.len
    }
    
    else if (len > max.len) {
        warningMsg = paste('Only', max.len, 'colours in', name)
        warning(warningMsg)
        len = max.len
    }
    
    pal = RColorBrewer::brewer.pal(len, name)

    if (isBrewerDiv(name)) {
        pal = rev(pal)
    }

    if (name == 'RdGy') {
        pal = grDevices::colorRampPalette(pal[c(6, 1, 10)])(11) 
    }

    if (reverse) {
        print('Reversing palette order...')
        pal = rev(pal)
    }

    if (shuffle) {
        print('Shuffling palette order...')
        pal = sample(pal, length(pal), replace = F)
    }

    scales::alpha(pal, alpha = alpha)
}
