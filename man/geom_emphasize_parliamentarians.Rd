% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_emphasize_parliamentarians.R
\name{geom_emphasize_parliamentarians}
\alias{geom_emphasize_parliamentarians}
\title{Emphasize certain parliamentarians (for example, female members of parliament) by increasing transparency on the remaining observations.}
\usage{
geom_emphasize_parliamentarians(expr)
}
\arguments{
\item{expr}{The observation that you wish to emphasize}
}
\description{
Emphasize certain parliamentarians (for example, female members of parliament) by increasing transparency on the remaining observations.
}
\examples{
data <- election_data[
  election_data$country == "USA" &
  election_data$house == "Representatives" &
  election_data$year == "2016",
]
usa_data <- parliament_data(
  election_data = data,
  type = "semicircle",
  party_seats = data$seats,
  parl_rows = 8
)

women_in_congress <- c(1, 0, 0, 1)
number_of_women <- c(23, 218, 133, 61)

usa_data$women <- rep(women_in_congress, number_of_women)

ggplot2::ggplot(usa_data, ggplot2::aes(x, y, colour=party_long)) +
  geom_parliament_seats() +
  geom_emphasize_parliamentarians(women == 1) +
  theme_ggparliament(legend = FALSE) +
  ggplot2::scale_colour_manual(values = usa_data$colour, limits = usa_data$party_long) +
  ggplot2::labs(title = "Women in Congress")
}
\author{
Zoe Meers
}
