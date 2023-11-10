
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SummarizeByGroup

<!-- badges: start -->
<!-- badges: end -->

The goal of SummarizeByGroup is to …

## Installation

You can install the development version of SummarizeByGroup from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/SummarizeByGroup")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SummarizeByGroup)
library(MASS)
fn.Summarize.by.Group(Insurance, 'District', 'Claims')
#>   get(group) Count Metric_Sum Metric_Mean
#> 1          1    16       1381       86.31
#> 2          2    16        891       55.69
#> 3          3    16        553       34.56
#> 4          4    16        326       20.38
fn.Summarize.by.Group(Insurance, 'District', 'Holders')
#>   get(group) Count Metric_Sum Metric_Mean
#> 1          1    16      10545      659.06
#> 2          2    16       6653      415.81
#> 3          3    16       4167      260.44
#> 4          4    16       1994      124.62
```
