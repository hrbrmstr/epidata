% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/minimum-wage.R
\name{get_minimum_wage}
\alias{get_minimum_wage}
\title{Minimum wage}
\usage{
get_minimum_wage()
}
\value{
\code{tbl_df} with data filtered by the selected criteria.

data frame
}
\description{
Return tthe hourly minimum wage set by federal law. The real minimum wage is the federal
hourly minimum wage adjusted for inflation.
}
\details{
Wages are in 2016 dollars, excluding the nominal federal minimum wage. Share of average
wages based on the average wages of production and nonsupervisory workers. For state
minimum wages, see EPI’s minimum wage tracker.

Population sample: Production and nonsupervisory workers (average wages)
}
\note{
Data source: U.S. Department of Labor Wage and Hour Division | CES
}
\examples{
if (not_dos()) get_minimum_wage()
}
\references{
\href{https://www.epi.org/data/}{Economic Policy Institute Data Library}
}
