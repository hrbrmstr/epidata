
[![Travis-CI Build Status](https://travis-ci.org/hrbrmstr/epidata.svg?branch=master)](https://travis-ci.org/hrbrmstr/epidata)

`epidata` : Tools to Retrieve Economic Policy Institute Data Library Extracts

The [Economic Policy Institute](http://www.epi.org/data/) provides researchers, media, and the public with easily accessible, up-to-date, and comprehensive historical data on the American labor force. It is compiled from Economic Policy Institute analysis of government data sources. Use it to research wages, inequality, and other economic indicators over time and among demographic groups. Data is usually updated monthly.

The following functions are implemented:

-   `get_annual_wages_and_work_hours`: Retreive CPS ASEC Annual Wages and Work Hours
-   `get_black_white_wage_gap`: Retreive the percent by which hourly wages of black workers are less than hourly wages of white workers
-   `get_college_wage_premium`: Retreive the percent by which hourly wages of college graduates exceed those of otherwise equivalent high school graduates
-   `get_employment_to_population_ratio`: Retreive the share of the civilian noninstitutional population that is employed
-   `get_gender_wage_gap`: Retreive the percent by which hourly wages of female workers are less than hourly wages of male workers
-   `get_health_insurance_coverage`: Retreive Health Insurance Coverage
-   `get_hispanic_white_wage_gap`: Retreive the percent by which hourly wages of Hispanic workers are less than hourly wages of white workers
-   `get_labor_force_participation_rate`: Retreive the share of the civilian noninstitutional population that is in the labor force
-   `get_long_term_unemployment`: Retreive the share of the labor force that has been unemployed for six months or longer
-   `get_median_and_mean_wages`: Retreive the hourly wage in the middle of the wage distribution
-   `get_pension_coverage`: Retreive Pension Coverage
-   `get_non_high_school_wage_penalty`: Retreive the percent by which hourly wages of workers without a high school diploma (or equivalent) are less than wages of otherwise equivalent workers who have graduated from high school
-   `get_underemployment`: Retreive the share of the labor force that is "underemployed"
-   `get_unemployment`: Retreive the share of the labor force without a job
-   `get_unemployment_by_state`: Retreive the share of the labor force without a job (by state)
-   `get_union_coverage`: Retreive Union Coverage
-   `get_wages_by_education`: Retreive the average hourly wages of workers disaggregated by the highest level of education attained
-   `get_wages_by_percentile`: Retreive wages at ten distinct points in the wage distribution
-   `get_wage_decomposition`: Retreive Wage Decomposition
-   `get_wage_ratios`: Retreive the level of inequality within the hourly wage distribution.

### Installation

``` r
devtools::install_github("hrbrmstr/epidata")
```

### Usage

``` r
library(epidata)

# current verison
packageVersion("epidata")
```

    ## [1] '0.1.0'

``` r
get_black_white_wage_gap()
```

    ## # A tibble: 44 x 8
    ##     date white_median white_average black_median black_average gap_median gap_average gap_regression_based
    ##    <int>        <dbl>         <dbl>        <dbl>         <dbl>      <dbl>       <dbl>                <dbl>
    ##  1  1973        17.41         19.93        13.67         15.63      0.215       0.216                0.120
    ##  2  1974        16.94         19.46        13.51         15.38      0.203       0.210                0.107
    ##  3  1975        16.75         19.47        13.60         15.33      0.188       0.213                0.105
    ##  4  1976        16.94         19.63        13.62         15.94      0.196       0.188                0.089
    ##  5  1977        16.93         19.57        13.58         15.71      0.198       0.197                0.094
    ##  6  1978        16.93         19.68        13.55         15.92      0.200       0.191                0.092
    ##  7  1979        17.10         19.89        14.02         16.29      0.180       0.181                0.090
    ##  8  1980        16.79         19.47        13.67         15.93      0.185       0.182                0.092
    ##  9  1981        16.42         19.34        13.50         15.84      0.178       0.181                0.087
    ## 10  1982        16.68         19.51        13.34         15.65      0.200       0.198                0.103
    ## # ... with 34 more rows

``` r
get_underemployment()
```

    ## # A tibble: 325 x 2
    ##          date   all
    ##        <date> <dbl>
    ##  1 1989-12-01 0.093
    ##  2 1990-01-01 0.093
    ##  3 1990-02-01 0.093
    ##  4 1990-03-01 0.094
    ##  5 1990-04-01 0.094
    ##  6 1990-05-01 0.094
    ##  7 1990-06-01 0.094
    ##  8 1990-07-01 0.094
    ##  9 1990-08-01 0.095
    ## 10 1990-09-01 0.095
    ## # ... with 315 more rows

``` r
get_median_and_mean_wages("gr")
```

    ## # A tibble: 44 x 25
    ##     date median average men_median men_average women_median women_average white_median white_average black_median
    ##    <int>  <dbl>   <dbl>      <dbl>       <dbl>        <dbl>         <dbl>        <dbl>         <dbl>        <dbl>
    ##  1  1973  16.74   19.30      20.14       22.60        12.63         14.48        17.41         19.93        13.67
    ##  2  1974  16.37   18.91      19.88       22.17        12.54         14.22        16.94         19.46        13.51
    ##  3  1975  16.26   18.87      20.01       22.09        12.59         14.32        16.75         19.47        13.60
    ##  4  1976  16.36   19.11      19.65       22.33        12.72         14.71        16.94         19.63        13.62
    ##  5  1977  16.28   19.00      20.09       22.33        12.66         14.54        16.93         19.57        13.58
    ##  6  1978  16.57   19.07      20.29       22.46        12.72         14.62        16.93         19.68        13.55
    ##  7  1979  16.36   19.30      20.55       22.75        12.82         14.82        17.10         19.89        14.02
    ##  8  1980  16.28   18.89      20.24       22.28        12.76         14.65        16.79         19.47        13.67
    ##  9  1981  15.85   18.75      19.77       22.09        12.69         14.62        16.42         19.34        13.50
    ## 10  1982  15.95   18.89      19.54       22.24        12.76         14.87        16.68         19.51        13.34
    ## # ... with 34 more rows, and 15 more variables: black_average <dbl>, hispanic_median <dbl>, hispanic_average <dbl>,
    ## #   white_men_median <dbl>, white_men_average <dbl>, black_men_median <dbl>, black_men_average <dbl>,
    ## #   hispanic_men_median <dbl>, hispanic_men_average <dbl>, white_women_median <dbl>, white_women_average <dbl>,
    ## #   black_women_median <dbl>, black_women_average <dbl>, hispanic_women_median <dbl>, hispanic_women_average <dbl>

### Extended Example

``` r
library(tidyverse)
library(epidata)
library(ggrepel)
library(hrbrthemes)

unemployment <- get_unemployment()
wages <- get_median_and_mean_wages()

glimpse(wages)
```

    ## Observations: 44
    ## Variables: 3
    ## $ date    <int> 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 198...
    ## $ median  <dbl> 16.74, 16.37, 16.26, 16.36, 16.28, 16.57, 16.36, 16.28, 15.85, 15.95, 15.91, 15.91, 16.00, 16.47, 1...
    ## $ average <dbl> 19.30, 18.91, 18.87, 19.11, 19.00, 19.07, 19.30, 18.89, 18.75, 18.89, 18.91, 18.99, 19.20, 19.66, 1...

``` r
glimpse(unemployment)
```

    ## Observations: 457
    ## Variables: 2
    ## $ date <date> 1978-12-01, 1979-01-01, 1979-02-01, 1979-03-01, 1979-04-01, 1979-05-01, 1979-06-01, 1979-07-01, 1979-...
    ## $ all  <dbl> 0.061, 0.061, 0.060, 0.060, 0.059, 0.059, 0.059, 0.058, 0.058, 0.058, 0.059, 0.059, 0.059, 0.059, 0.05...

``` r
group_by(unemployment, date=as.integer(lubridate::year(date))) %>%
  summarise(rate=mean(all)) %>%
  left_join(select(wages, date, median), by="date") %>%
  filter(!is.na(median)) %>%
  arrange(date) -> df

cols <- ggthemes::tableau_color_pal()(3)

update_geom_font_defaults(font_rc)

ggplot(df, aes(rate, median)) +
  geom_path(color=cols[1], arrow=arrow(type="closed", length=unit(10, "points"))) +
  geom_point() +
  geom_label_repel(aes(label=date),
                   alpha=c(1, rep((4/5), (nrow(df)-2)), 1),
                   size=c(5, rep(3, (nrow(df)-2)), 5),
                   color=c(cols[2],
                           rep("#2b2b2b", (nrow(df)-2)),
                           cols[3]),
                   family=font_rc) +
  scale_x_continuous(name="Unemployment Rate", expand=c(0,0.001), label=scales::percent) +
  scale_y_continuous(name="Median Wage", expand=c(0,0.25), label=scales::dollar) +
  labs(title="U.S. Unemployment Rate vs Median Wage Since 1978",
       subtitle="Wage data is in 2015 USD",
       caption="Source: EPI analysis of Current Population Survey Outgoing Rotation Group microdata") +
  theme_ipsum_rc(grid="XY")
```

<img src="README_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-4-1.png" width="960" />

### Test Results

``` r
library(epidata)
library(testthat)

date()
```

    ## [1] "Tue Aug  1 18:06:05 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 21 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
