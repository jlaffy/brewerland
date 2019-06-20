
<!-- README.md is generated from README.Rmd. Please edit that file -->

# brewerland

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/ggalt.svg?branch=master)](https://travis-ci.org/jlaffy/brewerland)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/jlaffy/brewerland?branch=master&svg=true)](https://ci.appveyor.com/project/jlaffy/brewerland)
[![Github All
Releases](https://img.shields.io/github/downloads/jlaffy/brewerland/total.svg)]()

The goal of brewerland is: to make your life colourful

brewerland’s two most useful functions are colourPal() and
colourScale(), for retrieving a colour palette and for generating a
colour scale of the same length as your data type, respectively. See
?colourPal and ?colourScale for more information.

## Installation

You can install the released version of brewerland from
[GitHub](https://CRAN.R-project.org) with:

``` r
devtools::install_github("jlaffy/brewerland")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jlaffy/brewerland")
```

## Examples

Some basic examples which show you how to solve some common
    problems:

    #>   [1] "#CAB2D6" "#8DD3C7" "#80B1D3" "#FFFFB3" "#BC80BD" "#33A02C" "#CCEBC5"
    #>   [8] "#FF7F00" "#1F78B4" "#D9D9D9" "#6A3D9A" "#FFED6F" "#B3DE69" "#B2DF8A"
    #>  [15] "#FFFF99" "#FB9A99" "#B15928" "#E31A1C" "#FDBF6F" "#A6CEE3" "#FDB462"
    #>  [22] "#BEBADA" "#FCCDE5" "#FB8072" "#FE9929" "#A1D99B" "#084081" "#EF3B2C"
    #>  [29] "#A65628" "#BF812D" "#FDD49E" "#FFFFFF" "#8DA0CB" "#9ECAE1" "#A8DDB5"
    #>  [36] "#C2A5CF" "#A63603" "#FDAE6B" "#92C5DE" "#FED9A6" "#D0D1E6" "#35978F"
    #>  [43] "#54278F" "#E7298A" "#542788" "#FEC44F" "#66C2A5" "#F7FCF5" "#1B7837"
    #>  [50] "#662506" "#D1E5F0" "#FD8D3C" "#751824" "#AE017E" "#D7301F" "#FFF7FB"
    #>  [57] "#A50026" "#737373" "#A50F15" "#4DAF4A" "#E0F3DB" "#800026" "#4EB3D3"
    #>  [64] "#FFF7F3" "#FFFFCC" "#EFEDF5" "#F0027F" "#FFF7BC" "#C7E9C0" "#A6D96A"
    #>  [71] "#D95F02" "#386CB0" "#EF6548" "#7FC97F" "#49006A" "#525252" "#F1E2CC"
    #>  [78] "#F7FBFF" "#F6E8C3" "#B2182B" "#BDBDBD" "#DADAEB" "#FFFFD9" "#1D91C0"
    #>  [85] "#FC8D62" "#006837" "#E7E1EF" "#F4CAE4" "#8E0152" "#FDC086" "#FDBB84"
    #>  [92] "#B3E2CD" "#FFFFBF" "#99D8C9" "#7FCDBB" "#FEE08B" "#FEE090" "#000000"
    #>  [99] "#FDDAEC" "#3288BD" "#810F7C" "#E5F5E0" "#D94801" "#FC4E2A" "#F46D43"
    #> [106] "#E7D4E8" "#FEB24C" "#A6DBA0" "#276419" "#F7F7F7" "#DE77AE" "#66C2A4"
    #> [113] "#E5C494" "#CCECE6" "#807DBA" "#999999" "#C994C7" "#B3B3B3" "#C51B7D"
    #> [120] "#3690C0" "#4292C6" "#BCBDDC" "#A3A3A3" "#EDF8B1" "#003C30" "#F781BF"
    #> [127] "#CCCCCC" "#F4A582" "#08306B" "#B35806" "#252525" "#0868AC" "#E6F5C9"
    #> [134] "#FDE0EF" "#74A9CF" "#02818A" "#E08214" "#B3CDE3" "#A6761D" "#7F2704"
    #> [141] "#FDB863" "#D9F0D3" "#2171B5" "#984EA3" "#F2F2F2" "#F7F4F9" "#D6604D"
    #> [148] "#8C96C6" "#023858" "#1A1A1A" "#377EB8" "#ABD9E9" "#E6F598" "#BD0026"
    #> [155] "#C7EAE5" "#E78AC3" "#F7FCB9" "#FB6A4A" "#E6AB02" "#931827" "#78C679"
    #> [162] "#74ADD1" "#67A9CF" "#9EBCDA" "#CBD5E8" "#FDD0A2" "#D9EF8B" "#E5D8BD"
    #> [169] "#238443" "#67001F" "#E5F5F9" "#253494" "#543005" "#66A61E" "#9970AB"
    #> [176] "#ADDD8E" "#D73027" "#FFF7EC" "#DECBE4" "#4393C3" "#F0F0F0" "#561920"
    #> [183] "#980043" "#5E4FA2" "#FFFF33" "#474747" "#FEE6CE" "#FEE8C8" "#D9F0A3"
    #> [190] "#7A0177" "#4D9221" "#BEAED4" "#FCFBFD" "#666666" "#F1B6DA" "#01665E"
    #> [197] "#FFD92F" "#004529" "#DF65B0" "#3F007D" "#00441B" "#2166AC" "#762A83"
    #> [204] "#1A9850" "#A6D854" "#CC4C02" "#FBB4AE" "#0570B0" "#FCBBA1" "#6BAED6"
    #> [211] "#C7E9B4" "#E6F5D0" "#DFC27D" "#FDAE61" "#B2ABD2" "#FDCDAC" "#D4B9DA"
    #> [218] "#E0ECF4" "#6A51A3" "#CE1256" "#FDE0DD" "#238B45" "#A6BDDB" "#FDDBC7"
    #> [225] "#41AB5D" "#F7FCF0" "#8C6BB1" "#9E0142" "#081D58" "#B30000" "#016C59"
    #> [232] "#BF5B17" "#FED976" "#FEE391" "#FCC5C0" "#FEE0D2" "#F7FCFD" "#7F0000"
    #> [239] "#4575B4" "#41AE76" "#FFFFE5" "#F5F5F5" "#41B6C4" "#66BD63" "#ECE7F2"
    #> [246] "#045A8D" "#FC9272" "#88419D" "#08519C" "#757575" "#313695" "#7BCCC4"
    #> [253] "#F16913" "#969696" "#FFF5EB" "#67000D" "#225EA8" "#9E9AC8" "#FFF5F0"
    #> [260] "#1B9E77" "#006D2C" "#FFF2AE" "#8C510A" "#40004B" "#D1D1D1" "#D53E4F"
    #> [267] "#ECE2F0" "#CB181D" "#7FBC41" "#FC8D59" "#ABDDA4" "#993404" "#7570B3"
    #> [274] "#014636" "#DEEBF7" "#2D004B" "#7F3B08" "#2B8CBE" "#C6DBEF" "#E0F3F8"
    #> [281] "#B8E186" "#053061" "#4D004B" "#FEE0B6" "#74C476" "#8073AC" "#E41A1C"
    #> [288] "#BFD3E6" "#D8DAEB" "#DD3497" "#5AAE61" "#80CDC1" "#FA9FB5" "#EC7014"
    #> [295] "#FFEDA0" "#F768A1" "#38191D"

<img src="man/figures/README-discrete colours-1.png" width="100%" />

    #> [1] Getting default RColorBrewer palette 'YlOrBr' of type 'seq'...

<img src="man/figures/README-discrete colours-2.png" width="100%" />

    #> [1] Getting default RColorBrewer palette 'RdBu' of type 'div'...

<img src="man/figures/README-discrete colours-3.png" width="100%" />

    #> [1] Getting default RColorBrewer palette 'Dark2' of type 'qual'...

<img src="man/figures/README-discrete colours-4.png" width="100%" /><img src="man/figures/README-discrete colours-5.png" width="100%" />

    #> [1] "Reversing palette order..."

<img src="man/figures/README-discrete colours-6.png" width="100%" />

    #> [1] Getting default RColorBrewer palette 'YlOrBr' of type 'seq'...

<img src="man/figures/README-discrete colours-7.png" width="100%" /><img src="man/figures/README-discrete colours-8.png" width="100%" /><img src="man/figures/README-discrete colours-9.png" width="100%" />

    #> [1] Getting default RColorBrewer palette 'Dark2' of type 'qual'...

<img src="man/figures/README-discrete colours-10.png" width="100%" />

    #> [1] Getting default RColorBrewer palette 'Dark2' of type 'qual'...

<img src="man/figures/README-discrete colours-11.png" width="100%" />

    #> Warning in if (!areColours(pal)) {: the condition has length > 1 and only
    #> the first element will be used

<img src="man/figures/README-discrete colours-12.png" width="100%" />

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
